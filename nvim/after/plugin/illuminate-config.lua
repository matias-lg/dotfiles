require('illuminate').configure({
    delay = 10,
    filetypes_denylist = {
        'dirvish',
        'fugitive',
        'TelescopePrompt',
        'Trouble',
        'NvimTree',
        'DiffviewFiles',
    },
});

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#434343 gui=nocombine]]

vim.cmd[[ highlight IlluminatedWordText guibg=#32302f ]]
vim.cmd[[ highlight IlluminatedWordRead guibg=#32302f ]]
vim.cmd[[ highlight IlluminatedWordWrite guibg=#32302f ]]
