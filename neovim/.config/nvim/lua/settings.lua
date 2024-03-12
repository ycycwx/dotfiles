-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = ',' -- change leader to a comma
vim.opt.mouse = 'a' -- enable mouse support
vim.opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
vim.opt.swapfile = false -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true -- show line number
vim.opt.showmatch = true -- highlight matching parenthesis
vim.opt.foldmethod = 'marker' -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '+1' -- line lenght marker according to editorconfig.max_line_length
vim.opt.splitright = true -- vertical split to the right
vim.opt.splitbelow = true -- orizontal split to the bottom
vim.opt.ignorecase = true -- ignore case letters when search
vim.opt.smartcase = true -- ignore lowercase for the whole pattern
vim.opt.linebreak = true -- wrap on word boundary

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
  false
)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true -- enable background buffers
vim.opt.history = 100 -- remember n lines in history
vim.opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
vim.opt.termguicolors = true -- enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- shift 4 spaces when tab
vim.opt.tabstop = 4 -- 1 tab == 4 spaces
vim.opt.smartindent = true -- autoindent new lines

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
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
vim.opt.completeopt = 'menu,menuone,noselect'

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

-- disable nvim intro
vim.opt.shortmess:append('sI')
