Plug 'machakann/vim-sandwich'

let g:sandwich#recipes += [
      \   {
      \     'external': ['it', 'at'],
      \     'noremap' : 1,
      \     'filetype': ['html', 'jsx', 'tsx', 'javascriptreact', 'typescriptreact'],
      \     'input'   : ['t'],
      \   },
      \ ]