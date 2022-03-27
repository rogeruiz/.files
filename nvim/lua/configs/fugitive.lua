vim.cmd([[
  nnoremap <silent> <leader>gs :Git<CR>
  nnoremap <silent> <leader>gc :Git commit -v<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gbb :Git blame<CR>
  " Mnemonic _i_nteractive
  nnoremap <silent> <leader>gi :Git add -p %<CR>
]])
