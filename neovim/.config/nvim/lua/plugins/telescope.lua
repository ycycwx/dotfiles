local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

-- " Using Lua functions
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], default_opts)
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<cr>]], default_opts)
map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], default_opts)
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], default_opts)
map('n', '<leader>gp', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], default_opts)
map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], default_opts)
map('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], default_opts)
map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<cr>]], default_opts)
map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<cr>]], default_opts)
map('n', '<leader>wo', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]], default_opts)
