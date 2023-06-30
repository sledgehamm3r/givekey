fx_version 'cerulean'
game 'gta5'

description 'ESX Give Car Keys'

version '1.0.0'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client.lua'
}

dependencies {
    'es_extended',
    'mysql-async'
}
