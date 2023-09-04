local null_ls = require("null-ls")


local formatting = null_ls.builtins.formatting

local sources = {
    --formatting.prettier_standard,
    formatting.prettier,
    formatting.autopep8,
    -- formatting.stylua,
    -- formatting.clang_format.with({
    --     extra_args = {"--style", "{BasedOnStyle: google, IndentWidth: 4}" },
    -- }),
}

null_ls.setup({
    sources = sources,
    debug = true,
    on_attach = function(client)
        -- if client.server_capabilities.documentFormattingProvider then
        --     vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format {async = true}")
        -- end
    end,
})
