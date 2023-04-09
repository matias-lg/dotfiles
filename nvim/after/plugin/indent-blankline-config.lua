-- vim.opt.list = true
vim.opt.listchars="eol:↴"
-- vim.opt.listchars:append "trail: "

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#434343 gui=nocombine]]         -- gray color of the line
-- vim.opt.list = true
require("indent_blankline").setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
}
