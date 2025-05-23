---@type LazyPluginSpec
return {
  'b0o/SchemaStore.nvim',
  ft = { 'json', 'yaml' },
  config = function()
    vim.lsp.config('jsonls', {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
    })
    vim.lsp.config('yamlls', {
      settings = {
        yaml = {
          keyOrdering = false,
          schemaStore = {
            enable = false,
            url = '',
          },
          schemas = require('schemastore').yaml.schemas({
            ignore = {
              -- Very easy to conflict with other `deploy.yaml`
              'Deployer Recipe',
            },
          }),
        },
      },
    })
    -- vim.lsp.config('ts_ls', {
    --   root_dir = function(name)
    --     return vim.lsp.util.root_pattern('.git')(name)
    --       or vim.lsp.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json')(name)
    --   end,
    -- })
  end,
}
