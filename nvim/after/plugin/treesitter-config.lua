require("nvim-treesitter.configs").setup({
    --> parsers <--
    ensure_installed = {
        "bash",
        "html",
        "json",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "tsx",
        "vim",
        "yaml",
        "c",
        "cpp",
        "css",
        "python",
        "javascript",
        "typescript",
        "help",
        "lua",
    },
    
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
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<nop>",
            node_decremental = "<bs>",
        },
    },
})

require('ts_context_commentstring').setup {}
vim.g.skip_ts_context_commentstring_module = true
