-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

-- define indent dot here
-- vim.opt.list = true
-- vim.opt.listchars:append('space:⋅')

require('ibl').setup({
  indent = { char = '▏' },
  exclude = {
    filetypes = {
      'help',
      'git',
      'markdown',
      'text',
      'terminal',
      'lspinfo',
      'packer',
    },
    buftypes = {
      'terminal',
      'nofile',
    }
  },
  scope = {
    show_start = false,
  },
})
