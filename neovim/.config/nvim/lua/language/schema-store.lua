local schemastore_ok, schemastore = pcall(require, 'schemastore')
if not schemastore_ok then
  vim.notify('Could not load schemastore')
end

local lsp_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_ok then
  vim.notify('Could not load lspconfig')
end

local default = require('language.default')

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
  on_attach = function(client, bufnr)
    default.on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  capabilities = default.capabilities,
})
