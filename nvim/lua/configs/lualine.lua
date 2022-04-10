local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
	return
end

local colors = {
	red = "#ca1243",
	grey = "#a0a1a7",
	black = "#383a42",
	white = "#f3f3f3",
	light_green = "#83a598",
	orange = "#fe8019",
	green = "#8ec07c",
}

local icons = require("icons")

-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ""
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
		end
		return str
	end
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function location_with_icons()
	return "%l " .. icons.ui.LineNumber .. " %c " .. icons.ui.ColumnNumber
end

local function linenumber_with_icons()
	return "%p%%" .. icons.ui.SeparatorForward .. "  %L"
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "dracula",
		component_separators = {
			left = icons.ui.PowerlineRightEmpty,
			right = icons.ui.PowerlineLeftEmpty,
		},
		section_separators = {
			left = icons.ui.PowerlineRightFill,
			right = icons.ui.PowerlineLeftFill,
		},
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"toggleterm",
			"NvimTree",
			"dap-repl",
			"dapui_watches",
			"dapui_stacks",
			"dapui_breakpoints",
			"dapui_scopes",
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = trunc(80, 4, nil, true),
			},
		},
		lualine_b = {
			{
				"b:gitsigns_head",
				icon = "",
				fmt = trunc(80, 4, nil, true),
			},
			{
				"diff",
				source = diff_source,
			},
		},
		lualine_c = {
			{
				"filename",
				icon = icons.ui.NewFile .. " ",
				icons_enabled = true,
				file_status = false,
				path = 0,
				shorting_target = 50,
			},
			{
				modified,
				icon = icons.git.Diff .. "",
				icons_enabled = true,
				color = { bg = colors.red },
			},
			{ gps.get_location, cond = gps.is_available },
		},
		lualine_x = {
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = { bg = colors.red, fg = colors.white },
					warn = { bg = colors.orange, fg = colors.white },
					info = { bg = colors.light_green, fg = colors.white },
					hint = { bg = colors.green, fg = colors.white },
				},
				always_visible = true,
			},
		},
		lualine_y = { search_result, "filetype" },
		lualine_z = {
			"fileformat",
			location_with_icons,
			linenumber_with_icons,
			progress,
		},
	},
	inactive_sections = {
		lualine_a = {
			{
				"filename",
				icon = icons.ui.NewFile .. " ",
				icons_enabled = true,
				file_status = true,
				path = 2,
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			"filetype",
		},
		lualine_z = {
			"fileformat",
			location_with_icons,
			linenumber_with_icons,
			progress,
		},
	},
	tabline = {},
	extensions = {},
})
