-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `keymapping.lua`:
--- https://github.com/kyazdani42/nvim-tree.lua#keybindings

-- Note: options under the g: command should be set BEFORE running the
--- setup function:
--- https://github.com/kyazdani42/nvim-tree.lua#setup
--- See: `help NvimTree`
local map = vim.api.nvim_set_keymap
local default_opts = {
  noremap = true,
  silent = true,
}

vim.g.nvim_tree_width_allow_resize = 1

require('nvim-tree').setup({
  open_on_setup = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 32,
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'icon',
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
      glyphs = {
        default = '‣ ',
      },
    },
    indent_markers = {
      enable = true,
    },
  },
  respect_buf_cwd = true,
})

-- nvim-tree
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader><leader>', ':NvimTreeToggle<CR>', default_opts) -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts) -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file
