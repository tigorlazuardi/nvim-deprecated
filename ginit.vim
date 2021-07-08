set guifont=FuraCode\ Nerd\ Font\ Mono,\ Medium:h16

if exists('g:fvim_loaded')
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
endif
