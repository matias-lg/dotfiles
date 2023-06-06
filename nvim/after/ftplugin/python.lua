local locmap = vim.api.nvim_buf_set_keymap
require('swenv').setup({
    venvs_path = vim.fn.expand('.'),
    post_set_venv = function(venv)
        vim.cmd('LspRestart')
    end,
})
locmap(0, "n", "<leader>ve", ":lua require('swenv.api').pick_venv()<cr>",
{ noremap = true, silent = true, desc = "Select virtualenv" })
