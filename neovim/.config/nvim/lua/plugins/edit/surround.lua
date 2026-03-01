return {
  'kylechui/nvim-surround',
  event = 'VeryLazy',
  init = function()
    -- Disable insert mode mappings from nvim-surround
    vim.g.nvim_surround_no_insert_mappings = true
  end,
  opts = {},
}
