return {
  'github/copilot.vim',
  -- Keep the plugin spec around so it is easy to flip back if the 0.12 builtin
  -- copilot LSP + inline completion flow is not good enough yet.
  enabled = false,
  event = 'VeryLazy',
  init = function()
    -- vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.g.copilot_filetypes = {
      registers = 0,
      markdown = 1,
    }

    vim.keymap.set(
      'i',
      '<C-J>',
      'copilot#Accept("<CR>")',
      { silent = true, script = true, expr = true, replace_keycodes = false }
    )

    vim.keymap.set('i', '<M-NL>', '<Cmd>Copilot<CR>')
  end,
}
