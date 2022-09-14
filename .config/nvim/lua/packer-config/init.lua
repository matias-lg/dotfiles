return require("packer").startup(function()
    -- packer
    use("wbthomason/packer.nvim")

    -- nvim UI/utils
    use("nvim-lualine/lualine.nvim") --> a statusline written in lua
    use("akinsho/bufferline.nvim") --> visible buffer tabs
    use("kyazdani42/nvim-tree.lua") --> file explorer
    use("lukas-reineke/indent-blankline.nvim") --> show indent lines
    use("rcarriga/nvim-notify")
    use("kyazdani42/nvim-web-devicons") --> enable icons
    use("norcalli/nvim-colorizer.lua")

    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --> native fzf plugin

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

    -- colorschemes
    use("navarasu/onedark.nvim")
    use { "catppuccin/nvim", as = "catppuccin" }

    -- lsp, completion
    use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
    use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
    use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
    use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
    use("hrsh7th/nvim-cmp") --> Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
    use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
    use("L3MON4D3/LuaSnip") --> Snippets plugin
end)
