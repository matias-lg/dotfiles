local no_preview = function()
  return require('telescope.themes').get_dropdown({
    -- initial_mode = "normal",
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      prompt = { "─", "│", " ", "│", '┌', '┐', "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
    width = 0.8,
    previewer = false,
    prompt_title = false,
  })
end


require('telescope').setup {
  defaults = {
    pickers = {
      buffers = { initial_mode = "normal" },
    },
    mappings = {
      -- i = {
      --   ['<esc>'] = require('telescope.actions').close,
      -- },
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
}


require("telescope").load_extension "file_browser"
require("telescope").load_extension "fzf"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

function _G.find_files_no_preview()
  require "telescope.builtin".find_files(no_preview())
end

map("n", "<leader>ff", ":lua find_files_no_preview()<CR>", opts)


