require('impatient')
require("packer-config")

local opt = vim.opt
local cmd = vim.cmd

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

-- set word wrap at 80 characters for markdown and tex files
vim.cmd([[
  au FileType markdown, tex setlocal wrap
]])

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

if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 1,
  }
end

vim.o.pumheight = 7

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
