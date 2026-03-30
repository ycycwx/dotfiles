local custom = require('custom')

-- Enable the build-in undotree plugin.
vim.cmd.packadd('nvim.undotree')

-- Remove help information from the popup menu.
vim.cmd.aunmenu([[PopUp.How-to\ disable\ mouse]])
vim.cmd.aunmenu([[PopUp.-1-]])

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●',
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    severity_sort = true,
    source = 'if_many',
  },
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = custom.icons.diagnostic.error,
      [vim.diagnostic.severity.WARN] = custom.icons.diagnostic.warn,
      [vim.diagnostic.severity.HINT] = custom.icons.diagnostic.hint,
      [vim.diagnostic.severity.INFO] = custom.icons.diagnostic.info,
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Accept inline completion',
  callback = function(args)
    local bufnr = args.buf

    vim.keymap.set('i', '<C-J>', function()
      if not vim.lsp.inline_completion.get() then
        return '<C-J>'
      end
    end, {
      expr = true,
      buffer = bufnr,
      desc = 'Accept the current inline completion',
    })
  end,
})

vim.lsp.codelens.enable()
vim.lsp.inlay_hint.enable()
vim.lsp.inline_completion.enable()
vim.lsp.enable({
  'copilot',
  'cssls',
  'eslint',
  'lua_ls',
  'gh_actions_ls',
  'jsonls',
  'oxfmt',
  'oxlint',
  'pyright',
  'svelte',
  'tailwindcss',
  'vtsls',
  'vue_ls',
})

do
  local ok, ui2 = pcall(require, 'vim._core.ui2')
  if ok and ui2 and ui2.enable then
    pcall(ui2.enable, {})
  end
end
