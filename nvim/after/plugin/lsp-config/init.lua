require("after.plugin.lsp-config.language-servers")
require("after.plugin.lsp-config.completion")
require("after.plugin.lsp-config.null-ls")

vim.diagnostic.config({
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    float = {
        show_header=true,
        source=true,
        focusable=true,
    }
})


vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'VirtualTextError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'VirtualTextWarning' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'VirtualTextInfo' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'VirtualTextHint' }
)
