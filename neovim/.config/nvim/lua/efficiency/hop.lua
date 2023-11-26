local ok, hop = pcall(require, 'hop')
if not ok then
  vim.notify('Could not load hop')
  return
end

hop.setup({
  keys = 'etovxqpdygfblzhckisuran',
  jump_on_sole_occurrence = false,
})

-- disable shortcut
-- vim.keymap.set({ 'n', 'v', 'o' }, 'f', '<Cmd>HopPatternMW<CR>', { desc = 'Pattern' }) -- Case ignored
