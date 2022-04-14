-- FXVersion Version
fx_version 'adamant'
games {"rdr3","gta5"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

-- Client Scripts
client_script 'client/main.lua'

-- Server Scripts
server_script 'server/main.lua'

-- NUI Default Page
ui_page "client/html/index.html"

-- Files needed for NUI
files {
    'client/html/index.html',
    'client/html/sounds/*.ogg'
}
