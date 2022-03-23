local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
  debug = false,
  update_on_insert = true,
  sources = {
    formatting.black.with { extra_args = { '--fast' } },
    formatting.stylua,
    formatting.terrafmt,
    formatting.prettier,
    diagnostics.eslint,
    diagnostics.checkmake,
    code_actions.eslint,
    code_actions.gitsigns,
    hover.dictionary,
    diagnostics.vale.with({
      args = function(params)
        return {
          --'--config=' .. home .. '/.config/vale/vale.ini',
          '--no-exit',
          '--output',
          'JSON',
          '--ext',
          '.' .. vim.fn.fnamemodify(params.bufname, ':e'),
        }
      end,
    }),
  },
  on_attach = function(_) -- client
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
})
