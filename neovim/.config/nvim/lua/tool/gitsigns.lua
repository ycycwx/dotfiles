local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then
  vim.notify('Could not load gitsigns')
  return
end

gitsigns.setup({
  signs = {
    add = { text = '┃' },
    change = { text = '┃' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signs_staged = {
    add = { text = '┃' },
    change = { text = '┃' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
    untracked = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  auto_attach = true,
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  -- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  on_attach = function(bufnr)
    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gitsigns.next_hunk()
      end)
      return '<Ignore>'
    end, { buffer = bufnr, expr = true, desc = 'Change' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gitsigns.prev_hunk()
      end)
      return '<Ignore>'
    end, { buffer = bufnr, expr = true, desc = 'Change' })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<leader>gs', gitsigns.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })
    vim.keymap.set({ 'n', 'v' }, '<leader>gr', gitsigns.reset_hunk, { buffer = bufnr, desc = 'Reset hunk' })
    vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage hunk' })
    vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { buffer = bufnr, desc = 'Stage buffer' })
    vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer, { buffer = bufnr, desc = 'Reset buffer' })
    vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
    vim.keymap.set('n', '<leader>gb', function()
      gitsigns.blame_line({ full = true })
    end, { buffer = bufnr, desc = 'Blame lines' })

    -- origin keybinding
    vim.keymap.set('n', '<leader>bl', function()
      gitsigns.blame_line({ full = false })
    end, { buffer = bufnr, desc = 'Blame line' })

    vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted, { buffer = bufnr, desc = 'Deleted' })
    vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { buffer = bufnr, desc = 'Line Blame' })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    vim.keymap.set({ 'o', 'x' }, 'ah', ':<C-U>Gitsigns select_hunk<CR>')
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { link = 'DiffText' })
    vim.api.nvim_set_hl(0, 'GitSignsAddInline', { link = 'GitSignsAddLn' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteInline', { link = 'GitSignsDeleteLn' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeInline', { link = 'GitSignsChangeLn' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { link = 'DiffDelete' })

    vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitSignsAdd' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitSignsChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsChange' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitSignsDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitSignsDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsUntracked', { link = 'GitSignsAdd' })
  end,
})
