require("bufferline").setup {
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and "" or ""
            return icon .. count
        end,
    }
}