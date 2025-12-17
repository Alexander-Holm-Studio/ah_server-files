fx_version 'cerulean'
game 'gta5'

description 'Simple Watermark with Server ID'
version '2.2.0'

ui_page 'html/index.html'

client_script 'jns_client.lua'

server_script 'jns_server.lua'

files {
    'html/index.html',
    'html/css/style.css',
    'html/css/bootstrap.min.css',
    'html/img/watermark.png',
    'html/js/script.js',
    'html/js/bootstrap.min.js',
    'html/fonts/roboto/*.woff',
    'html/fonts/roboto/*.woff2',
    'html/fonts/justsignature/*.woff'
}

lua54 'yes'
