return require("packer").startup(function(use)
  -- packer
  use("wbthomason/packer.nvim")

  -- nvim UI/utils
  use("nvim-lualine/lualine.nvim") --> a statusline written in lua
  use("akinsho/bufferline.nvim") --> visible buffer tabs
  use("kyazdani42/nvim-tree.lua") --> file explorer
  use("lukas-reineke/indent-blankline.nvim") --> show indent lines
  use("rcarriga/nvim-notify")
  use("kyazdani42/nvim-web-devicons") --> enable icons
  use("uga-rosa/ccc.nvim")
  use("romainl/vim-cool") --> better search highlighting
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --> native fzf plugin

  --> treesitter & treesitter modules/plugins
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
  use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
  use("nvim-treesitter/nvim-treesitter-refactor")
  use("p00f/nvim-ts-rainbow")
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Text manipulation
  use("numToStr/Comment.nvim")
  use("windwp/nvim-autopairs")
  use("kylechui/nvim-surround")

  -- Git
  use("tpope/vim-fugitive")
  use("rhysd/git-messenger.vim")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")

  -- colorschemes
  use("sainnhe/gruvbox-material")
  use("catppuccin/nvim")
  use("eddyekofo94/gruvbox-flat.nvim")
  use("folke/tokyonight.nvim")
  -- lsp, completion
  use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
  use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...

  use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
  use("hrsh7th/nvim-cmp") --> Autocompletion plugin
  use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
  use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
  use("L3MON4D3/LuaSnip") --> Snippets plugin

  -- markdown
  use("ellisonleao/glow.nvim")
  use("preservim/vim-markdown")

  use("zbirenbaum/copilot.lua") --> GitHub Copilot
end)
