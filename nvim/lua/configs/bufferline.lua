require('bufferline').setup({
  diagnostics = 'nvim_lsp',
  diagnostics_indicator = function(count, level, diagnostics_dict, context)
    return '('..count..')'
  end,
  offsets = {
    {
      filetype = 'NvimTree',
      text = 'File Explorer',
      text_align = 'left'
    }
  },
})

vim.cmd([[
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent>bc :BufferLinePickClose<CR>
]])
