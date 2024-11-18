local ok, lualine = pcall(require, 'lualine')
if not ok then
  vim.notify('Could not load lualine')
  return
end

local lazy_status_ok, lazy_status = pcall(require, 'lazy.status')
if not lazy_status_ok then
  vim.notify('Could not load lazy.status')
  return
end

local function indent()
  if vim.o.expandtab then
    return 'SW:' .. vim.o.shiftwidth
  else
    return 'TS:' .. vim.o.tabstop
  end
end

local function lsp()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    return ''
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  local msg = table.concat(names, ', ')
  if msg == '' then
    return ''
  else
    return ' ' .. msg
  end
end

lualine.setup({
  sections = {
    lualine_c = {
      lsp,
    },
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = { fg = '#ff9e64' },
      },
      'overseer',
      'copilot',
      'filetype',
      indent,
      'encoding',
      'fileformat',
    },
  },
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {
      statusline = {
        'alpha',
      },
    },
    always_divide_middle = true,
    globalstatus = false,
    section_separators = { left = '', right = '' },
    component_separators = { left = '│', right = '│' },
  },
  extensions = {
    'man',
    'quickfix',
    'nvim-tree',
    'neo-tree',
    'toggleterm',
    'symbols-outline',
    'aerial',
    'nvim-dap-ui',
    'mundo',
  },
})
