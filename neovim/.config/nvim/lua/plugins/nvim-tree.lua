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
local g = vim.g
local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}

g.nvim_tree_icons = {
  default = '‣ ',
}

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
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
    ignore = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
})

-- nvim-tree
-- map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)       -- open/close
map('n', '<leader><leader>', ':NvimTreeToggle<CR>', default_opts) -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts) -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file
