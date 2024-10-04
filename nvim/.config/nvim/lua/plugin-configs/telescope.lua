local trouble = require("trouble.sources.telescope")
local telescope = require("telescope")
telescope.load_extension("scope")
telescope.load_extension("aerial")
telescope.load_extension("projects")

telescope.setup({
	defaults = {
    pickers = {
      buffers = { initial_mode = "normal"},
    },
		mappings = {
			i = {
				["<c-t>"] = trouble.open,
			},
			n = { ["<c-t>"] = trouble.open },
		},

    extensions = {

      file_browser = {
                theme = "ivy",
                hijack_netrw = true
            }
    }

	},
})

