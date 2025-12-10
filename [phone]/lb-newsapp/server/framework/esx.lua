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
    TriggerEvent("esx:getSharedObject", function(obj)
        ESX = obj
    end)
end

debugprint("ESX loaded")

---@param source number
---@return boolean
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return ESX.GetPlayerFromId(source)?.getGroup() == "superadmin" or IsPlayerAceAllowed(source, "command") == 1
end

---@param source number
---@return string?
function GetIdentifier(source)
    return ESX.GetPlayerFromId(source)?.identifier
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)?.source
end

---@param source number
---@return string firstName
---@return string lastName
function GetCharacterName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local firstName, lastName

    if xPlayer.get and xPlayer.get("firstName") and xPlayer.get("lastName") then
        firstName = xPlayer.get("firstName")
        lastName = xPlayer.get("lastName")
    else
        local name = MySQL.Sync.fetchAll("SELECT `firstname`, `lastname` FROM `users` WHERE `identifier`=@identifier", {["@identifier"] = GetIdentifier(source)})

        firstName, lastName = name[1]?.firstname or GetPlayerName(source), name[1]?.lastname or ""
    end

    return firstName, lastName
end

---@param source number
---@return boolean
function HasPermission(source, permission)
    local job = ESX.GetPlayerFromId(source)?.getJob()

    if job?.name ~= Config.JobName then
        return false
    end

    return job.grade >= Config.Permissions[permission]
end
