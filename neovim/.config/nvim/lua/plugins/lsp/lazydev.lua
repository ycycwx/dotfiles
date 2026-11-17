---@type LazyPluginSpec
return {
  ---@module 'lazydev'
  'folke/lazydev.nvim',
  ft = 'lua',
  ---@type lazydev.Config
  opts = {
    library = {
      {
        path = 'nvim-lspconfig',
        words = { 'lspconfig' },
      },
      {
        path = 'lazy.nvim',
        words = { 'Lazy.*Spec' },
      },
    },
    enabled = function(root_dir)
      if vim.g.lazydev_enabled == false then
        return false
      end

      -- Disable if workspace.library is set.
      local readable, lines = pcall(vim.fn.readfile, root_dir .. '/.luarc.json')
      if not readable then
        return true
      end
      local decoded, luarc = pcall(vim.json.decode, table.concat(lines, '\n'))
      return not (decoded and type(luarc) == 'table' and type(luarc.workspace) == 'table' and luarc.workspace.library)
    end,
  },
}
