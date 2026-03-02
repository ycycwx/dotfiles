local group = vim.api.nvim_create_augroup('ycycwx', {})

-- Indent wrapped lines based on indent settings except for ignored filetypes
local ignored_filetypes = { 'text', 'markdown', 'org' }
---@alias option_scope "global" | "local" | nil
---@param scope option_scope
local function set_breakindentopt(scope)
  local indent
  if vim.api.nvim_get_option_value('expandtab', { scope = scope }) then
    indent = vim.api.nvim_get_option_value('shiftwidth', { scope = scope })
  else
    indent = vim.api.nvim_get_option_value('tabstop', { scope = scope })
  end
  vim.api.nvim_set_option_value('breakindentopt', 'shift:' .. indent, { scope = scope })
end

-- This autocmd implicitly rely on `vim-sleuth` to trigger
vim.api.nvim_create_autocmd({ 'OptionSet' }, {
  group = group,
  pattern = { 'expandtab', 'shiftwidth', 'tabstop' },
  desc = "Set 'breakindentopt' based on indent settings",
  callback = function(args)
    local is_ignored_filetype = vim.tbl_contains(ignored_filetypes, vim.bo[args.buf].filetype)
    ---@type option_scope
    local scope = vim.v.option_type
    if vim.v.option_command == 'set' and not is_ignored_filetype then
      scope = nil
    end

    if scope == 'local' and is_ignored_filetype then
    else
      set_breakindentopt(scope)
    end
  end,
})

vim.api.nvim_create_autocmd('BufRead', {
  group = group,
  desc = 'Restore last cursor position',
  callback = function(args)
    local bufnr = args.buf
    local line, col = unpack(vim.api.nvim_buf_get_mark(bufnr, '"'))
    local winid = vim.api.nvim_get_current_win()

    local end_line = vim.api.nvim_buf_line_count(bufnr)
    local end_col = #vim.api.nvim_buf_get_lines(bufnr, end_line - 1, end_line, true)[1]
    if line < end_line or (line == end_line and col <= end_col) then
      vim.api.nvim_win_set_cursor(winid, { line, col })
    end
  end,
})

vim.api.nvim_create_autocmd({
  'FocusGained',
  'BufEnter',
  'CursorHold',
}, {
  group = group,
  desc = 'Reload buffer on focus',
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd('checktime')
    end
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  --- A specific group easy to override
  group = vim.api.nvim_create_augroup('highlight_on_yank', {}),
  desc = 'Briefly highlight yanked text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Filetype specific
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'qf',
  desc = 'Disallow change buf for quickfix',
  callback = function()
    vim.wo.winfixbuf = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'go',
  desc = 'Set indent for go',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
  end,
})

-- Sync working directory with LSP root (replaces project.nvim)
-- This implementation handles multi-root projects by finding the common prefix
-- and uses appropriate scope (cd/tcd/lcd) based on window/tab layout.
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  desc = 'Sync working directory with LSP root',
  callback = function(args)
    local bufnr = args.buf
    local clients = vim.lsp.get_clients({ bufnr = bufnr })

    -- Collect unique root dirs from all attached LSP clients.
    local root_dirs = {} --- @type table<string, true?>
    for _, client in ipairs(clients) do
      local root_dir = client.config.root_dir
      if root_dir then
        root_dirs[root_dir] = true
      end
    end
    local paths = vim.tbl_keys(root_dirs) --- @type string[]
    if #paths == 0 then
      return
    end

    -- Find the longest common prefix of all root dirs.
    local path = paths[1]
    local len = #path
    for i = 2, #paths do
      local current_path = paths[i]
      local current_len = #current_path
      if current_len < len then
        len = current_len
      end
      for j = 1, len do
        if path:byte(j) ~= current_path:byte(j) then
          len = j - 1
          break
        end
      end
    end
    path = path:sub(1, len)

    -- Avoid trigger `DirChanged` if the path is unchanged.
    if path == vim.fn.getcwd() then
      return
    end

    -- Set the working directory with appropriate scope.
    local tabpage = vim.api.nvim_get_current_tabpage()
    local tabpages = vim.api.nvim_list_tabpages()
    local winids = vim.api.nvim_tabpage_list_wins(tabpage)
    winids = vim --- @type integer[]
      .iter(winids)
      --- @param winid integer
      :filter(function(winid)
        local buf = vim.api.nvim_win_get_buf(winid)
        return vim.bo[buf].buftype == ''
      end)
      :totable()
    if #winids == 1 then
      if #tabpages == 1 then
        vim.cmd.cd(path)
      else
        vim.cmd.tcd(path)
      end
    elseif #winids > 1 then
      vim.cmd.lcd(path)
    end
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('eslint_format_on_save', {}),
  callback = function()
    if vim.fn.exists(':LspEslintFixAll') ~= 0 then
      vim.cmd('LspEslintFixAll')
    end
  end,
})
