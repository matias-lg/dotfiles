require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  incremental_selection = { enable = true },
  autotag = { enable = true },
  ensure_installed =  { "c", "lua", "vim", "vimdoc", "query", "gitcommit", "go", "python" },
})

require("ts_context_commentstring").setup({
  enable_autocmd = false,
})
