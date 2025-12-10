if Config.Framework ~= "esx" then
    return
end

debugprint("Loading ESX")

local export, obj = pcall(function()
    return exports.es_extended:getSharedObject()
end)

if export then
    ESX = obj
else
    while not ESX do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)

        Wait(500)
    end
end

RegisterNetEvent("esx:playerLoaded", function(playerData)
    ESX.PlayerData = playerData
    ESX.PlayerLoaded = true
end)

RegisterNetEvent("esx:onPlayerLogout", function()
    ESX.PlayerData = {}
end)

while not ESX.PlayerLoaded do
    Wait(500)
end

RegisterNetEvent("esx:setJob", function(job)
    ESX.PlayerData.job = job

    TriggerEvent("lb-news:jobUpdated")
end)

debugprint("ESX loaded")

function HasPermission(permission)
    local job = ESX.PlayerData.job

    if job?.name ~= Config.JobName then
        return false
    end

    return job.grade >= Config.Permissions[permission]
end

function IsAdmin()
    return AwaitCallback("isAdmin")
end
