---@type vim.lsp.Config
return {
  -- TODO: Workaround @see https://github.com/neovim/neovim/issues/33577
  on_init = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      command = 'LspEslintFixAll',
    })
  end,
  flags = {
    debounce_text_changes = 150,
  },
}
