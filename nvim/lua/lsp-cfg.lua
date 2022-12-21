vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons
local lsp = require('lsp-zero')

local luasnip = require("luasnip")
local lspkind = require('lspkind')
local cmp = require("cmp")

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.ERROR,
        },
    },
    float = {
        show_header = true,
        source = true,
        focusable = true,
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
