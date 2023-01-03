local map = vim.keymap.set
local cmd = vim.cmd
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

--> switch between tabs/splits <--
cmd 'map <C-Down> <C-W>j'
cmd 'map <C-Up> <C-W>k'
cmd 'map <C-Left> <C-W>h'
cmd 'map <C-Right> <C-W>l'

cmd 'map <C-j> <C-W>j'
cmd 'map <C-k> <C-W>k'
cmd 'map <C-h> <C-W>h'
cmd 'map <C-l> <C-W>l'

cmd 'tnoremap <C-Down> <C-\\><C-n><C-W>j'
cmd 'tnoremap <C-Up> <C-\\><C-n><C-W>k'
cmd 'tnoremap <C-Left> <C-\\><C-n><C-W>h'
cmd 'tnoremap <C-Right> <C-\\><C-n><C-W>l'

cmd 'tnoremap <C-j> <C-\\><C-n><C-W>j'
cmd 'tnoremap <C-k> <C-\\><C-n><C-W>k'
cmd 'tnoremap <C-h> <C-\\><C-n><C-W>h'
cmd 'tnoremap <C-l> <C-\\><C-n><C-W>l'

-- --> jkl; as hjkl <--
-- cmd 'map <C-l> <C-W>j'
-- cmd 'map <C-k> <C-W>k'
-- cmd 'map <C-j> <C-W>h'
-- cmd 'map <C-;> <C-W>l'
--
-- cmd 'noremap j h'
-- cmd 'noremap l j'
-- cmd 'noremap ; l'
-- cmd 'noremap <S-;> ;'

--> nvim tree mappings <--
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)


--> telescope mappings <--
-- map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>rg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
--> buffer mappings <--
map("n", "<A-c>", ":Bdelete!<CR>", opts)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)

for i = 1, 9 do
  -- map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
  map("n", "<leader>" .. i, ":lua require(\"bufferline\").go_to_buffer(" .. i .. ", true)<CR>", opts)
end

--> Open LSP diagnostic <--
map("n", "<leader>sd", ":lua vim.diagnostic.open_float()<CR>", opts)
--> Regular Lsp bindings <--
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("v", "<leader>ca", ":lua vim.lsp.buf.range_code_action()<CR>", opts)
map("n", "<leader>gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) --> jumps to the definition of the symbol under the cursor
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts) --> information about the symbol under the cursos in a floating window
map("n", "gi", ":Telescope lsp_implementations<CR>", opts) --> lists all the implementations for the symbol under the cursor in the quickfix window
-- map("n", "gr", ":Telescope lsp_references<CR>", opts) --> lists all the references to the symbl under the cursor in the quickfix window
map("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
map("n", "<leader>ft", ":lua vim.lsp.buf.format {async = true}<CR>", opts) --> formats the current buffer
map("n", "<leader>dj", ":lua vim.diagnostic.goto_next()<CR>", opts)
map("n", "<leader>dk", ":lua vim.diagnostic.goto_prev()<CR>", opts)
map("n", "<leader>dl", ":Telescope diagnostics<CR>", opts)

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
