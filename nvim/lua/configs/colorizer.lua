local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
  return
end

colorizer.setup({
  css = { css = true },
  scss = { css = true },
  html = { mode = 'foreground' },
  'javascript',
  'javascriptreact',
  'jsx',
})
