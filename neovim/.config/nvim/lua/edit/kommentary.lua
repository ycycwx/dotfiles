local ok, kommentary = pcall(require, 'kommentary.config')
if not ok then
  vim.notify('Could not load Kommentary')
  return
end

kommentary.configure_language('default', {
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
})

kommentary.configure_language('lua', {
  prefer_single_line_comments = true,
})
