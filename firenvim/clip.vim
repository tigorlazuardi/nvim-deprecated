Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'

let g:left_bracket_key_map = get(g:, 'left_bracket_key_map', {})
let g:right_bracket_key_map = get(g:, 'right_bracket_key_map', {})

nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

nnoremap m m

nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

nmap [p <plug>(YoinkPostPasteToggleFormat)
let g:left_bracket_key_map.p = ['<plug>(YoinkPostPasteToggleFormat)', 'Toggle last paste']

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
let g:left_bracket_key_map.y = ['<plug>(YoinkRotateBack)', 'Select previous clip on register']
let g:right_bracket_key_map.y = ['<plug>(YoinkRotateForward)', 'Select next clip on register']

let g:yoinkSavePersistently = 1
let g:yoinkAutoFormatPaste = 0
let g:yoinkIncludeDeleteOperations = 1

set shada=!,'100,<50,s10,h
