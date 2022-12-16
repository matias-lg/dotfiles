require("nvim-treesitter.configs").setup({
  --> parsers <--
  ensure_installed = {
    "c",
    "css",
    "python",
    "bash",
    "javascript",
    "typescript",
    "help",
    "lua",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "markdown" },
  },

  --> textobjects selection <--
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})
