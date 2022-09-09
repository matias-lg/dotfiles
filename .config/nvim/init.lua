require("packer-config")
require("options")
require("keymap-config")
require("autopairs-config")
require("lualine-config")
require("nvim-tree-config")
require("comment-nvim-config")
require("colorizer-config")
require("sniprun-config")
require("telescope-config")
require("bufferline-config")
--> tree-sitter and tree-sitter plugins
require("treesitter-config")
--> lsp modules
require("lsp-config.cfg")
--> git integration
require("neogit-setup")

require("notify").setup({
    background_colour = "#000000",
})
--> colorscheme
require("colors-config.catpuccin")
--> nvim surround
require("nvim-surround-config")
