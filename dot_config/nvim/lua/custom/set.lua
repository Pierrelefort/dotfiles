-- [[ Basip option ]]
-- Leader key setup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Rows management
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 10
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '80'

vim.opt.mouse = 'a'

vim.opt.showmode = false

-- Indenting stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false

-- Colors
vim.opt.termguicolors = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

-- Search
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
vim.opt.incsearch = true

vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.cursorline = true

vim.opt.confirm = true
