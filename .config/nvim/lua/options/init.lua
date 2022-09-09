local set = vim.opt
local cmd = vim.cmd
-- set.shell = "/bin/sh"

set.expandtab = true
--set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.relativenumber = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.laststatus=3
set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = false
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
--set.conceallevel = 2

set.number = true
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"
set.clipboard = "unnamedplus"

vim.o.pumheight = 7
set.list = false

vim.notify = require("notify")
