local display = false

RegisterNetEvent("lg-radiocar:openUI")
AddEventHandler("lg-radiocar:openUI", function()
    SetDisplay(true)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        list = Config.defaultList
    })
end

RegisterNUICallback("close", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("play", function(data)
    TriggerServerEvent("lg-radiocar:sync", data.url, data.name)
end)

RegisterNetEvent("lg-radiocar:play")
AddEventHandler("lg-radiocar:play", function(url, name, sourcePlayer)
    if sourcePlayer ~= GetPlayerServerId(PlayerId()) then
        SendNUIMessage({
            type = "play",
            url = url,
            name = name
        })
    end
end)

RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
end)

-- Command to open radio (fallback)
RegisterCommand(Config.CommandLabel, function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        -- Use the utility function to check ownership/permissions
        if CheckPlayerCar then
            CheckPlayerCar(vehicle)
        else
            -- Fallback if utils not loaded or function missing
            TriggerEvent("lg-radiocar:openUI")
        end
    else
        -- Optional: Notify player they must be in a vehicle
    end
end, false)

-- Key mapping
if Config.KeyForRadio then
    RegisterKeyMapping(Config.CommandLabel, 'Open Car Radio', 'keyboard', Config.KeyForRadio)
end
