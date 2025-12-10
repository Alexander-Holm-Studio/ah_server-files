fx_version "cerulean"
game "gta5"
lua54 "yes"

description "A standalone Lovense toy control app for the LB Phone"
author "Abstract"
version "1.0.2"

dependencies {
    'lb-phone'
}

shared_scripts {
    '@ox_lib/init.lua',
}

server_script {"config.lua", "server.lua"}
client_script "client.lua"

file "ui/dist/**/*"
ui_page "ui/dist/index.html"

escrow_ignore{
    "config.lua"
}
dependency '/assetpacks'