require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓"
        }
    }
}
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "texlab",
        "tailwindcss",
        "pyright",
        "marksman",
        "bashls",
        "clangd",
    },
}

local function config(_config)
    return vim.tbl_deep_extend("force", {
        default_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

require("lspconfig").tsserver.setup {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
}

require("lspconfig").lua_ls.setup(config({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
        },
    },
}))

local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
 clangd_capabilities.offsetEncoding = 'utf-8'
 require('lspconfig').clangd.setup{
        capabilities = clangd_capabilities
}
require("lspconfig").texlab.setup(config())
require("lspconfig").pyright.setup(config())
require("lspconfig").marksman.setup(config())
require("lspconfig").bashls.setup(config())
require("lspconfig").tailwindcss.setup(config())


require "lsp_signature".setup()
