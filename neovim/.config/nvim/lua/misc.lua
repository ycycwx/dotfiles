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
  desc = 'LSP buffer keymaps',
  callback = function(args)
    local bufnr = args.buf

    -- 0.12 only provides `gri`/`grt` by default, so keep the old `gd`/`gD`/`gI` muscle memory.
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
      buffer = bufnr,
      desc = 'Definition',
    })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
      buffer = bufnr,
      desc = 'Declaration',
    })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, {
      buffer = bufnr,
      desc = 'Implementation',
    })
    -- 0.12 default diagnostic float is `<C-W>d`; keep `ge` as a shorter alias.
    vim.keymap.set('n', 'ge', vim.diagnostic.open_float, {
      buffer = bufnr,
      desc = 'Open diagnostic float',
    })

    -- 0.12 exposes inline completion API but does not define a default accept key.
    vim.keymap.set('i', '<C-J>', function()
      if not (vim.lsp.inline_completion and vim.lsp.inline_completion.get) then
        return '<C-J>'
      end
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

if vim.lsp.codelens and vim.lsp.codelens.enable then
  vim.lsp.codelens.enable()
end
if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable then
  vim.lsp.inlay_hint.enable()
end
if vim.lsp.inline_completion and vim.lsp.inline_completion.enable then
  vim.lsp.inline_completion.enable()
end
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
