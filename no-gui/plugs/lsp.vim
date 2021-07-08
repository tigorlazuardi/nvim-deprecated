Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'steelsojka/completion-buffers'

let g:completion_confirm_key = "\<C-y>"
imap <silent> <c-space> <Plug>(completion_trigger)
