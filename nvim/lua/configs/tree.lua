vim.cmd([[
nnoremap <C-k> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
]])

require('nvim-tree').setup({})
