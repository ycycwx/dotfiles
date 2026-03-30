---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  event = {
    'FileType',
  },
  dependencies = {
    'folke/neoconf.nvim',
  },
  config = function()
    -- Compatibility aliases for the pre-0.12 `:Lsp*` commands.
    vim.api.nvim_create_user_command('LspInfo', function()
      vim.cmd('checkhealth vim.lsp')
    end, { desc = 'Alias to `:checkhealth vim.lsp`' })

    vim.api.nvim_create_user_command('LspLog', function()
      vim.cmd.edit(vim.lsp.log.get_filename())
    end, { desc = 'Open the Nvim LSP client log' })
  end,
}
