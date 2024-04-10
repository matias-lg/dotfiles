local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

local exist, user_config = pcall(require, "user.user_config")
local group = exist and type(user_config) == "table" and user_config.autocommands or {}
local enabled = require("core.utils.utils").enabled

-- Fixes issues that arise when using the autosave plugin and autoformatting at the same time
if enabled(group, "format_on_autosave") then
  cmd("User", {
    desc = "stops format->write loop and joins format change with last user change when undoing",
    pattern = "AutoSaveWritePre",
    group = augroup("auto save", { clear = true }),
    callback = function()
      if require("core.utils.utils").supports_formatting then
        vim.api.nvim_buf_create_user_command(0, "Format", function()
          vim.lsp.buf.format()
        end, {})
        vim.cmd("silent! undojoin")
        vim.cmd("Format")
      end
    end,
  })
end

-- enables coloring hexcodes and color names in css, jsx, etc.
if enabled(group, "css_colorizer") then
  cmd({ "Filetype" }, {
    desc = "activate colorizer",
    pattern = "css,scss,html,xml,svg,js,jsx,ts,tsx,php,vue",
    group = augroup("colorizer", { clear = true }),
    callback = function()
      require("colorizer").attach_to_buffer(0, {
        mode = "background",
        css = true,
      })
    end,
  })
end

-- disables autocomplete in some filetypes
if enabled(group, "cmp") then
  cmd({ "FileType" }, {
    desc = "disable cmp in certain filetypes",
    pattern = "gitcommit,gitrebase,text,markdown",
    group = augroup("cmp_disable", { clear = true }),
    command = "lua require('cmp').setup.buffer { enabled = false}",
  })
end

-- fixes Trouble not closing when last window in tab
cmd("BufEnter", {
  group = vim.api.nvim_create_augroup("TroubleClose", { clear = true }),
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if
        layout[1] == "leaf"
        and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "Trouble"
        and layout[3] == nil
    then
      vim.cmd("confirm quit")
    end
  end,
})
