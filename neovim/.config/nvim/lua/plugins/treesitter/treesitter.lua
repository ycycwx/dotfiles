---@type LazyPluginSpec
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    -- As of the incompatible main branch rewrite, nvim-treesitter only manages parser installation.
    -- Highlighting is provided by Neovim natively.

    -- Install required parsers
    require('nvim-treesitter').install({
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

    -- Enable Neovim's native treesitter highlighting for all supported filetypes
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
      callback = function(args)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end
        -- Fallback to regex syntax if treesitter parser is missing
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
