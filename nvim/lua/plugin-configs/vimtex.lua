local locmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.cmd [[
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]
]]

    vim.cmd [[
    let g:vimtex_compiler_latexmk = {
        \ 'aux_dir' : '',
        \ 'out_dir' : './.out',
        \ 'callback' : 1,
        \ 'continuous' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    ]]


vim.cmd [[
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.

filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
]]


-- vim.cmd[[setlocal tw=79]]
vim.cmd[[setlocal wrap]]
-- vim.cmd[[setlocal colorcolumn=80]]
locmap(0, "n", "<leader>fe", ":VimtexTocToggle<CR>", opts)
locmap(0, "n", "<leader>vc", ":VimtexCompile<CR>", opts)

-- enable spell checking for spanish and english
vim.cmd[[setlocal spell spelllang=en_us,es]]

