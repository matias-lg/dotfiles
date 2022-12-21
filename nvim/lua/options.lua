local opt = vim.opt
local cmd = vim.cmd
-- set.shell = "/bin/sh"

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.laststatus = 3

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.scrolloff = 5
opt.fileencoding = "utf-8"

opt.cursorline = true
opt.completeopt = "menuone,noselect"

opt.mouse = "a"
opt.clipboard = "unnamedplus"

vim.o.pumheight = 7
