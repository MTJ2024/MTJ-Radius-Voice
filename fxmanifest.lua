fx_version 'cerulean'
game 'gta5'

author 'MTJ2024'
description 'Farbige Sprech-Reichweitenanzeige für pmavoice'
version '1.0.0'

shared_script 'config.lua'

client_script 'client/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

dependency 'pma-voice'
