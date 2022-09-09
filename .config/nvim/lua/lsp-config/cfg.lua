require("lsp-config.language-servers")
require("lsp-config.completion")
require("lsp-config.null-ls")


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
  { text = '', texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'LspDiagnosticsDefaultHint' }
)
