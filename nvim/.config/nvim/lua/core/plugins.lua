local enabled = require("core.utils.utils").enabled

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local plugins = exist and type(user_config) == "table" and user_config.plugins or {}
require("lazy").setup({
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<M-a>",
            accept_line = "<M-l>",
            accept_word = "<M-k>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<M-c>",
          }
        }
      })
    end,
  },

  {
    "lervag/vimtex",
    config = function()
      require("plugin-configs.vimtex")
    end,
    ft = "tex"
  },
  { "romainl/vim-cool",          lazy = false },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "stevearc/aerial.nvim",
    cond = enabled(group, "aerial"),
    cmd = "AerialToggle",
    config = function()
      require("plugin-configs.aerial")
    end,
  },
  {
    "goolord/alpha-nvim",
    cond = enabled(group, "alpha"),
    lazy = false,
    config = function()
      require("plugin-configs.alpha")
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    config = function()
      require("oil").setup({
        view_options = {
          show_hidden = true
        }
      })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "numToStr/Comment.nvim",
    cond = enabled(group, "comment"),
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    cond = enabled(group, "gitsigns"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.gitsigns")
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    cond = enabled(group, "indent_blankline"),
    event = "VimEnter",
    config = function()
      require("ibl").setup({
        scope = { enabled = false }
      })
    end,
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    cond = enabled(group, "lsp_zero"),
    event = "VimEnter",
    branch = "v2.x",
    config = function()
      require("plugin-configs.lsp")
    end,
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },
  {
    "folke/neodev.nvim",
    cond = enabled(group, "neodev"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neodev")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    cond = enabled(group, "neoscroll"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.neoscroll")
    end,
  },

  {
    "Shatur/neovim-session-manager",
    cond = enabled(group, "session_manager"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.session")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    cond = enabled(group, "null_ls"),
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugin-configs.null-ls")
    end,
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        cmd = { "NullLsInstall", "NullLsUninstall" },
        config = function()
          require("plugin-configs.mason-null-ls")
        end,
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    cond = enabled(group, "autopairs"),
    event = "InsertEnter",
    config = function()
      require("plugin-configs.autopairs")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    cond = enabled(group, "cmp"),
    event = "InsertEnter",
    config = function()
      require("plugin-configs.cmp")
    end,
    dependencies = {
      { "onsails/lspkind.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
  { "NvChad/nvim-colorizer.lua", cond = enabled(group, "colorizer"), event = "VimEnter" },
  {
    "mfussenegger/nvim-dap",
    cond = enabled(group, "dap"),
    event = "VeryLazy",
    config = function()
      require("plugin-configs.dap")
    end,
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        config = function()
          require("plugin-configs.mason-nvim-dap")
        end,
      },
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
          require("dapui").setup()
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = function()
          require("nvim-dap-virtual-text").setup()
        end,
      },
    },
  },
  {
    "kylechui/nvim-surround",
    cond = enabled(group, "surround"),
    cmd = "VimEnter",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cond = enabled(group, "treesitter"),
    event = { "BufReadPost", "BufNewFile" },
    cmd = "VimEnter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("plugin-configs.treesitter")
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "windwp/nvim-ts-autotag" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
  },

  { "ellisonleao/gruvbox.nvim", priority = 1000,  config = true, lazy = false },

  {
    "navarasu/onedark.nvim",
    cond = enabled(group, "onedark"),
  },


  { "nvim-lua/plenary.nvim" },
  {
    "ahmedkhalf/project.nvim",
    cond = enabled(group, "project"),
    event = "VimEnter",
    config = function()
      require("project_nvim").setup()
    end,
  },
  {
    "tiagovla/scope.nvim",
    cond = enabled(group, "scope"),
    event = "VimEnter",
    config = function()
      require("plugin-configs.scope")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cond = enabled(group, "telescope"),
    cmd = "Telescope",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("plugin-configs.telescope")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cond = enabled(group, "toggleterm"),
    event = "VeryLazy",
    config = function()
      _G.term = require("plugin-configs.toggleterm")
    end,
  },
  {
    "folke/trouble.nvim",
    cond = enabled(group, "trouble"),
    cmd = { "TroubleToggle", "Trouble" },
  },

  {
    "folke/zen-mode.nvim",
    cond = enabled(group, "zen"),
    cmd = "ZenMode",
    config = function()
      require("plugin-configs.zenmode")
    end,
  },
  plugins,
}, {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = { "tohtml", "gzip", "zipPlugin", "netrwPlugin", "tarPlugin" },
    },
  },
})
