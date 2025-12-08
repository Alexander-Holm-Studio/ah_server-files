local doors = {}
local playerJob = nil
local ESX = nil

-- Wait for ESX to be ready
CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Wait(100)
    end

    local playerData = ESX.GetPlayerData()
    if playerData and playerData.job then
        playerJob = playerData.job.name
    end
end)

-- Get player job
RegisterNetEvent('esx:setJob', function(job)
    playerJob = job.name
end)


-- Load door configurations
local function loadDoorConfigs()
    local doorConfigs = {}
    local configFiles = {
        'gabz_mrpd',
        'gabz_pillbox',
        -- Add more config files here
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

    return doorConfigs
end

-- Initialize doors
CreateThread(function()
    Wait(1000)

    local doorConfigs = loadDoorConfigs()
    local processedDoors = {}

    for id, doorData in ipairs(doorConfigs) do
        -- Skip if this door was already processed as part of a double door
        if processedDoors[id] then
            goto continue
        end

        doors[id] = {
            id = id,
            model = doorData.model,
            coords = doorData.coords,
            locked = doorData.locked or false,
            jobs = doorData.jobs or Config.DefaultJobs,
            distance = doorData.distance or Config.InteractDistance,
            heading = doorData.heading,
            double = doorData.double,
            doubleDoor = doorData.doubleDoor
        }

        -- Set initial door state
        local door = doors[id]
        local doorHash = type(door.model) == 'string' and joaat(door.model) or door.model

        if door.double and door.doubleDoor and doorConfigs[id + 1] then
            -- Double door setup - this is door 1, next entry is door 2
            local door2Data = doorConfigs[id + 1]
            local door2Hash = type(door2Data.model) == 'string' and joaat(door2Data.model) or door2Data.model
            local door2Id = id + 1

            -- Register both doors
            AddDoorToSystem(id, doorHash, door.coords.x, door.coords.y, door.coords.z, false, false, false)
            DoorSystemSetDoorState(id, door.locked and 1 or 0, false, false)

            AddDoorToSystem(door2Id, door2Hash, door2Data.coords.x, door2Data.coords.y, door2Data.coords.z, false, false,
                false)
            DoorSystemSetDoorState(door2Id, door.locked and 1 or 0, false, false)

            door.door2Id = door2Id

            -- Mark both doors as processed
            processedDoors[id] = true
            processedDoors[door2Id] = true

            -- Add ONE ox_target zone for the double door (at midpoint)
            if Config.UseTarget then
                local midX = (door.coords.x + door2Data.coords.x) / 2
                local midY = (door.coords.y + door2Data.coords.y) / 2
                local midZ = (door.coords.z + door2Data.coords.z) / 2

                exports.ox_target:addSphereZone({
                    coords = vector3(midX, midY, midZ),
                    radius = door.distance,
                    options = {
                        {
                            name = 'doorlock_' .. id,
                            icon = 'fas fa-door-closed',
                            label = 'Toggle Door Lock',
                            onSelect = function()
                                TriggerServerEvent('ox_doorlock:toggleDoor', id)
                            end,
                            canInteract = function()
                                return hasAccess(door.jobs)
                            end,
                            distance = door.distance
                        }
                    }
                })
            end
        else
            -- Single door
            AddDoorToSystem(id, doorHash, door.coords.x, door.coords.y, door.coords.z, false, false, false)
            DoorSystemSetDoorState(id, door.locked and 1 or 0, false, false)

            processedDoors[id] = true

            -- Add ox_target zone for single door
            if Config.UseTarget then
                exports.ox_target:addSphereZone({
                    coords = door.coords,
                    radius = door.distance,
                    options = {
                        {
                            name = 'doorlock_' .. id,
                            icon = 'fas fa-door-closed',
                            label = 'Toggle Door Lock',
                            onSelect = function()
                                TriggerServerEvent('ox_doorlock:toggleDoor', id)
                            end,
                            canInteract = function()
                                return hasAccess(door.jobs)
                            end,
                            distance = door.distance
                        }
                    }
                })
            end
        end

        ::continue::
    end

    print('[ox_doorlock] Loaded ' .. #doors .. ' doors')

    -- Request sync from server
    TriggerServerEvent('ox_doorlock:requestSync')
end) -- Check if player has access
function hasAccess(jobs)
    if not playerJob then return false end

    for _, job in ipairs(jobs) do
        if job == playerJob then
            return true
        end
    end

    return false
end

-- Update door state
RegisterNetEvent('ox_doorlock:setState', function(doorId, locked, showNotification)
    local door = doors[doorId]
    if not door then return end

    door.locked = locked

    if door.double and door.door2Id then
        -- Double door
        DoorSystemSetDoorState(doorId, locked and 1 or 0, false, false)
        DoorSystemSetDoorState(door.door2Id, locked and 1 or 0, false, false)
    else
        -- Single door
        DoorSystemSetDoorState(doorId, locked and 1 or 0, false, false)
    end

    -- Only show feedback if this is not an initial sync
    if showNotification then
        -- Play sound
        if locked then
            PlaySoundFrontend(-1, 'DOOR_LOCK', 'GTAO_EXEC_SECUROSERV_COMPUTER_SOUNDS', true)
        else
            PlaySoundFrontend(-1, 'DOOR_UNLOCK', 'GTAO_EXEC_SECUROSERV_COMPUTER_SOUNDS', true)
        end

        -- Show notification
        if Config.ShowText then
            lib.notify({
                title = 'Door Lock',
                description = locked and 'Door locked' or 'Door unlocked',
                type = locked and 'error' or 'success'
            })
        end
    end
end)

-- Get door state (for other resources)
exports('getDoorState', function(doorId)
    return doors[doorId] and doors[doorId].locked
end)
