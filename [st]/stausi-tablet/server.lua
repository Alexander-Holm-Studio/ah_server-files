-- ESX Tablet Script - Server Side
local ESX = exports['es_extended']:getSharedObject()

-- Server-side job validation (optional security layer)
RegisterServerEvent('tablet:validateAccess')
AddEventHandler('tablet:validateAccess', function(jobName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    local hasAccess = xPlayer.job.name == jobName
    TriggerClientEvent('tablet:accessResult', source, hasAccess, jobName)
end)

-- Log tablet usage (optional)
RegisterServerEvent('tablet:logUsage')
AddEventHandler('tablet:logUsage', function(jobName, action)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    
    print(('[TABLET] %s (%s) %s %s tablet'):format(
      xPlayer.getName(),
        xPlayer.identifier,
        action,
        jobName
    ))
end)