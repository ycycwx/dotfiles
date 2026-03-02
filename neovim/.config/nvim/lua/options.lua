vim.o.exrc = true

-- Edit
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.list = true
vim.o.includeexpr = "substitute(v:fname,'\\.','/','g')"
vim.o.jumpoptions = 'stack'
vim.o.swapfile = false
vim.o.clipboard = 'unnamedplus' -- copy/paste to system clipboard

-- Interface
vim.o.confirm = true
vim.o.splitkeep = 'screen'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.number = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.mouse = 'a'
vim.o.mousemoveevent = true
vim.o.termguicolors = true
vim.o.title = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.conceallevel = 2
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.o.smoothscroll = true
vim.o.pumblend = 12
vim.o.pumheight = 12
vim.o.guifont = 'Cascadia Code NF:h12'
vim.o.foldenable = true
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- Use vim.opt for complex types and methods to keep code clean
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }
vim.opt.shortmess:append('I')
vim.opt.fillchars = {
  eob = ' ',
  diff = '╱',
  foldopen = '',
  foldclose = '',
  foldsep = '▕',
}
vim.opt.guicursor = {
  'n-v-c-sm:block-Cursor/lCursor',
  'i-ci-ve:ver25-Cursor/lCursor',
  'r-cr-o:hor20-Cursor/lCursor',
}

vim.opt.runtimepath:append(vim.fs.joinpath(vim.fn.stdpath('data'), 'site'))
