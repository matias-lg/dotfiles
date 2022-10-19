require("packer-config")
require("options")
require("keymap-config")
require("autopairs-config")
require("lualine-config")
require("nvim-tree-config")
require("comment-nvim-config")
require("colorizer-config")
require("telescope-config")
require("bufferline-config")
require("gitsigns-config")
require("copilot-config")
--> tree-sitter and tree-sitter plugins
require("treesitter-config")
--> lsp modules
require("lsp-config.cfg")

require("notify").setup({
    background_colour = "#000000",
})
--> colorscheme
require("colors-config.init")
--> nvim surround
require("nvim-surround-config")
--> settings for markdown <--
require("markdown-config")
