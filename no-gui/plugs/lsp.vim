Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'steelsojka/completion-buffers'

imap <c-y> <Plug>(completion_confirm_completion)
let g:completion_confirm_key = ""
imap <silent> <c-space> <Plug>(completion_trigger)
