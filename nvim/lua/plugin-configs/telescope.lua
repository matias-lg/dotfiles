local trouble = require("trouble.providers.telescope")
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
				["<c-t>"] = trouble.open_with_trouble,
				["<C-h>"] = "which_key",
			},
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},

    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- other options: 'ignore_case' or 'respect_case'
      },

      file_browser = {
                theme = "ivy",
                hijack_netrw = true
            }
    }

	},
})

telescope.load_extension("fzf")
