return require("packer").startup(function()
    use("lukas-reineke/indent-blankline.nvim")
    use("wbthomason/packer.nvim") --> packer plugin manager
    use("kyazdani42/nvim-web-devicons") --> enable icons
    use("norcalli/nvim-colorizer.lua")
    use("nvim-lualine/lualine.nvim") --> a statusline written in lua
    use("akinsho/bufferline.nvim") --> visible buffer
    use("kyazdani42/nvim-tree.lua") --> file explorer
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim") --> Find, Filter, Preview, Pick. All lua, all the time.
    use("numToStr/Comment.nvim")
    use("rcarriga/nvim-notify")
    use("windwp/nvim-autopairs")
    use("jubnzv/mdeval.nvim") --> evaluates code blocks inside markdown, vimwiki, orgmode.nvim and norg docs
    use { 'michaelb/sniprun', run = 'bash ./install.sh' } --> REPL, run code blocks/lines
    use("TimUntersberger/neogit") --> git
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --> native fzf plugin
    --> colorschemes
    use("navarasu/onedark.nvim")
    use { "catppuccin/nvim", as = "catppuccin" }
    --> treesitter & treesitter modules/plugins
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
    use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
    use("nvim-treesitter/nvim-treesitter-refactor")
    use("p00f/nvim-ts-rainbow")
    use("nvim-treesitter/playground")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    --> lsp
    use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
    use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
    use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
    use("glepnir/lspsaga.nvim") --> icons for LSP diagnostics
    use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
    use("hrsh7th/nvim-cmp") --> Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
    use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
    use("L3MON4D3/LuaSnip") --> Snippets plugin
    use("kylechui/nvim-surround") --> vim-surround
end)
