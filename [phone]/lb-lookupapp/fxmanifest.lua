fx_version "cerulean"
game "gta5"
lua54 "yes"

title "LB Phone - Lookup App"
description "A person & vehicle lookup app for LB Phone."
author "Breze & Loaf"
version "1.2.0"

shared_script {
    "config/**.lua",
    "shared/**.lua",
}

client_script "client/**.lua"

server_script {
    "@oxmysql/lib/MySQL.lua",
    "server/custom/**.lua",
    "server/*.lua"
}

escrow_ignore {
    "*/custom/**",
    "config/**.lua",
}

files {
    "ui/dist/**/*",
    "ui/images/*.png"
}

ui_page "ui/dist/index.html"

dependency '/assetpacks'