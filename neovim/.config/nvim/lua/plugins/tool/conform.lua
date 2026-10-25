local function project_formatter(bufnr)
  local conform = require('conform')
  local oxfmt_root = conform.get_formatter_info('oxfmt', bufnr).cwd
  local prettier_root = conform.get_formatter_info('prettier', bufnr).cwd

  -- Prefer the nearest config; oxfmt wins when both are in the same directory.
  if oxfmt_root and (not prettier_root or #oxfmt_root >= #prettier_root) then
    return 'oxfmt'
  end
  if prettier_root then
    return 'prettier'
  end
end

local function web_formatters(bufnr)
  return { project_formatter(bufnr) or 'prettier', lsp_format = 'never' }
end

return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  opts = {
    default_format_opts = { lsp_format = 'fallback' },
    format_on_save = function(bufnr)
      local formatter = require('conform').formatters_by_ft[vim.bo[bufnr].filetype]
      if formatter == web_formatters and project_formatter(bufnr) then
        return { timeout_ms = 1000, lsp_format = 'never' }
      end
    end,
    formatters = {
      oxfmt = {
        -- A Vite config alone does not mean the project uses oxfmt.
        cwd = function(_, ctx)
          return vim.fs.root(ctx.dirname, {
            '.oxfmtrc.json',
            '.oxfmtrc.jsonc',
            'oxfmt.config.ts',
            'oxfmt.config.mts',
          })
        end,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      nix = { 'nixfmt' },
      python = { 'isort', 'black' },
      go = { 'gofumpt', 'goimports' },

      html = web_formatters,
      css = web_formatters,
      less = web_formatters,
      scss = web_formatters,
      javascript = web_formatters,
      typescript = web_formatters,
      javascriptreact = web_formatters,
      typescriptreact = web_formatters,
      vue = web_formatters,
      json = web_formatters,
      jsonc = web_formatters,
      yaml = web_formatters,
      markdown = web_formatters,
      graphql = web_formatters,
    },
  },
  keys = {
    {
      '<leader>fj',
      function()
        require('conform').format({ async = true })
      end,
      desc = 'Format Document',
      mode = { 'n', 'v' },
    },
  },
}
