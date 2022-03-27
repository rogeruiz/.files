local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

vim.cmd([[
nnoremap <C-k> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
]])

tree.setup({})
