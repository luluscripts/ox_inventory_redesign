AddStateBagChangeHandler('isLoggedIn', ('player:%s'):format(cache.serverId), function(_, _, value)
    if not value then client.onLogout() end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    local groups = PlayerData.groups or {}
    for name in pairs(groups) do if name == PlayerData.jobName then groups[name] = nil end end
    PlayerData.jobName = job.name
    if job.name ~= 'unemployed' then groups[job.name] = job.grade.level end
    client.setPlayerData('groups', groups)
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(gang)
    local groups = PlayerData.groups or {}
    for name in pairs(groups) do if name == PlayerData.gangName then groups[name] = nil end end
    PlayerData.gangName = gang.name
    if gang.name ~= 'none' then groups[gang.name] = gang.grade.level end
    client.setPlayerData('groups', groups)
end)

---@diagnostic disable-next-line: duplicate-set-field
function client.setPlayerStatus(values)
    for name, value in pairs(values) do
        if value > 100 or value < -100 then value = value * 0.0001 end
        local current = client.player:get(name) or 0
        client.player:setr(name, lib.math.clamp(current + value, 0, 100))
    end
end
