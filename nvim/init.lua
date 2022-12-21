require('impatient')

require('illuminate-config')
require("packer-config")
require("copilot-config")
require("options")
require("diffview-config")
require("keymaps")
require("autopairs-config")
require("lualine-config")
require("nvim-tree-config")
require("comment-nvim-config")
require("colorizer-config")
require("telescope-config")
require("bufferline-config")
require("gitsigns-config")
--> tree-sitter and tree-sitter plugins
require("treesitter-config")
--> lsp modules
require("lsp-config.cfg")
require("notify").setup({
  background_colour = "#000000",
})
--> colorscheme
require("colorscheme")
--> nvim surround
require("nvim-surround-config")
--> settings for markdown <--
require("markdown-config")
