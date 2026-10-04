---@type vim.lsp.Config
return {
  before_init = function(_, config)
    -- EmmyLua prefers `emmylua` over `Lua`; use lazydev's settings namespace.
    config.settings.emmylua = nil
  end,
  on_attach = function(client, bufnr)
    if client:supports_method('textDocument/foldingRange') then
      for _, winid in ipairs(vim.fn.win_findbuf(bufnr)) do
        vim.wo[winid].foldexpr = 'v:lua.vim.lsp.foldexpr()'
      end
    end
    client.server_capabilities.documentFormattingProvider = false
  end,
  settings = {
    Lua = {
      completion = {
        postfix = '.',
      },
      hint = {
        enable = true,
      },
      codeLens = {
        enable = true,
      },
      semanticTokens = {
        renderDocumentationMarkup = false,
      },
    },
  },
}
