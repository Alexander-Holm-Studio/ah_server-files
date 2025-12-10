if Config.Framework ~= "qb" then
    return
end

---@param search string
---@param page? number
function SearchPeople(search, page)
    local params = {}
    local sqlQuery = [[
        SELECT
            u.citizenid,
            u.charinfo,
            u.job

        FROM players u
        {JOIN}

        {WHERE}

        LIMIT ?, ?
    ]]

    local join = ""
    local where = ""

    if IsOnlyNumbers(search) then
        join = "LEFT JOIN phone_phones p ON p.owner_id = u.citizenid COLLATE UTF8MB4_GENERAL_CI"
        where = "WHERE p.phone_number LIKE ?"
        params[#params+1] = search .. "%"
    else
        where = "WHERE CONCAT(JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.firstname')), ' ', JSON_UNQUOTE(JSON_EXTRACT(charinfo, '$.lastname'))) LIKE ?"
        params[#params+1] = "%" .. search .. "%"
    end

    if Config.HiddenPersons and #Config.HiddenPersons > 0 then
        where = where .. " AND u.citizenid NOT IN (?)"
        params[#params+1] = Config.HiddenPersons
    end

    sqlQuery = sqlQuery:gsub("{JOIN}", join)
    sqlQuery = sqlQuery:gsub("{WHERE}", where)

    params[#params+1] = (page or 0) * 10
    params[#params+1] = 10

    local players = MySQL.query.await(sqlQuery, params)

    for i = 1, #players do
        local player = players[i]
        local charinfo = json.decode(player.charinfo)
        local job = json.decode(player.job)

        players[i] = {
            identifier = player.citizenid,
            name = charinfo.firstname .. " " .. charinfo.lastname,
            dob = charinfo.birthdate,
            job = job.label,
            jobGrade = job.grade.name,
            isMale = charinfo.gender == 0
        }
    end

    return players
end

---@return number
function GetTotalUserCount()
    return MySQL.scalar.await("SELECT COUNT(1) FROM players") or 0
end

---@param search string
---@param page? number
function SearchVehicles(search, page)
    local params = {}
    local sqlQuery = [[
        SELECT
            v.plate,
            v.mods AS vehicle,
            v.citizenid AS identifier,
            CONCAT(JSON_UNQUOTE(JSON_EXTRACT(u.charinfo, '$.firstname')), ' ', JSON_UNQUOTE(JSON_EXTRACT(u.charinfo, '$.lastname'))) AS `owner`

        FROM
            player_vehicles v

        {JOIN}

        LEFT JOIN players u ON
            u.citizenid = v.citizenid

        {WHERE}

        LIMIT
            ?, ?
    ]]

    local join = ""
    local where = ""

    if IsOnlyNumbers(search) then
        join = "LEFT JOIN phone_phones p ON p.owner_id = v.citizenid COLLATE UTF8MB4_GENERAL_CI"
        where = "WHERE p.phone_number LIKE ?"
        params[#params+1] = search .. "%"
    else
        where = "WHERE v.plate LIKE ?"
        params[#params+1] = "%" .. search .. "%"
    end

    if Config.HiddenVehicles and #Config.HiddenVehicles > 0 then
        where = where .. " AND v.plate NOT IN (?)"

        params[#params+1] = Config.HiddenVehicles
    end

    sqlQuery = sqlQuery:gsub("{JOIN}", join)
    sqlQuery = sqlQuery:gsub("{WHERE}", where)

    params[#params+1] = (page or 0) * 10
    params[#params+1] = 10

    return MySQL.query.await(sqlQuery, params)
end

---@return number
function GetTotalVehicleCount()
    return MySQL.scalar.await("SELECT COUNT(1) FROM player_vehicles") or 0
end
