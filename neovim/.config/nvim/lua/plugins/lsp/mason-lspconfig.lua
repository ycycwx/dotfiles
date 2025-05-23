return {
  'williamboman/mason-lspconfig.nvim',
  event = {
    'Filetype',
  },
  dependencies = {
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'b0o/SchemaStore.nvim',
    'nanotee/sqls.nvim',
  },
  opts = function()
    local lspconfig = require('lspconfig')

    return {
      handlers = {
        function() end,

        ts_ls = function()
          lspconfig.ts_ls.setup({
            root_dir = function(name)
              return lspconfig.util.root_pattern('.git')(name)
                or lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json')(name)
            end,
          })
        end,
      },
    }
  end,
}
