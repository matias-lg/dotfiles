local map = require("core.utils.utils").map

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.enable_plugins or {}
local enabled = require("core.utils.utils").enabled
vim.g.mapleader = " " -- the leader key is the spacebar
local M = {}

-- Image Pasting
map("n", "<leader>p", "<CMD>PasteImage<CR>", { desc = "Paste clipboard image" })


-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- DAP
if enabled(group, "dap") then
  _G.dap = require("dap")
  map("n", "<leader>dc", "<CMD>lua dap.continue()<CR>")
  map("n", "<leader>n", "<CMD>lua dap.step_over()<CR>")
  map("n", "<leader>si", "<CMD>lua dap.step_into()<CR>")
  map("n", "<leader>so", "<CMD>lua dap.step_out()<CR>")
  map("n", "<leader>tb", "<CMD>lua dap.toggle_breakpoint()<CR>")
  map("n", "<leader>dq", "<CMD>lua dap.disconnect({ terminateDebuggee = true })<CR>")
end

-- Bufferline
for i = 1, 9 do
  -- map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", opts)
  map("n", "<leader>" .. i, ":lua require(\"bufferline\").go_to_buffer(" .. i .. ", true)<CR>")
end

-- Trouble
if enabled(group, "trouble") then
  map("n", "<leader>tr", "<CMD>TroubleToggle lsp_references<CR>")
  map("n", "<leader>td", "<CMD>TroubleToggle lsp_definitions<CR>")
  map("n", "<leader>cd", "<CMD>TroubleToggle<CR>")
end

-- ZenMode
if enabled(group, "zen") then
  map("n", "<leader>zm", "<CMD>ZenMode<CR>")
end

-- NeoTree
if enabled(group, "neotree") then
  map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
  map("n", "<leader>nf", "<CMD>Neotree reveal float<CR>")
end

-- Aerial
if enabled(group, "aerial") then
  map("n", "<leader>at", "<CMD>AerialToggle<CR>")
end

-- Searching and Highlighting
map("n", "m", "<CMD>noh<CR>")

-- Movement
-- in insert mode, type <c-d> and your cursor will move past the next separator
-- such as quotes, parens, brackets, etc.
map("i", "<C-d>", "<left><c-o>/[\"';)>}\\]]<cr><c-o><CMD>noh<cr><right>")
map("i", "<C-b>", "<C-o>0")
map("i", "<C-a>", "<C-o>A")

-- Command mode
map("c", "<C-p>", "<Up>")
map("c", "<C-n>", "<Down>")

-- Telescope
if enabled(group, "telescope") then

  map("n", "<leader>ff",
    function()
      local path = vim.loop.cwd() .. "/.git"
      if vim.loop.fs_stat(path) then
        require("telescope.builtin").git_files()
      else
        require("telescope.builtin").find_files()
      end
      end,
    { desc = "Telescope Find Files" })


  map("n", "<leader>rg", "<CMD>Telescope live_grep<CR>")
  map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
  map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
  map("n", "<leader>fa", "<CMD>Telescope aerial<CR>")
  map("n", "<leader>fp", "<CMD>Telescope projects<CR>")
  map("n", "<leader><leader>", "<CMD>Telescope buffers initial_mode=normal<cr>")
end

-- Move lines and blocks
map("x", "<A-j>", ":m '>+1<CR>gv=gv")
map("x", "<A-k>", ":m '<-2<CR>gv=gv")

-- More LSP stuff
if enabled(group, "lsp_zero") then
  _G.buf = vim.lsp.buf
  -- lsp agnostic global rename
  map("n", "rg", ":%s/<C-r><C-w>//g<Left><Left>", { desc = "global substitution" })
  map("n", "gd", "<CMD>lua buf.definition()<CR>")
  map("n", "gD", "<CMD>Telescope lsp_definitions<CR>")
  map("n", "K", "<CMD>lua buf.hover()<CR>")
  map("n", "gi", "<CMD>lua buf.implementation()<CR>")
  map("n", "gr", "<CMD>Telescope lsp_references<CR>")
  map("n", "sh", "<CMD>lua buf.signature_help()<CR>")
  map("n", "<leader>rn", "<CMD>lua buf.rename()<CR>")
  map("n", "<leader>ca", "<CMD>lua buf.code_action()<CR>")
  map("v", "<leader>ca", ":lua vim.lsp.buf.range_code_action()<CR>")
  map("n", "<leader>ft", ":lua vim.lsp.buf.format {async = true}<CR>") --> formats the current buffer
  map("n", "<leader>dd", ":lua vim.diagnostic.open_float()<CR>")
end



-- Session
if enabled(group, "session_manager") then
  map("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>")
  map("n", "<leader>o", "<CMD>SessionManager load_session<CR>")
end

-- ToggleTerm
if enabled(group, "toggleterm") then
  local git_root = "cd $(git rev-parse --show-toplevel 2>/dev/null) && clear"
  -- opens terminal as a new tab at the git root
  map("n", "<C-\\>t", "<CMD>ToggleTerm direction=tab<CR>", { desc = "new tabbed terminal" })
  -- as a regular window
  map("n", "<C-\\>", "<CMD>TermExec go_back=0 cmd='" .. git_root .. "'<CR>", { desc = "new terminal" })
  map(
    "n",
    "<leader>tk",
    "<CMD>TermExec go_back=0 direction=float cmd='" .. git_root .. "&& tokei'<CR>",
    { desc = "tokei" }
  )
  map("n", "<leader>gg", "<CMD>lua term.lazygit_toggle()<CR>", { desc = "open lazygit" })
  map("n", "<leader>gd", "<CMD>lua term.gdu_toggle()<CR>", { desc = "open gdu" })
  map("n", "<leader>bt", "<CMD>lua term.bashtop_toggle()<CR>", { desc = "open bashtop" })
end

-- Hop
if enabled(group, "hop") then
  map("n", "<leader>j", "<CMD>HopWord<CR>")
end

-- Gitsigns

-- making this a function here because all it does is create keybinds for gitsigns but
-- it needs to be attached to an on_attach function.
if enabled(group, "gitsigns") then
  M.gitsigns = function()
    local gs = package.loaded.gitsigns
    -- travel between hunks, backwards and forwards
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "go to previous git hunk" })
    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "go to next git hunk" })

    map("n", "<leader>hs", gs.stage_hunk, { desc = "stage hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "reset hunk" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
    map("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "complete blame line history" })
    map("n", "<leader>lb", gs.toggle_current_line_blame, { desc = "toggle blame line" })
    -- diff at current working directory
    map("n", "<leader>hd", gs.diffthis, { desc = "diff at cwd" })
    -- diff at root of git repository
    map("n", "<leader>hD", function()
      gs.diffthis("~")
    end, { desc = "diff at root of git repo" })
    map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted line" })
  end
end

-- autosave
if enabled(group, "autosave") then
  map("n", "<leader>as", "<CMD>ASToggle<CR>", { desc = "toggle autosave" })
end

-- cmp (these are defined in cmp's configuration file)
-- ["<C-j>"] = cmp.mapping.scroll_docs(-4),
-- ["<C-k"] = cmp.mapping.scroll_docs(4),
-- ["<C-c>"] = cmp.mapping.abort(),
-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
return M
