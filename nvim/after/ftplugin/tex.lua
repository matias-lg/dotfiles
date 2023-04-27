local locmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- vim.cmd[[setlocal tw=79]]
vim.cmd[[setlocal wrap]]
-- vim.cmd[[setlocal colorcolumn=80]]
locmap(0, "n", "<leader>fe", ":VimtexTocToggle<CR>", opts)
locmap(0, "n", "<leader>vc", ":VimtexCompile<CR>", opts)
