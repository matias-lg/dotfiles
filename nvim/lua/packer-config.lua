local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- startup time, perf
    use("lewis6991/impatient.nvim")
    use("dstein64/vim-startuptime")
    -- packer
    use("wbthomason/packer.nvim")

    -- nvim UI/utils
    use("RRethy/vim-illuminate")
    use("nvim-lualine/lualine.nvim") --> a statusline written in lua
    use("famiu/bufdelete.nvim")
    use("akinsho/bufferline.nvim") --> visible buffer tabs
    use("kyazdani42/nvim-tree.lua") --> file explorer
    use("lukas-reineke/indent-blankline.nvim") --> show indent lines
    use("kyazdani42/nvim-web-devicons") --> enable icons
    use("uga-rosa/ccc.nvim")
    use("romainl/vim-cool") --> better search highlighting
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use("rcarriga/nvim-notify")
    -- Telescope
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } --> native fzf plugin
    use('nvim-telescope/telescope-file-browser.nvim')

    --> treesitter & treesitter modules/plugins
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
    use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
    use("nvim-treesitter/playground")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Text manipulation
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("kylechui/nvim-surround")

    -- Git
    use("tpope/vim-fugitive")
    use("lewis6991/gitsigns.nvim")
    -- use("sindrets/diffview.nvim")

    -- colorschemes
    use('ellisonleao/gruvbox.nvim')
    use('rose-pine/neovim')
    use('rmehri01/onenord.nvim')
    use('shaunsingh/nord.nvim')

    -- lsp, completion
    use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
    use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...

    use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
    use("hrsh7th/nvim-cmp") --> Autocompletion plugin
    use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
    use("L3MON4D3/LuaSnip") --> Snippets plugin

    -- markdown
    use("preservim/vim-markdown")

    use("zbirenbaum/copilot.lua") --> GitHub Copilot
    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }

    -- LaTeX
    use { "lervag/vimtex" }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
