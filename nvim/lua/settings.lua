local set = vim.opt
local opts = { noremap = true, silent = true }
local kmap = vim.api.nvim_set_keymap

vim.cmd([[
language es_ES.UTF-8
]])

vim.g.mapleader = ","

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

-- Turn on spelling and set language to either english or spanish.
kmap("n", "<Leader>ss", ":setlocal spell!<CR>", opts)
kmap("n", "<Leader>sen", ":setlocal spelllang=en_us<CR>", opts)
kmap("n", "<Leader>ses", ":setlocal spelllang=es<CR>", opts)

set.clipboard = "unnamed"
set.splitbelow = true
set.splitright = true

-- Set spacebar to start search
kmap("", "<space>", "/", opts)

set.ignorecase = true
set.smartcase = true
set.showmatch = true

-- Fold method is being set in ./configs/treesitter.lua
set.foldenable = false

set.ffs = "unix,dos,mac"

set.lazyredraw = true

set.whichwrap = "<,>,h,l"

set.swapfile = false

set.listchars = "eol:¬,tab:›·,trail:·,extends:›,precedes:‹"
set.list = true

set.completeopt = "menuone"
set.linebreak = true

set.smartindent = true

set.maxmempattern = 10240

-- Better resize with arrows
kmap("n", "<C-Down>", ":resize -2<CR>", opts)
kmap("n", "<C-Up>", ":resize +2<CR>", opts)
kmap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
kmap("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
kmap("n", "<S-l>", ":bnext<CR>", opts)
kmap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Filetype mappings
vim.cmd([[
  au BufRead,BufNewFile *.jshintrc set ft=json
  au BufRead,BufNewFile *.bowerrc set ft=json
  au BufRead,BufNewFile *.pantheonrc set ft=json
  au BufRead,BufNewFile *.eslintrc set ft=json
  au BufRead,BufNewFile *.txt set ft=markdown
  au BufRead,BufNewFile *.text set ft=markdown
  au BufRead,BufNewFile *.applescript set ft=applescript
  au BufNewFile,BufRead *.php set ft=php.html.js.css
  au BufNewFile,BufRead *.blade.php set ft=blade.html.php
  au BufNewFile,BufRead *.ejs set ft=liquid.html.js.css
  au BufNewFile,BufRead *.twig set ft=html.twig
  au BufNewFile,BufRead *.toml set ft=toml
  au BufNewFile,BufRead *.js set ft=javascript.jsx
  au BufNewFile,BufRead *.jsx set ft=javascriptreact
  au BufNewFile,BufRead nginx.config set ft=nginx
  au BufRead,BufNewFile spec set ft=yaml
  au BufNewFile,BufRead *.ledger set ft=ledger
  au BufNewFile,BufRead .env* set ft=sh
  au BufNewFile,BufRead Brewfile set ft=ruby
]])

-- Filetypes configurations
vim.cmd([[
  au FileType markdown setlocal shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list
  au FileType norg setlocal wrap spell expandtab tw=80 wm=0 linebreak list
  au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=72 wm=0 linebreak list
]])
