if Config.Framework ~= "custom" then
    return
end

infoprint("info", "Framework is set to custom. Please implement your own framework functions to the script.")

---@param source number
---@return boolean
function IsAdmin(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return IsPlayerAceAllowed(source, "command") == 1
end

---@param source number
---@return string?
function GetIdentifier(source)
    ---@diagnostic disable-next-line: param-type-mismatch
    return GetPlayerIdentifierByType(source, "license")
end

---@param identifier string
---@return number?
function GetSourceFromIdentifier(identifier)
    local players = GetPlayers()

    for i = 1, #players do
        ---@diagnostic disable-next-line: param-type-mismatch
        if GetIdentifier(players[i]) == identifier then
            ---@diagnostic disable-next-line: return-type-mismatch
            return players[i]
        end
    end
end

---@param source number
---@return string firstName
---@return string lastName
function GetCharacterName(source)
    return GetPlayerName(source), ""
end

---@param source number
---@return boolean
function HasPermission(source, permission)
    return true
end
