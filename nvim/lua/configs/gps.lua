local icons = require('icons')

require('nvim-gps').setup({

	disable_icons = false,           -- Setting it to true will disable all icons

	icons = {
		['class-name'] = icons.kind.Class .. ' ',      -- Classes and class-like objects
		['function-name'] = icons.kind.Function .. ' ',   -- Functions
		['method-name'] = icons.kind.Method .. ' ',     -- Methods (functions inside class-like objects)
		['container-name'] = icons.type.Object .. ' ',  -- Containers (example: lua tables)
    ['tag-name'] = icons.misc.Tag .. ' ',         -- Tags (example: html tags)
	},

	-- Add custom configuration per language or
	-- Disable the plugin for a language
	-- Any language not disabled here is enabled by default
	languages = {
		-- Some languages have custom icons
		['json'] = {
			icons = {
				['array-name'] = icons.type.Array .. ' ',
				['object-name'] = icons.type.Object .. ' ',
				['null-name'] = icons.kind.Field .. ' ',
				['boolean-name'] = icons.type.Boolean .. ' ',
				['number-name'] = icons.type.Number .. ' ',
				['string-name'] = icons.type.String .. ' ',
			}
		},
		['toml'] = {
			icons = {
				['table-name'] = icons.type.Object .. ' ',
				['array-name'] = icons.type.Array .. ' ',
				['boolean-name'] = icons.type.Boolean .. ' ',
				['date-name'] = icons.ui.Calendar .. ' ' ,
				['date-time-name'] = icons.ui.CalendarTime .. ' ',
				['float-name'] = icons.type.Float .. ' ',
				['inline-table-name'] = icons.type.Object .. ' ',
				['integer-name'] = icons.type.Number .. ' ',
				['string-name'] = icons.type.String .. ' ',
				['time-name'] = icons.ui.Time .. ' ',
			}
		},
		['yaml'] = {
			icons = {
				['mapping-name'] = icons.type.Object .. ' ',
				['sequence-name'] = icons.type.Array .. ' ',
				['null-name'] = icons.kind.Field .. ' ',
				['boolean-name'] = icons.type.Boolean .. ' ',
				['integer-name'] = icons.type.Number .. ' ',
				['float-name'] = icons.type.Float .. ' ',
				['string-name'] = icons.type.String .. ' ',
			}
		},
		-- Disable for particular languages
		-- ['bash'] = false, -- disables nvim-gps for bash
		-- ['go'] = false,   -- disables nvim-gps for golang

		-- Override default setting for particular languages
		-- ['ruby'] = {
		--	separator = '|', -- Overrides default separator with '|'
		--	icons = {
		--		-- Default icons not specified in the lang config
		--		-- will fallback to the default value
		--		-- 'container-name' will fallback to default because it's not set
		--		['function-name'] = '',    -- to ensure empty values, set an empty string
		--		['tag-name'] = ''
		--		['class-name'] = '::',
		--		['method-name'] = '#',
		--	}
		--}
	},

	separator = ' ' .. icons.ui.ChevronRight .. ' ',

	-- limit for amount of context shown
	-- 0 means no limit
	depth = 0,

	-- indicator used when context hits depth limit
	depth_limit_indicator = icons.ui.HorizontalDots,
})
