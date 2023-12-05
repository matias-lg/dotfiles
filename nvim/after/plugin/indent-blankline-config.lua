vim.opt.listchars = "eol:↴"

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#434343 gui=nocombine]] -- gray color of the line
local highlight = {
    "IndentBlanklineIndent1"
}

require "ibl".setup {
    indent = { highlight = highlight },
    scope = { enabled = false }
}

