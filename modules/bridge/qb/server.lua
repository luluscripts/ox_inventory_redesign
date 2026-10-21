local Inventory = require 'modules.inventory.server'
local QBCore = exports['qb-core']:GetCoreObject()

local function getGroups(playerData)
    local groups = {}
    local job, gang = playerData.job, playerData.gang
    if job and job.name and job.name ~= 'unemployed' then groups[job.name] = job.grade and job.grade.level or 0 end
    if gang and gang.name and gang.name ~= 'none' then groups[gang.name] = gang.grade and gang.grade.level or 0 end
    return groups
end

local function setupPlayer(playerData)
    -- server.lua defines setPlayerInventory only after its db module has finished loading
    while not server.setPlayerInventory do Wait(50) end

    playerData.identifier = playerData.citizenid
    playerData.name = ('%s %s'):format(playerData.charinfo.firstname, playerData.charinfo.lastname)
    playerData.groups = getGroups(playerData)
    playerData.sex = playerData.charinfo.gender
    playerData.dateofbirth = playerData.charinfo.birthdate
    server.setPlayerInventory(playerData)

    local accounts = Inventory.GetAccountItemCounts(playerData.source)
    if not accounts then return end
    for account in pairs(accounts) do
        local playerAccount = account == 'money' and 'cash' or account
        Inventory.SetItem(playerData.source, account, playerData.money[playerAccount])
    end
end

AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
    setupPlayer(player.PlayerData)
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(source)
    server.playerDropped(source)
end)

local function updateGroups(source)
    local inventory = Inventory(source)
    local player = QBCore.Functions.GetPlayer(source)
    if not inventory or not player then return end
    inventory.player.groups = getGroups(player.PlayerData)
end

AddEventHandler('QBCore:Server:OnJobUpdate', updateGroups)
AddEventHandler('QBCore:Server:OnGangUpdate', updateGroups)

-- qb-core keeps cash in PlayerData.money; mirror it into the 'money' item
AddEventHandler('QBCore:Server:OnMoneyChange', function(source, moneytype)
    if moneytype ~= 'cash' then return end
    local player = QBCore.Functions.GetPlayer(source)
    if not player or not Inventory(source) then return end
    local cash = player.PlayerData.money.cash
    if Inventory.GetItemCount(source, 'money') ~= cash then
        Inventory.SetItem(source, 'money', cash)
    end
end)

SetTimeout(500, function()
    for _, player in pairs(QBCore.Functions.GetQBPlayers()) do setupPlayer(player.PlayerData) end
end)

function server.UseItem(source, itemName, data)
    local usable = QBCore.Functions.CanUseItem(itemName)
    -- qb-core stores usable items as { func = fn, resource = name }
    local cb = type(usable) == 'table' and usable.func or usable
    if cb then
        -- qb scripts read item.info instead of item.metadata
        data.info = data.metadata
        cb(source, data)
    end
    -- usingItem is cleared by ox itself when the client confirms via usedItemInternal
end

local Items = require 'modules.items.server'

-- converts a player's old qb-inventory JSON ({ name, amount, info, slot }) on first login
---@diagnostic disable-next-line: duplicate-set-field
function server.convertInventory(playerId, items)
    local converted, totalWeight = {}, 0
    for _, v in pairs(items) do
        local item = type(v) == 'table' and Items(v.name)
        local count = item and (v.amount or v.count)
        if item and count and count > 0 and v.slot then
            local metadata = Items.CheckMetadata(v.info or v.metadata or {}, item, item.name, os.time())
            local weight = Inventory.SlotWeight(item, { count = count, metadata = metadata })
            totalWeight += weight
            converted[v.slot] = { name = item.name, label = item.label, weight = weight, slot = v.slot, count = count,
                description = item.description, metadata = metadata, stack = item.stack, close = item.close }
        end
    end
    return converted, totalWeight
end

---@diagnostic disable-next-line: duplicate-set-field
function server.setPlayerData(player)
    return {
        source = player.source,
        name = player.name,
        groups = player.groups or getGroups(player),
        sex = player.sex,
        dateofbirth = player.dateofbirth,
    }
end

---@diagnostic disable-next-line: duplicate-set-field
function server.syncInventory(inv)
    local accounts = Inventory.GetAccountItemCounts(inv)
    if not accounts then return end

    local player = QBCore.Functions.GetPlayer(inv.id)
    if not player then return end
    player.Functions.SetPlayerData('items', inv.items)

    for account, amount in pairs(accounts) do
        account = account == 'money' and 'cash' or account
        if player.Functions.GetMoney(account) ~= amount then
            player.Functions.SetMoney(account, amount, 'Sync ' .. account .. ' with inventory')
        end
    end
end

---@diagnostic disable-next-line: duplicate-set-field
function server.hasLicense(inv, license)
    local player = QBCore.Functions.GetPlayer(inv.id)
    return player and player.PlayerData.metadata.licences and player.PlayerData.metadata.licences[license]
end

---@diagnostic disable-next-line: duplicate-set-field
function server.buyLicense(inv, license)
    local player = QBCore.Functions.GetPlayer(inv.id)
    if not player then return end

    local licences = player.PlayerData.metadata.licences or {}
    if licences[license.name] then
        return false, 'already_have'
    elseif Inventory.GetItem(inv, 'money', false, true) < license.price then
        return false, 'can_not_afford'
    end

    Inventory.RemoveItem(inv, 'money', license.price)
    licences[license.name] = true
    player.Functions.SetMetaData('licences', licences)

    return true, 'have_purchased'
end

---@diagnostic disable-next-line: duplicate-set-field
function server.isPlayerBoss(playerId, group, grade)
    local job = QBCore.Shared.Jobs[group] or QBCore.Shared.Gangs[group]
    local g = job and job.grades[tostring(grade)] or job and job.grades[grade]
    return g and g.isboss or false
end

---@diagnostic disable-next-line: duplicate-set-field
function server.getOwnedVehicleId(entityId)
    return GetVehicleNumberPlateText(entityId):match('^%s*(.-)%s*$')
end
