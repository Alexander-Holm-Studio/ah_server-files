fx_version 'cerulean'
games { 'gta5' }

author 'Simonfas - Optimized for ESX'
description 'ESX Tablet Script - Police & EMS'
version '3.0.0'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/bootstrap.min.css'
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'es_extended'
}