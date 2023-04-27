local cmd = vim.cmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Motion for goto word under cursor
map("n", "gw", "*N")
map("x", "gw", "*N")

-- buffers
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- highlights under cursor
-- if vim.fn.has("nvim-0.9.0") == 1 then
--   map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- end

map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
--> nvim tree mappings <--
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>gt", ":NvimTreeFocus<CR>", opts)


--> telescope mappings <--
map("n", "<leader>rg", ":Telescope live_grep<cr>", opts)
map("n", "<leader><leader>", ":Telescope buffers initial_mode=normal<cr>", opts)

--> buffer mappings <--
map("n", "<A-c>", ":Bdelete!<CR>", opts)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)

for i = 1, 9 do
    -- map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
    map("n", "<leader>" .. i, ":lua require(\"bufferline\").go_to_buffer(" .. i .. ", true)<CR>", opts)
end

--> Search and replace word under cursor <--
map("n", "<leader>sr", ":s/<C-r><C-w>/", {desc = "Search and replace word under cursor (Current line)"})
map("n", "<leader>sg", ":%s/<C-r><C-w>/", {desc = "Search and replace word under cursor (Current buffer)"})

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
