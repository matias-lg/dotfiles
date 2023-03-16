-- credits to https://www.youtube.com/watch?v=HlfjpstqXwE

local attach_to_buffer = function(pattern, command)
local current_win = vim.api.nvim_get_current_win()
vim.cmd('vsplit')
local win = vim.api.nvim_get_current_win()
local newbuf = vim.api.nvim_create_buf(true, true)
vim.api.nvim_win_set_buf(win, newbuf)
vim.api.nvim_set_current_win(current_win)

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("automagic", { clear = true }),
    pattern = pattern,
    callback = function()
      local append_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(newbuf, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(newbuf, 0, -1, false, { "output" })
      vim.api.nvim_buf_set_lines(newbuf, 1, -1, false, { "-------------------------" })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end,
  })
end

vim.api.nvim_create_user_command("CppRun", function()
  -- we need to get the absolute path to the current file
  local filename = vim.fn.expand("%:p")
  -- just filename without extension and no path 
    local shortname = vim.fn.expand("%:t:r")
    local inputFile = vim.fn.input "Input file?: "
    local command = [[ g++ -Wall -Wextra -Wshadow -fsanitize=undefined -DLOCAL -O -std=c++17 ]] .. filename .. [[ -o ]] .. shortname .. [[.out && ./]] .. shortname .. [[.out]]
    -- if passed input file pipe it to the program
    if inputFile ~= "" then
        command = command .. [[ < ]] .. inputFile
    end
  attach_to_buffer("*.cpp", command)
end, {})

vim.api.nvim_create_user_command("AutoStop", function()
  vim.api.nvim_create_augroup("automagic", { clear = true })
end, {})
