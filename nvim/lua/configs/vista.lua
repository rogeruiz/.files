vim.cmd([[
" Shortcut for Vista
nmap <leader>vv :Vista!!<CR>
let g:vista_default_executive = 'nvim_lsp'

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
]])
