if not lib then return end

local Stock = {}
Stock.ready = false

CreateThread(function()
    MySQL.query.await([[
        CREATE TABLE IF NOT EXISTS `ox_inventory_shop_stock` (
            `shop_id` VARCHAR(100) NOT NULL,
            `slot` SMALLINT UNSIGNED NOT NULL,
            `count` INT NOT NULL DEFAULT 0,
            `restock_at` INT UNSIGNED DEFAULT NULL,
            PRIMARY KEY (`shop_id`, `slot`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
    ]])

    Stock.ready = true
end)

local function ensureReady()
    if Stock.ready then return end
    while not Stock.ready do Wait(10) end
end

function Stock.Resolve(shop)
    if not shop or not shop.id or not shop.items then return end

    local hasTracked = false

    for i = 1, shop.slots do
        local item = shop.items[i]

        if item and item.maxCount then
            hasTracked = true
            break
        end
    end

    if not hasTracked then return end

    ensureReady()

    local rows = MySQL.query.await(
        'SELECT `slot`, `count`, `restock_at` FROM `ox_inventory_shop_stock` WHERE `shop_id` = ?',
        { shop.id }
    )

    local bySlot = {}

    if rows then
        for i = 1, #rows do
            bySlot[rows[i].slot] = rows[i]
        end
    end

    local now = os.time()
    local expired

    for i = 1, shop.slots do
        local item = shop.items[i]

        if item and item.maxCount then
            local row = bySlot[i]

            if row then
                if row.restock_at and now >= row.restock_at then
                    item.count = item.maxCount
                    expired = expired or {}
                    expired[#expired + 1] = i
                else
                    item.count = row.count
                end
            else
                item.count = item.maxCount
            end
        end
    end

    if expired then
        local queries = {}

        for i = 1, #expired do
            queries[i] = {
                query = 'DELETE FROM `ox_inventory_shop_stock` WHERE `shop_id` = ? AND `slot` = ?',
                values = { shop.id, expired[i] }
            }
        end

        MySQL.transaction(queries)
    end
end

---@param applied boolean? true when item.count was already reduced by the caller (2.48 buy flow)
function Stock.RecordPurchase(shop, slot, purchased, applied)
    local item = shop.items[slot]
    if not item or not item.maxCount then return end

    local newCount = applied and (item.count or 0) or (item.count or item.maxCount) - purchased
    if newCount < 0 then newCount = 0 end

    local restockAt

    if newCount <= 0 and item.stockDuration and item.stockDuration > 0 then
        restockAt = os.time() + math.floor(item.stockDuration * 3600)
    end

    item.count = newCount

    ensureReady()

    MySQL.prepare(
        'INSERT INTO `ox_inventory_shop_stock` (`shop_id`, `slot`, `count`, `restock_at`) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE `count` = VALUES(`count`), `restock_at` = VALUES(`restock_at`)',
        { shop.id, slot, newCount, restockAt }
    )
end

function Stock.GetRestockRemaining(shop, slot)
    ensureReady()

    local restockAt = MySQL.scalar.await(
        'SELECT `restock_at` FROM `ox_inventory_shop_stock` WHERE `shop_id` = ? AND `slot` = ?',
        { shop.id, slot }
    )

    if not restockAt then return 0 end

    local remaining = restockAt - os.time()
    return remaining > 0 and remaining or 0
end

return Stock
