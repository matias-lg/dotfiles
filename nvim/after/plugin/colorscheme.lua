vim.cmd [[let g:gruvbox_material_diagnostic_virtual_text = 'colored']]
vim.cmd [[colorscheme gruvbox-material]]

require("rose-pine").setup(
    { dark_variant = 'moon',
        disable_italics = true
    }
)
vim.cmd('colorscheme rose-pine')
