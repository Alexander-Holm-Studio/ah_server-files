if Config.Framework ~= "qb" then
    return
end

debugprint("Loading QB")
QB = exports["qb-core"]:GetCoreObject()
debugprint("QB loaded")

---@param source number
---@return boolean
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return QB.Functions.HasPermission(source, "admin") or IsPlayerAceAllowed(source, "command") == 1
end

---@param source number
---@return string?
function GetIdentifier(source)
    return QB.Functions.GetPlayer(source)?.PlayerData.citizenid
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    return QB.Functions.GetPlayerByCitizenId(identifier)?.PlayerData.source
end

---@param source number
---@return string firstName
---@return string lastName
function GetCharacterName(source)
    local ch = QB.Functions.GetPlayer(source)?.PlayerData.charinfo

    return ch.firstname or GetPlayerName(source), ch.lastname or ""
end

---@param source number
---@return boolean
function HasPermission(source, permission)
    local job = QB.Functions.GetPlayer(source)?.PlayerData.job

    if job?.name ~= Config.JobName then
        return false
    end

    return job.grade.level >= Config.Permissions[permission]
end
