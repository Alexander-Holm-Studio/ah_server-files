fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Overextended'
description 'Door lock system with ox_target integration'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
    'configs/*.lua'
}

dependencies {
    'ox_lib',
    'ox_target',
    'es_extended'
}
