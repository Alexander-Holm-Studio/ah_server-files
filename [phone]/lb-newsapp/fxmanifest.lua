fx_version "cerulean"
game "gta5"
lua54 "yes"

title "News app for LB Phone"
description "An app for LB Phone that lets you create and browse articles."
author "LB"
version "1.2.0"

shared_scripts {
    "config/config.lua",
    "config/locales/*.lua",
    "lib/shared/**.lua"
}

client_scripts {
    "lib/client/**.lua",
    "client/**.lua"
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "lib/server/**.lua",
    "server/**.lua"
}

file "ui/dist/**/*"

ui_page "ui/dist/index.html"

escrow_ignore {
    "config/**",
    "lib/**",
    "*/framework/**",

    "server/apiKeys.lua",
    "server/logs.lua",
}

dependency '/assetpacks'