if Config.Framework ~= "custom" then
    return
end

infoprint("info", "Framework is set to custom. Please implement your own framework functions to the script.")

function HasPermission(permission)
    return true
end

function IsAdmin()
    return AwaitCallback("isAdmin")
end
