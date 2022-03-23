local set = vim.opt
local kmap = vim.api.nvim_set_keymap

vim.cmd([[
language es_ES.UTF-8
]])

vim.g.mapleader = ','

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

kmap('', '<Leader>ss', ':setlocal spell!<CR>', {})
kmap('', '<Leader>sen', ':setlocal spelllang=en_us<CR>', {})
kmap('', '<Leader>ses', ':setlocal spelllang=es<CR>', {})

set.clipboard = 'unnamed'
set.splitbelow = true
set.splitright = true

kmap('', '<space>', '/', {})

set.ignorecase = true
set.smartcase = true
set.showmatch = true

-- Fold method is being set in ./configs/treesitter.lua
set.foldenable = false

set.ffs = 'unix,dos,mac'

set.lazyredraw = true

set.whichwrap = '<,>,h,l'

set.swapfile = false

set.listchars = 'eol:¬,tab:›·,trail:·,extends:›,precedes:‹'
set.list = true

set.completeopt = 'menuone'
set.linebreak = true

set.smartindent = true

set.maxmempattern = 10240
