---@type LazyPluginSpec
return {
  'neovim/nvim-lspconfig',
  config = function()
    for _, server in ipairs({ 'oxfmt', 'oxlint' }) do
      local root_dir = vim.lsp.config[server].root_dir
      vim.lsp.config(server, {
        root_dir = function(bufnr, on_dir)
          root_dir(bufnr, function(root)
            local local_cmd = root and vim.fs.joinpath(root, 'node_modules/.bin', server)
            if vim.fn.executable(server) == 1 or (local_cmd and vim.fn.executable(local_cmd) == 1) then
              on_dir(root)
            end
          end)
        end,
      })
    end

    -- Compatibility aliases for the pre-0.12 `:Lsp*` commands.
    vim.api.nvim_create_user_command('LspInfo', function()
      vim.cmd('checkhealth vim.lsp')
    end, { desc = 'Alias to `:checkhealth vim.lsp`' })

    vim.api.nvim_create_user_command('LspLog', function()
      vim.cmd.edit(vim.lsp.log.get_filename())
    end, { desc = 'Open the Nvim LSP client log' })
  end,
}
