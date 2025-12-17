local function broadcastPlayerCount(target)
    local playerCount = #GetPlayers()

    if target then
        TriggerClientEvent('watermark:updatePlayerCount', target, playerCount)
    else
        TriggerClientEvent('watermark:updatePlayerCount', -1, playerCount)
    end
end

RegisterNetEvent('watermark:requestPlayerCount', function()
    broadcastPlayerCount(source)
end)

AddEventHandler('playerJoining', function()
    broadcastPlayerCount()
end)

AddEventHandler('playerDropped', function()
    SetTimeout(200, broadcastPlayerCount)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        SetTimeout(500, broadcastPlayerCount)
    end
end)

RegisterCommand('myid', function(source, args)
    if source == 0 then
        print('This command can only be used in-game')
        return
    end

    TriggerClientEvent('chat:addMessage', source, {
        color = { 0, 255, 0 },
        multiline = true,
        args = { 'System', ('Your Server ID: %s'):format(source) }
    })
end, false)
