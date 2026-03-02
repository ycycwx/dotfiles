---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufReadPost', 'BufNewFile' },
  build = ':TSUpdate',
  config = function()
    -- As of the incompatible main branch rewrite, nvim-treesitter only manages parser installation.
    -- Highlighting is provided by Neovim natively.

    -- Install required parsers
    -- In the new main branch, we use the ensure_installed list if supported,
    -- or manually install them if they are missing.
    local ts = require('nvim-treesitter')
    if ts.install then
      ts.install({
        'svelte',
        'javascript',
        'typescript',
        'tsx',
        'css',
        'html',
        'lua',
        'vim',
        'vimdoc',
        'json',
        'markdown',
        'markdown_inline',
      })
    end

    -- Enable Neovim's native treesitter highlighting for all supported filetypes
    local function enable_ts_highlight(buf)
      buf = buf or vim.api.nvim_get_current_buf()
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return
      end
      -- Use pcall to avoid errors if parser is not installed
      pcall(vim.treesitter.start, buf)
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
      callback = function(args)
        enable_ts_highlight(args.buf)
      end,
    })

    -- Manually trigger for currently open buffers since plugin might be lazy-loaded
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype ~= '' then
        enable_ts_highlight(buf)
      end
    end
  end,
}
