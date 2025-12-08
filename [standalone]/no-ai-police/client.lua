-- Disable AI Police, Dispatch and Wanted System
-- Keeps normal NPCs active

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Disable police spawning
        for i = 1, 15 do
            EnableDispatchService(i, false)
        end

        -- Disable wanted level
        SetMaxWantedLevel(0)

        -- Remove player wanted level
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end

        -- Disable police vehicles
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)

        -- Disable police helicopters
        SetPoliceIgnorePlayer(PlayerId(), true)

        -- Disable automatic police spawning
        DistantCopCarSirens(false)
    end
end)

-- Disable police response to crimes
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local playerPed = PlayerPedId()

        -- Disable police response
        SetEveryoneIgnorePlayer(PlayerId(), true)
        SetPoliceIgnorePlayer(PlayerId(), true)

        -- Disable dispatch services
        SetDispatchCopsForPlayer(PlayerId(), false)

        -- Block police from chasing player
        if IsPedInAnyVehicle(playerPed, false) then
            SetVehicleCanBeUsedByFleeingPeds(GetVehiclePedIsIn(playerPed, false), false)
        end
    end
end)

-- Remove existing police vehicles and peds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) -- Check every 5 seconds

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        -- Remove police vehicles
        local vehicles = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) then
                local vehicleModel = GetEntityModel(vehicle)

                -- Check if it's a police vehicle
                if IsVehicleModel(vehicle, GetHashKey('police')) or
                    IsVehicleModel(vehicle, GetHashKey('police2')) or
                    IsVehicleModel(vehicle, GetHashKey('police3')) or
                    IsVehicleModel(vehicle, GetHashKey('police4')) or
                    IsVehicleModel(vehicle, GetHashKey('policeb')) or
                    IsVehicleModel(vehicle, GetHashKey('policeold1')) or
                    IsVehicleModel(vehicle, GetHashKey('policeold2')) or
                    IsVehicleModel(vehicle, GetHashKey('policet')) or
                    IsVehicleModel(vehicle, GetHashKey('sheriff')) or
                    IsVehicleModel(vehicle, GetHashKey('sheriff2')) or
                    GetVehicleClass(vehicle) == 18 then -- Emergency vehicles class
                    -- Only delete if no player is in it and it is not a mission entity
                    if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) and not IsEntityAMissionEntity(vehicle) then
                        SetEntityAsMissionEntity(vehicle, true, true)
                        DeleteVehicle(vehicle)
                    end
                end
            end
        end

        -- Remove police peds
        local peds = GetGamePool('CPed')
        for _, ped in ipairs(peds) do
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local pedType = GetPedType(ped)

                -- Check if it's a cop (type 6 = cop)
                if pedType == 6 then
                    SetEntityAsMissionEntity(ped, true, true)
                    DeletePed(ped)
                end
            end
        end
    end
end)

-- Disable specific scenario types for police
Citizen.CreateThread(function()
    -- Disable police scenarios
    SetScenarioTypeEnabled('WORLD_VEHICLE_POLICE_NEXT_TO_CAR', false)
    SetScenarioTypeEnabled('WORLD_VEHICLE_POLICE_CAR', false)
    SetScenarioTypeEnabled('WORLD_VEHICLE_POLICE_BIKE', false)

    -- Keep other scenarios active for normal NPCs
    SetScenarioTypeEnabled('WORLD_VEHICLE_ATTRACTOR', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_AMBULANCE', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_BUSINESSMEN', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_DRIVE_PASSENGERS', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_EMPTY', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_MECHANIC', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_PARK_PARALLEL', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_PASSENGER_EXIT', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_SALTON_DIRT_BIKE', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_SALTON', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_STREETRACE', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_TOURIST', true)
    SetScenarioTypeEnabled('WORLD_VEHICLE_TRUCK_LOGS', true)
end)

-- Disable police radio chatter
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Cancel police scanner audio
        CancelCurrentPoliceReport()

        -- Disable police radio
        SetAudioFlag('PoliceScannerDisabled', true)
    end
end)

-- Prevent police from being called
AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        local attacker = args[2]

        -- If player is attacker, prevent police dispatch
        if attacker == PlayerPedId() then
            ClearPlayerWantedLevel(PlayerId())
        end
    end
end)

print('^2[No AI Police]^7 AI Police and dispatch system disabled. Normal NPCs remain active.')
