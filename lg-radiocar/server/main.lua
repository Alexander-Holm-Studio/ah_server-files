-- Server side logic for syncing
RegisterNetEvent("lg-radiocar:sync")
AddEventHandler("lg-radiocar:sync", function(url, name)
    local src = source
    TriggerClientEvent("lg-radiocar:play", -1, url, name, src)
end)
