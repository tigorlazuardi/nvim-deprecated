
if has('win32') || has('win64')
    set guifont=Hack\ NF,\ Medium:h12
else
    set guifont=DejaVuSansMono\ Nerd\ Font:h12
endif

if exists('g:fvim_loaded')
    if has('win32') || has('win64')
        set guifont=Hack\ NF,\ Medium:h16
    else
        set guifont=FuraCode\ Nerd\ Font\ Mono:h16
    endif

    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
endif
