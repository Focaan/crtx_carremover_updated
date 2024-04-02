fx_version 'cerulean'
game 'gta5'

author 'Viper'
description 'CX Dev  / Support > https://discord.gg/TD4mqHmsZ8'
version '1.0'


server_scripts {
    'server/main.lua',
}

client_scripts {
    'client/client.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'config/config.lua',
}

lua54 'yes'

escrow_ignore {
	'config/config.lua',
  }