require("nvim-treesitter.configs").setup({
	highlight = {
		disable = { "html" },
	},
	incremental_selection = { enable = true },
	autotag = { enable = true },
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
