local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function random_header_figlet()
	math.randomseed(os.time())
	local headers = {
		{
			[[_________________________________________/\\\\\\____________________________________________________________        ]],
			[[ ________________________________________\////\\\____________________________________________________________       ]],
			[[  _____/\\\__________________________________\/\\\____________________________________________________________      ]],
			[[   __/\\\\\\\\\\\_____/\\\\\\\\_______________\/\\\_____/\\\____/\\\_____/\\\\\\\\_____/\\\\\\\\___/\\\\\\\\\\_     ]],
			[[    _\////\\\////____/\\\/////\\\______________\/\\\____\/\\\___\/\\\___/\\\//////____/\\\/////\\\_\/\\\//////__    ]],
			[[     ____\/\\\_______/\\\\\\\\\\\_______________\/\\\____\/\\\___\/\\\__/\\\__________/\\\\\\\\\\\__\/\\\\\\\\\\_   ]],
			[[      ____\/\\\_/\\__\//\\///////________________\/\\\____\/\\\___\/\\\_\//\\\________\//\\///////___\////////\\\_  ]],
			[[       ____\//\\\\\____\//\\\\\\\\\\____________/\\\\\\\\\_\//\\\\\\\\\___\///\\\\\\\\__\//\\\\\\\\\\__/\\\\\\\\\\_ ]],
			[[        _____\/////______\//////////____________\/////////___\/////////______\////////____\//////////__\//////////__]],
			[[__/\\\______________________________________________________/\\\_____________________________________               ]],
			[[ _\/\\\_____________________________________________________\/\\\_____________________________________              ]],
			[[  _\/\\\_________/\\\________________________________________\/\\\__________________________/\\\__/\\\_             ]],
			[[   _\/\\\________\///______/\\\\\\\\___/\\/\\\\\\_____________\/\\\_____________/\\\\\______\//\\\/\\\__            ]],
			[[    _\/\\\\\\\\\___/\\\___/\\\/////\\\_\/\\\////\\\____________\/\\\\\\\\\\____/\\\///\\\_____\//\\\\\___           ]],
			[[     _\/\\\////\\\_\/\\\__/\\\\\\\\\\\__\/\\\__\//\\\___________\/\\\/////\\\__/\\\__\//\\\_____\//\\\____          ]],
			[[      _\/\\\__\/\\\_\/\\\_\//\\///////___\/\\\___\/\\\___________\/\\\___\/\\\_\//\\\__/\\\___/\\_/\\\_____         ]],
			[[       _\/\\\\\\\\\__\/\\\__\//\\\\\\\\\\_\/\\\___\/\\\___________\/\\\___\/\\\__\///\\\\\/___\//\\\\/______        ]],
			[[        _\/////////___\///____\//////////__\///____\///____________\///____\///_____\/////______\////________       ]],
		},
		{
			[[ ,--.--------.    ,----.                                 _,.----.       ,----.    ,-,--.     ]],
			[[/==/,  -   , -\,-.--` , \          _.-.    .--.-. .-.-..' .' -   \   ,-.--` , \ ,-.'-  _\    ]],
			[[\==\.-.  - ,-./==|-  _.-`        .-,.'|   /==/ -|/=/  /==/  ,  ,-'  |==|-  _.-`/==/_ ,_.'    ]],
			[[ `--`\==\- \  |==|   `.-.       |==|, |   |==| ,||=| -|==|-   |  .  |==|   `.-.\==\  \       ]],
			[[      \==\_ \/==/_ ,    /       |==|- |   |==|- | =/  |==|_   `-' \/==/_ ,    / \==\ -\      ]],
			[[      |==|- ||==|    .-'        |==|, |   |==|,  \/ - |==|   _  , ||==|    .-'  _\==\ ,\     ]],
			[[      |==|, ||==|_  ,`-._       |==|- `-._|==|-   ,   |==\.       /|==|_  ,`-._/==/\/ _ |    ]],
			[[      /==/ -//==/ ,     /       /==/ - , ,/==/ , _  .' `-.`.___.-' /==/ ,     /\==\ - , /    ]],
			[[      `--`--``--`-----``        `--`-----'`--`..---'               `--`-----``  `--`---'     ]],
			[[              .=-.-.   ,----.  .-._                ,--.-,,-,--,   _,.---._                   ]],
			[[    _..---.  /==/_ /,-.--` , \/==/ \  .-._        /==/  /|=|  | ,-.' , -  `.  ,--.-.  .-,--. ]],
			[[  .' .'.-. \|==|, ||==|-  _.-`|==|, \/ /, /       |==|_ ||=|, |/==/_,  ,  - \/==/- / /=/_ /  ]],
			[[ /==/- '=' /|==|  ||==|   `.-.|==|-  \|  |        |==| ,|/=| _|==|   .=.     \==\, \/=/. /   ]],
			[[ |==|-,   ' |==|- /==/_ ,    /|==| ,  | -|        |==|- `-' _ |==|_ : ;=:  - |\==\  \/ -/    ]],
			[[ |==|  .=. \|==| ,|==|    .-' |==| -   _ |        |==|  _     |==| , '='     | |==|  ,_/     ]],
			[[ /==/- '=' ,|==|- |==|_  ,`-._|==|  /\ , |        |==|   .-. ,\\==\ -    ,_ /  \==\-, /      ]],
			[[|==|   -   //==/. /==/ ,     //==/, | |- |        /==/, //=/  | '.='. -   .'   /==/._/       ]],
			[[`-._`.___,' `--`-``--`-----`` `--`./  `--`        `--`-' `-`--`   `--`--''     `--`-`        ]],
		},
		{
			[[                                                             _..._                                ]],
			[[                                       .---.              .-'_..._''.                             ]],
			[[               __.....__               |   |            .' .'      '.\     __.....__              ]],
			[[           .-''         '.             |   |           / .'            .-''         '.            ]],
			[[     .|   /     .-''"'-.  `.           |   |          . '             /     .-''"'-.  `.          ]],
			[[   .' |_ /     /________\   \          |   |          | |            /     /________\   \         ]],
			[[ .'     ||                  |          |   |   _    _ | |            |                  |    _    ]],
			[['--.  .-'\    .-------------'          |   |  | '  / |. '            \    .-------------'  .' |   ]],
			[[   |  |   \    '-.____...---.          |   | .' | .' | \ '.          .\    '-.____...---. .   | / ]],
			[[   |  |    `.             .'           |   | /  | /  |  '. `._____.-'/ `.             .'.'.'| |// ]],
			[[   |  '.'    `''-...... -'             '---'|   `'.  |    `-.______ /    `''-...... -'.'.'.-'  /  ]],
			[[   |   /                                    '   .'|  '/            ` .-'''-.          .'   \_.'   ]],
			[[   `'-'                                      `-'  `--'              '   _    \                    ]],
			[[/|        .--.      __.....__        _..._                .       /   /` '.   \                   ]],
			[[||        |__|  .-''         '.    .'     '.            .'|      .   |     \  '.-.          .-    ]],
			[[||        .--. /     .-''"'-.  `. .   .-.   .          <  |      |   '      |  '\ \        / /    ]],
			[[||  __    |  |/     /________\   \|  '   '  |           | |      \    \     / /  \ \      / /     ]],
			[[||/'__ '. |  ||                  ||  |   |  |           | | .'''-.`.   ` ..' /    \ \    / /      ]],
			[[|:/`  '. '|  |\    .-------------'|  |   |  |           | |/.'''. \  '-...-'`      \ \  / /       ]],
			[[||     | ||  | \    '-.____...---.|  |   |  |           |  /    | |                 \ `  /        ]],
			[[||\    / '|__|  `.             .' |  |   |  |           | |     | |                  \  /         ]],
			[[|/\'..' /         `''-...... -'   |  |   |  |           | |     | |                  / /          ]],
			[['  `'-'`                          |  |   |  |           | '.    | '.             |`-' /           ]],
			[[                                  '--'   '--'           '---'   '---'             '..'            ]],
		},
		{
			[[                  ___                                  ___           ___           ___           ___     ]],
			[[      ___        /  /\                                /__/\         /  /\         /  /\         /  /\    ]],
			[[     /  /\      /  /:/_                               \  \:\       /  /:/        /  /:/_       /  /:/_   ]],
			[[    /  /:/     /  /:/ /\             ___     ___       \  \:\     /  /:/        /  /:/ /\     /  /:/ /\  ]],
			[[   /  /:/     /  /:/ /:/_           /__/\   /  /\  ___  \  \:\   /  /:/  ___   /  /:/ /:/_   /  /:/ /::\ ]],
			[[  /  /::\    /__/:/ /:/ /\          \  \:\ /  /:/ /__/\  \__\:\ /__/:/  /  /\ /__/:/ /:/ /\ /__/:/ /:/\:\]],
			[[ /__/:/\:\   \  \:\/:/ /:/           \  \:\  /:/  \  \:\ /  /:/ \  \:\ /  /:/ \  \:\/:/ /:/ \  \:\/:/~/:/]],
			[[ \__\/  \:\   \  \::/ /:/             \  \:\/:/    \  \:\  /:/   \  \:\  /:/   \  \::/ /:/   \  \::/ /:/ ]],
			[[      \  \:\   \  \:\/:/               \  \::/      \  \:\/:/     \  \:\/:/     \  \:\/:/     \__\/ /:/  ]],
			[[       \__\/    \  \::/                 \__\/        \  \::/       \  \::/       \  \::/        /__/:/   ]],
			[[                 \__\/                                \__\/         \__\/         \__\/         \__\/    ]],
			[[                                ___           ___                    ___           ___                   ]],
			[[     _____        ___          /  /\         /__/\                  /__/\         /  /\          ___     ]],
			[[    /  /::\      /  /\        /  /:/_        \  \:\                 \  \:\       /  /::\        /__/|    ]],
			[[   /  /:/\:\    /  /:/       /  /:/ /\        \  \:\                 \__\:\     /  /:/\:\      |  |:|    ]],
			[[  /  /:/~/::\  /__/::\      /  /:/ /:/_   _____\__\:\            ___ /  /::\   /  /:/  \:\     |  |:|    ]],
			[[ /__/:/ /:/\:| \__\/\:\__  /__/:/ /:/ /\ /__/::::::::\          /__/\  /:/\:\ /__/:/ \__\:\  __|__|:|    ]],
			[[ \  \:\/:/~/:/    \  \:\/\ \  \:\/:/ /:/ \  \:\~~\~~\/          \  \:\/:/__\/ \  \:\ /  /:/ /__/::::\    ]],
			[[  \  \::/ /:/      \__\::/  \  \::/ /:/   \  \:\  ~~~            \  \::/       \  \:\  /:/     ~\~~\:\   ]],
			[[   \  \:\/:/       /__/:/    \  \:\/:/     \  \:\                 \  \:\        \  \:\/:/        \  \:\  ]],
			[[    \  \::/        \__\/      \  \::/       \  \:\                 \  \:\        \  \::/          \__\/  ]],
			[[     \__\/                     \__\/         \__\/                  \__\/         \__\/                  ]],
		},
		{
			[[.___________. _______     __       __    __    ______  _______     _______.]],
			[[|           ||   ____|   |  |     |  |  |  |  /      ||   ____|   /       |]],
			[[`---|  |----`|  |__      |  |     |  |  |  | |  ,----'|  |__     |   (----`]],
			[[    |  |     |   __|     |  |     |  |  |  | |  |     |   __|     \   \    ]],
			[[    |  |     |  |____    |  `----.|  `--'  | |  `----.|  |____.----)   |   ]],
			[[    |__|     |_______|   |_______| \______/   \______||_______|_______/    ]],
			[[                                                                           ]],
			[[.______    __   _______ .__   __.     __    __    ______   ____    ____    ]],
			[[|   _  \  |  | |   ____||  \ |  |    |  |  |  |  /  __  \  \   \  /   /    ]],
			[[|  |_)  | |  | |  |__   |   \|  |    |  |__|  | |  |  |  |  \   \/   /     ]],
			[[|   _  <  |  | |   __|  |  . `  |    |   __   | |  |  |  |   \_    _/      ]],
			[[|  |_)  | |  | |  |____ |  |\   |    |  |  |  | |  `--'  |     |  |        ]],
			[[|______/  |__| |_______||__| \__|    |__|  |__|  \______/      |__|        ]],
			[[                                                                           ]],
		},
		{
			[[,---------.    .-''-.            .---.      ___    _     _______      .-''-.     .-'''-.     ]],
			[[\          \ .'_ _   \           | ,_|    .'   |  | |   /   __  \   .'_ _   \   / _     \    ]],
			[[ `--.  ,---'/ ( ` )   '        ,-./  )    |   .'  | |  | ,_/  \__) / ( ` )   ' (`' )/`--'    ]],
			[[    |   \  . (_ o _)  |        \  '_ '`)  .'  '_  | |,-./  )      . (_ o _)  |(_ o _).       ]],
			[[    :_ _:  |  (_,_)___|         > (_)  )  '   ( \.-.|\  '_ '`)    |  (_,_)___| (_,_). '.     ]],
			[[    (_I_)  '  \   .---.        (  .  .-'  ' (`. _` /| > (_)  )  __'  \   .---..---.  \  :    ]],
			[[   (_(=)_)  \  `-'    /         `-'`-'|___| (_ (_) _)(  .  .-'_/  )\  `-'    /\    `-'  |    ]],
			[[    (_I_)    \       /           |        \\ /  . \ / `-'`-'     /  \       /  \       /     ]],
			[[    '---'     `'-..-'            `--------` ``-'`-''    `._____.'    `'-..-'    `-...-'      ]],
			[[ _______  .-./`)     .-''-.  ,---.   .--.        .---.  .---.     ,-----.       ____     __  ]],
			[[\  ____  \\ .-.')  .'_ _   \ |    \  |  |        |   |  |_ _|   .'  .-,  '.     \   \   /  / ]],
			[[| |    \ |/ `-' \ / ( ` )   '|  ,  \ |  |        |   |  ( ' )  / ,-.|  \ _ \     \  _. /  '  ]],
			[[| |____/ / `-'`"`. (_ o _)  ||  |\_ \|  |        |   '-(_{;}_);  \  '_ /  | :     _( )_ .'   ]],
			[[|   _ _ '. .---. |  (_,_)___||  _( )_\  |        |      (_,_) |  _`,/ \ _/  | ___(_ o _)'    ]],
			[[|  ( ' )  \|   | '  \   .---.| (_ o _)  |        | _ _--.   | : (  '\_/ \   ;|   |(_,_)'     ]],
			[[| (_{;}_) ||   |  \  `-'    /|  (_,_)\  |        |( ' ) |   |  \ `"/  \  ) / |   `-'  /      ]],
			[[|  (_,_)  /|   |   \       / |  |    |  |        (_{;}_)|   |   '. \_/``".'   \      /       ]],
			[[/_______.' '---'    `'-..-'  '--'    '--'        '(_,_) '---'     '-----'      `-..-'        ]],
			[[                                                                                             ]],
		},
		{
			[[   _                         _                                    ]],
			[[  | |_     ___      o O O   | |    _  _     __      ___     ___   ]],
			[[  |  _|   / -_)    o        | |   | +| |   / _|    / -_)   (_-<   ]],
			[[  _\__|   \___|   TS__[O]  _|_|_   \_,_|   \__|_   \___|   /__/_  ]],
			[[_|"""""|_|"""""| {======|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
			[["`-0-0-'"`-0-0-'./o--000'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
			[[  _         _                              _                _  _  ]],
			[[ | |__     (_)     ___    _ _       o O O | |_      ___    | || | ]],
			[[ | '_ \    | |    / -_)  | ' \     o      | ' \    / _ \    \_, | ]],
			[[ |_.__/   _|_|_   \___|  |_||_|   TS__[O] |_||_|   \___/   _|__/  ]],
			[[_|"""""|_|"""""|_|"""""|_|"""""| {======|_|"""""|_|"""""|_| """"| ]],
			[["`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'./o--000'"`-0-0-'"`-0-0-'"`-0-0-' ]],
		},
	}
	return headers[math.random(1, #headers)]
end

-- Set header
dashboard.section.header.val = random_header_figlet()

-- This function returns the name of the current directory and the parent
-- direcory and truncates the new path into two characters so it doesn't break
-- the dashboard theme.
local function get_current_directory()
  local directory_length = 20
  local wd = os.getenv('PWD')
  wd = wd:match('^.+/(.+/.+)$') -- Matches the last two directories.
  if #wd > directory_length then
    wd = string.sub(wd, 0, directory_length) .. '...' -- Truncates the second directory with three dots.
  end
  return wd
end

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( 'e', '  > Nuevo archivo' , ':ene <BAR> startinsert <CR>'),
    dashboard.button( 'f', '  > Busque archivos en ' .. get_current_directory(), ':cd $PWD | Telescope find_files<CR>'),
    dashboard.button( 'a', '  > Busque archivos en ~/Developer', ':cd $HOME/Developer | Telescope find_files<CR>'),
    dashboard.button( 'r', '  > Reciente archivos'   , ':Telescope oldfiles<CR>'),
    dashboard.button( 's', '  > Ajustes' , ':e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>'),
    dashboard.button( 'q', '  > Salir de NVIM', ':qa<CR>'),
}

-- Set footer
local fortune = require('alpha.fortune')
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable Indent
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2

]])
