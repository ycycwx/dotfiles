return {
  'polirritmico/monokai-nightasty.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    dark_style_background = 'default', -- Options: 'default', 'darker', 'black'
    transparent = false, -- Set to true if you want to use terminal background
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = true },
      variables = {},
    },
  },
  config = function(_, opts)
    -- We can set the background to 'black' for that classic deep look
    opts.dark_style_background = 'black'
    require('monokai-nightasty').load(opts)
  end,
}
