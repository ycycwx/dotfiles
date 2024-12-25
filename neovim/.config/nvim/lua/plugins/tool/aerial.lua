local custom = require('custom')

return {
  'stevearc/aerial.nvim',
  opts = {
    backends = { 'lsp', 'treesitter', 'markdown' },
    float = {
      border = custom.border,
    },
  },
  keys = {
    { '<leader>a', '<Cmd>AerialToggle<CR>', desc = 'Outline' },
  },
}
