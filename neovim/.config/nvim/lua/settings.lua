-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = ',' -- change leader to a comma

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
-- vim.opt.showmatch = true -- highlight matching parenthesis
-- vim.opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
-- vim.opt.colorcolumn = '+1' -- line lenght marker according to editorconfig.max_line_length

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  --- A specific group easy to override
  group = vim.api.nvim_create_augroup('highlight_on_yank', {}),
  desc = 'Briefly highlight yanked text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto commenting new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- remove line lenght marker for selected filetypes
vim.cmd([[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]])

-- 2 spaces for selected filetypes
vim.cmd([[
  autocmd FileType xml,html,xhtml,css,scss,lua,yaml setlocal shiftwidth=2 tabstop=2
]])

-- mts cts TypeScript
vim.cmd([[autocmd BufNewFile,BufRead *.mts,*.cts setf typescript]])

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
vim.cmd([[command Term :botright vsplit term://$SHELL]])

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
vim.cmd([[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]])

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'gzip',
  'zip',
  'zipPlugin',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logipat',
  'rrhelper',
  'spellfile_plugin',
  'matchit',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
