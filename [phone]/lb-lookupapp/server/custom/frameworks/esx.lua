if Config.Framework ~= "esx" then
    return
end

---@param search string
---@param page? number
function SearchPeople(search, page)
    local params = {}
    local sqlQuery = [[
        SELECT
            u.identifier,
            CONCAT(u.firstname, ' ', u.lastname) AS `name`,
            u.dateofbirth as dob,
            u.sex = "m" AS isMale,
            g.label AS jobGrade,
            j.label AS job

        FROM users u
        LEFT JOIN jobs j ON j.name = u.job
        LEFT JOIN job_grades g ON g.job_name = u.job AND g.grade = u.job_grade
        {JOIN}

        {WHERE}

        LIMIT ?, ?
    ]]

    local join = ""
    local where = ""

    if IsOnlyNumbers(search) then
        join = "LEFT JOIN phone_phones p ON p.owner_id = u.identifier"
        where = "WHERE p.phone_number LIKE ?"
        params[#params+1] = search .. "%"
    else
        where = "WHERE CONCAT(u.firstname, u.lastname) LIKE ?"
        params[#params+1] = "%" .. search .. "%"
    end

    if Config.HiddenPersons and #Config.HiddenPersons > 0 then
        where = where .. " AND u.identifier NOT IN (?)"
        params[#params+1] = Config.HiddenPersons
    end

    sqlQuery = sqlQuery:gsub("{JOIN}", join)
    sqlQuery = sqlQuery:gsub("{WHERE}", where)

    params[#params+1] = (page or 0) * 10
    params[#params+1] = 10

    return MySQL.query.await(sqlQuery, params)
end

---@return number
function GetTotalUserCount()
    return MySQL.scalar.await("SELECT COUNT(1) FROM users") or 0
end

---@param search string
---@param page? number
function SearchVehicles(search, page)
    local params = {}
    local sqlQuery = [[
        SELECT
            v.plate,
            v.vehicle,
            v.`owner` AS identifier,
            CONCAT(u.firstname, ' ', u.lastname) AS `owner`

        FROM
            owned_vehicles v

        {JOIN}

        LEFT JOIN users u ON
            u.identifier = v.`owner`

        {WHERE}
        AND v.`type` = "car"

        LIMIT
            ?, ?
    ]]

    local join = ""
    local where = ""

    if IsOnlyNumbers(search) then
        join = "LEFT JOIN phone_phones p ON p.owner_id = v.owner"
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
    return MySQL.scalar.await("SELECT COUNT(1) FROM owned_vehicles WHERE `type` = 'car'") or 0
end
