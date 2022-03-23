vim.cmd([[
  nnoremap <silent> <leader>gs :Git<CR>
  nnoremap <silent> <leader>gc :Git commit -v<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  " Mnemonic _i_nteractive
  nnoremap <silent> <leader>gi :Git add -p %<CR>
]])
