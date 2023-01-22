local ok, ls = pcall(require, 'null-ls')
if not ok then
  vim.notify('Could not load null-ls')
  return
end

-- register any number of sources simultaneously
ls.setup({
  sources = {
    ls.builtins.formatting.prettier,
    ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    -- custom keybindings
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>rn',
      '<cmd>lua vim.lsp.buf.rename()<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>qf',
      '<cmd>lua vim.lsp.buf.code_action()<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      '<leader>f',
      '<cmd>lua vim.lsp.buf.format {async = true}()<CR>',
      opts
    )
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'v',
      '<leader>f',
      '<cmd>lua vim.lsp.buf.format()<CR>',
      opts
    )
  end,
})
