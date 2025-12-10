Config = {}

Config.Debug = false

Config.Framework = "auto"
Config.Language = "en" -- add your own language in config/locales/
Config.NotifyPhone = true
Config.NotifyTablet = true
Config.Notifications = "online" -- who should get notified when an article is published? options: "all", "online" or false

Config.Logs = {}
Config.Logs.Enabled = false
Config.Logs.Service = "discord" -- fivemanage, discord or ox_lib. if discord, set your webhook in server/apiKeys.lua
Config.Logs.Actions = {
    CreateArticle = true,   -- create new articles
    CreateCategory = true,  -- create new categories
    UpdateArticle = true,   -- update own articles
    DeleteArticle = true,   -- delete own articles
    DeleteOther = true,     -- delete other's articles
    UnpublishOther = true,  -- unpublish other's articles
    UpdateProfile = true,   -- update own profile
}

-- if you want to use the discord notifications, you need to enter your webhooks in server/apiKeys.lua
Config.DiscordNotifications = {
    newArticle = true,
    articleUpdated = true
}

Config.JobName = "reporter"

Config.Permissions = {
    create = 0, -- the grade required to create articles & have a profile on the app
    categories = 0, -- the grade required to be able to create new categories
    unpublish = 3, -- the grade required to unpublish others articles
}

Config.Header = {
    text = "Ludendorff Weekly",
    fontSize = "2em",
    color = {
        light = "#000000",
        dark = "#FFFFFF",
    },
    image = false -- Here you can set a link to an image. Please note that you can't use both image and text. For images, we recommend an aspect ratio of 1430:175.
}

Config.LBPhone = true -- add the app to lb-phone?
Config.LBTablet = true -- add the app to lb-tablet?

Config.DefaultApp = false
Config.Icon = "icon.svg"

Config.Screenshots = {
    Phone = {
        "screenshots/light/1.webp",
        "screenshots/dark/1.webp",
        "screenshots/light/2.webp",
        "screenshots/dark/2.webp",
        "screenshots/light/3.webp",
        "screenshots/dark/3.webp",
        "screenshots/light/4.webp",
        "screenshots/dark/4.webp",
        "screenshots/light/5.webp",
        "screenshots/dark/5.webp",
        "screenshots/light/6.webp",
        "screenshots/dark/6.webp",
        "screenshots/light/7.webp",
        "screenshots/dark/7.webp",
        "screenshots/light/8.webp",
        "screenshots/dark/8.webp"
    },
    Tablet = {
        "screenshots/light/1.webp",
        "screenshots/dark/1.webp",
        "screenshots/light/2.webp",
        "screenshots/dark/2.webp",
        "screenshots/light/3.webp",
        "screenshots/dark/3.webp",
        "screenshots/light/4.webp",
        "screenshots/dark/4.webp",
        "screenshots/light/5.webp",
        "screenshots/dark/5.webp",
        "screenshots/light/6.webp",
        "screenshots/dark/6.webp",
        "screenshots/light/7.webp",
        "screenshots/dark/7.webp",
        "screenshots/light/8.webp",
        "screenshots/dark/8.webp"
    }
}
