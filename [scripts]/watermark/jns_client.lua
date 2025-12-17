local playerId = 0
local playerCount = 0

local function refreshPlayerId()
    playerId = GetPlayerServerId(PlayerId())
end

local function refreshWatermark()
    SendNUIMessage({
        action = "updateWatermark",
        id = playerId,
        count = playerCount
    })
end

RegisterNetEvent('watermark:updatePlayerCount', function(count)
    if type(count) ~= "number" then
        return
    end

    playerCount = count
    refreshWatermark()
end)

AddEventHandler('playerSpawned', function()
    refreshPlayerId()
    refreshWatermark()
end)

CreateThread(function()
    Wait(750)
    refreshPlayerId()
    refreshWatermark()
    TriggerServerEvent('watermark:requestPlayerCount')
end)

CreateThread(function()
    while true do
        Wait(30000)
        refreshPlayerId()
        TriggerServerEvent('watermark:requestPlayerCount')
    end
end)
