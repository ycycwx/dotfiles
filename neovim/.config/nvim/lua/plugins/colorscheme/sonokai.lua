return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    -- Available styles: 'default', 'espresso', 'shusia', 'maia', 'atlantis', 'andromeda'
    vim.g.sonokai_style = 'atlantis'
    vim.g.sonokai_enable_italic = 1
    vim.g.sonokai_better_performance = 1
  end,
}
