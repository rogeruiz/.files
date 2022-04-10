local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	return
end

local icon = require("icons").neorg

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.highlights"] = {},
		["core.norg.concealer"] = {
			config = {
				icons = {
					todo = {
						enabled = true,
						done = {
							enabled = true,
							icon = icon.TodoItemDone,
							highlight = "NeorgTodoItemDoneMark",
							query = "(todo_item_done) @icon",
							extract = function()
								return -1
							end,
						},
						pending = {
							enabled = true,
							icon = icon.TodoItemPending,
							highlight = "NeorgTodoItemPendingMark",
							query = "(todo_item_pending) @icon",
							extract = function()
								return -1
							end,
						},

						undone = {
							enabled = true,
							icon = icon.TodoItemUndone,
							highlight = "NeorgTodoItemUndoneMark",
							query = "(todo_item_undone) @icon",
							extract = function()
								return -1
							end,
						},

						uncertain = {
							enabled = true,
							icon = icon.TodoItemUncertain,
							highlight = "NeorgTodoItemUncertainMark",
							query = "(todo_item_uncertain) @icon",
							extract = function()
								return -1
							end,
						},

						on_hold = {
							enabled = true,
							icon = icon.TodoItemOnHold,
							highlight = "NeorgTodoItemOnHoldMark",
							query = "(todo_item_on_hold) @icon",
							extract = function()
								return -1
							end,
						},

						cancelled = {
							enabled = true,
							icon = icon.TodoItemCancelled,
							highlight = "NeorgTodoItemCancelledMark",
							query = "(todo_item_cancelled) @icon",
							extract = function()
								return -1
							end,
						},

						recurring = {
							enabled = true,
							icon = icon.TodoItemRecurring,
							highlight = "NeorgTodoItemRecurringMark",
							query = "(todo_item_recurring) @icon",
							extract = function()
								return -1
							end,
						},

						urgent = {
							enabled = true,
							icon = icon.TodoItemUrgent,
							highlight = "NeorgTodoItemUrgentMark",
							query = "(todo_item_urgent) @icon",
							extract = function()
								return -1
							end,
						},
					},
				},
			},
		},
		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					work = "~/Dropbox/Notebooks/work",
					personal = "~/Dropbox/Notebooks/personal",
				},
			},
		},
	},
})
