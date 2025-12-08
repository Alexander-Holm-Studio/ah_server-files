local ESX = nil

-- Wait for ESX to be ready
CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Wait(100)
    end
end)
local doorStates = {}

-- Initialize door states from config
CreateThread(function()
    local doorConfigs = {}
    local configFiles = {
        'gabz_mrpd',
        'gabz_pillbox',
    }

    for _, configName in ipairs(configFiles) do
        local success, config = pcall(function()
            return require('configs.' .. configName)
        end)

        if success and config then
            for id, door in ipairs(config) do
                doorStates[id] = door.locked or false
            end
        end
    end

    print('[ox_doorlock] Initialized ' .. #doorStates .. ' door states')
end)

-- Check if player has permission
local function hasPermission(source, jobs)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    for _, job in ipairs(jobs) do
        if xPlayer.job.name == job then
            return true
        end
    end

    return false
end

-- Toggle door lock
RegisterNetEvent('ox_doorlock:toggleDoor', function(doorId)
    local source = source

    -- Get door configuration
    local doorConfigs = {}
    local configFiles = {
        'gabz_mrpd',
        'gabz_pillbox',
    }

    for _, configName in ipairs(configFiles) do
        local success, config = pcall(function()
            return require('configs.' .. configName)
        end)

        if success and config then
            for _, door in ipairs(config) do
                table.insert(doorConfigs, door)
            end
        end
    end

    local door = doorConfigs[doorId]
    if not door then
        print('[ox_doorlock] Door ID ' .. doorId .. ' not found')
        return
    end

    -- Check permission
    local jobs = door.jobs or Config.DefaultJobs
    if not hasPermission(source, jobs) then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Door Lock',
            description = 'You don\'t have permission to use this door',
            type = 'error'
        })
        return
    end

    -- Toggle state
    doorStates[doorId] = not (doorStates[doorId] or door.locked or false)

    -- Sync to all clients with notification enabled
    TriggerClientEvent('ox_doorlock:setState', -1, doorId, doorStates[doorId], true)

    print(('[ox_doorlock] Player %s toggled door %s to %s'):format(
        GetPlayerName(source),
        doorId,
        doorStates[doorId] and 'locked' or 'unlocked'
    ))
end)

-- Get door state
lib.callback.register('ox_doorlock:getState', function(source, doorId)
    return doorStates[doorId]
end)

-- Sync all door states to a client
RegisterNetEvent('ox_doorlock:requestSync', function()
    local source = source
    for doorId, locked in pairs(doorStates) do
        -- Send sync without notification (false parameter)
        TriggerClientEvent('ox_doorlock:setState', source, doorId, locked, false)
    end
end)

-- Admin command to set door state
RegisterCommand('doorlock', function(source, args)
    if source == 0 then
        -- Console command
        local doorId = tonumber(args[1])
        local state = args[2] == 'lock'

        if doorId then
            doorStates[doorId] = state
            TriggerClientEvent('ox_doorlock:setState', -1, doorId, state, true)
            print('[ox_doorlock] Door ' .. doorId .. ' set to ' .. (state and 'locked' or 'unlocked'))
        end
    else
        -- Player command (requires admin)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and xPlayer.getGroup() == 'admin' then
            local doorId = tonumber(args[1])
            local state = args[2] == 'lock'

            if doorId then
                doorStates[doorId] = state
                TriggerClientEvent('ox_doorlock:setState', -1, doorId, state, true)
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Door Lock',
                    description = 'Door ' .. doorId .. ' ' .. (state and 'locked' or 'unlocked'),
                    type = 'success'
                })
            end
        end
    end
end, true)
