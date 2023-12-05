vim.cmd('colorscheme gruvbox')

vim.cmd [[let g:gruvbox_material_current_word = 'grey background']]
local close_func = function(bufnum)
    local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
    if bufdelete_avail then
        bufdelete.bufdelete(bufnum, true)
    else
        vim.cmd.bdelete { args = { bufnum }, bang = true }
    end
end


require("bufferline").setup {
    options = {
        offsets = {
            { filetype = "NvimTree", text = "", padding = 1 },
        },
        diagnostics = "nvim_lsp",
        numbers = "ordinal",
        close_command = close_func,
        right_mouse_command = close_func,
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        separator_style = "thin",
    },
    highlights = {
        fill = {
            guibg = "#FFFFFF",
        }
    }
}

