local icons = require('icons').git

vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = ' ' .. icons.Repo .. ' <summary> • <date> • <author>'
vim.g.gitblame_highlight_group = 'LineNr'
vim.g.gitblame_date_format = '%r'

vim.cmd([[
  nnoremap <silent> <leader>gb :GitBlameToggle<CR>
]])
