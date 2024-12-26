return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      nix = { 'nixfmt' },
      python = { 'isort', 'black' },
      go = { 'gofumpt', 'goimports' },

      html = { 'prettier' },
      css = { 'prettier' },
      less = { 'prettier' },
      scss = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      vue = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      graphql = { 'prettier' },
    },
  },
  keys = {
    {
      '<leader>fj',
      function()
        require('conform').format({ lsp_fallback = true, async = true })
      end,
      desc = 'Format Document',
      mode = { 'n', 'v' },
    },
  },
}
