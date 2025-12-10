if Config.Framework ~= "qb" then
    return
end

debugprint("Loading QB")

QB = exports["qb-core"]:GetCoreObject()

while not LocalPlayer.state.isLoggedIn do
    Wait(500)
end

debugprint("QB loaded")

local playerJob = QB.Functions.GetPlayerData().job

debugprint("QB: Initial job", playerJob)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(jobInfo)
    playerJob = jobInfo

    TriggerEvent("lb-news:jobUpdated")
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    playerJob = QB.Functions.GetPlayerData().job

    TriggerEvent("lb-news:jobUpdated")
end)

function HasPermission(permission)
    if playerJob?.name ~= Config.JobName then
        return false
    end

    return playerJob.grade.level >= Config.Permissions[permission]
end

function IsAdmin()
    return AwaitCallback("isAdmin")
end
