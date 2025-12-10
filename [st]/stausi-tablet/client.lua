-- ESX Tablet Script - Optimized for ESX Only
local ESX = exports['es_extended']:getSharedObject()
local PlayerData = {}
local tabletOpen = false

-- Initialize player data
CreateThread(function()
    while not ESX.GetPlayerData().job do
        Wait(100)
    end
    PlayerData = ESX.GetPlayerData()
end)

-- Emote functions
local function playTabletEmote()
    if Config.useEmotes then
        ExecuteCommand(Config.emotes.start)
    end
end

local function stopTabletEmote()
    if Config.useEmotes then
        ExecuteCommand(Config.emotes.stop)
    end
end

-- Open tablet function
local function openTablet(jobConfig)
    if not jobConfig then return end
    
    playTabletEmote()
    SendNUIMessage({
        action = "show",
        url = jobConfig.url
    })
    SetNuiFocus(true, true)
    tabletOpen = true
    
    -- Update logo
    SendNUIMessage({
        action = "updateLogos",
        logoUrl = jobConfig.logo,
        selector = "img[src*='logo_stort.png']"
    })
end

-- Close tablet function
local function closeTablet()
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hide" })
    tabletOpen = false
    stopTabletEmote()
end

-- Check if player has job access
local function hasJobAccess(jobName)
    return PlayerData and PlayerData.job and PlayerData.job.name == jobName
end

-- Register commands for each job
for _, jobConfig in pairs(Config.jobs) do
    RegisterCommand(jobConfig.command, function()
        if hasJobAccess(jobConfig.name) then
            openTablet(jobConfig)
        else
            ESX.ShowNotification(Config.notifications.access_denied)
        end
    end, false)
end

-- NUI Callbacks
RegisterNUICallback('close', function(data, cb)
    closeTablet()
    
end)

-- ESX Events
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
    if PlayerData then
        PlayerData.job = job
    end
end)

-- Close tablet when player dies or gets arrested
RegisterNetEvent('esx:onPlayerDeath', function()
    if tabletOpen then
        closeTablet()
    end
end)

-- Key mapping for easy access (F5)
RegisterKeyMapping('opentablet', 'Open Tablet', 'keyboard', 'F5')

-- Handle the F5 key press
RegisterCommand('opentablet', function()
    if not PlayerData or not PlayerData.job then return end
    
    local jobName = PlayerData.job.name
    local jobConfig = Config.jobs[jobName]
    
    if jobConfig and hasJobAccess(jobName) then
        openTablet(jobConfig)
    else
        ESX.ShowNotification(Config.notifications.access_denied)
    end
end, false)