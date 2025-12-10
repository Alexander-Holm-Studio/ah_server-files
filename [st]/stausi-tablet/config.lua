Config = {}

-- Job Configuration
Config.jobs = {
    police = {
        name = "police",
        command = "tablet",
        url = "http://localhost/police/pages/login.php",
        logo = "https://r2.fivemanage.com/LnnGKczEFgpRxvxjLg5xS/dansk-politi.png"
    },
    ambulance = {
        name = "ambulance", 
        command = "emstablet",
        url = "http://localhost/ems/pages/login.php",
        logo = "https://r2.fivemanage.com/LnnGKczEFgpRxvxjLg5xS/image_2025-04-10_000605678.png"
    }
}

-- Emote Configuration (set to false to disable emotes)
Config.useEmotes = true
Config.emotes = {
    start = "e tablet2",  -- Change this to your emote command or set useEmotes to false
    stop = "e c"          -- Change this to your stop emote command or set useEmotes to false
}

-- Notification Configuration
Config.notifications = {
    access_denied = "~r~Du har ikke adgang til dette."
}