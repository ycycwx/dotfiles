local custom = require('custom')

return {
  'onsails/lspkind.nvim',
  lazy = true,
  opts = {
    symbol_map = custom.icons.kind,
  },
}
