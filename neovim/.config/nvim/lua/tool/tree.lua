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

local ok, tree = pcall(require, 'nvim-tree')
if not ok then
  vim.notify('Could not load tree')
  return
end

tree.setup({
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = 'name',
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = true,
  on_attach = 'disable',
  remove_keymaps = false,
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = function()
      local columns = vim.go.columns
      return math.floor(columns * 0.2) > 25 and math.floor(columns * 0.2) or 25
    end,
    hide_root_folder = false,
    side = 'left',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = 'editor',
        border = 'rounded',
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = 'none',
    root_folder_label = ':~:s?$?/..?',
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = '└',
        edge = '│',
        item = '│',
        bottom = '─',
        none = ' ',
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = '',
        symlink = '',
        bookmark = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '★',
          deleted = '',
          ignored = '◌',
        },
      },
    },
    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  system_open = {
    cmd = '',
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = 'cursor',
        border = 'shadow',
        style = 'minimal',
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = {
            'notify',
            'packer',
            'qf',
            'diff',
            'fugitive',
            'fugitiveblame',
          },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = 'gio trash',
    require_confirm = true,
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
})

-- nvim-tree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader><leader>', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
