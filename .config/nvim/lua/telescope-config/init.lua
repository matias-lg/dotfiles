require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = 'smart_case', -- other options: 'ignore_case' or 'respect_case'
            }
        }
    },
    --[[ pickers = { ]]
    --[[     find_files = { ]]
    --[[         theme = "ivy", ]]
    --[[     }, ]]
    --[[     live_grep = { ]]
    --[[         theme = "ivy", ]]
    --[[     } ]]
    --[[ }, ]]
}
