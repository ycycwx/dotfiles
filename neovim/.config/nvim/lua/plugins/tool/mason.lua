local custom = require('custom')

return {
  'williamboman/mason.nvim',
  opts = {
    ui = {
      border = custom.border,
    },
  },
  keys = {
    { '<leader>mm', '<Cmd>Mason<CR>', desc = 'Packages' },
  },
}
