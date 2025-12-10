-- Custom functions for ESX Tablet Script
-- You can modify these functions to fit your server's needs

local Custom = {}

-- Custom notification function
function Custom.showNotification(message, type)
    -- You can replace this with your preferred notification system
    -- Examples: ox_lib, mythic_notify, etc.
    ESX.ShowNotification(message)
end

-- Custom emote functions (if you want to use a different emote system)
function Custom.startTabletEmote()
    ExecuteCommand("e tablet2")
end

function Custom.stopTabletEmote()
    ExecuteCommand("e c")
end

-- Custom access denied function
function Custom.accessDenied()
    Custom.showNotification("~r~Du har ikke adgang til dette.", "error")
end

return Custom