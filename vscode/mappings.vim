xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" Easy go to end of line or start of line
nnoremap gh ^
nnoremap gl $
vnoremap gh ^
vnoremap gl $

" Better indenting
vnoremap < <gv
vnoremap > >gv

" Alt+J and Alt+K to swap lines
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-k> :m .-2<CR>==gi
" inoremap <A-j> :m .+1<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap xx dd
nnoremap X D

nnoremap <silent> gD :<C-u>call VSCodeNotify('editor.action.peekDefinition')<CR>
nnoremap <silent> ? :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> <F4> :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> gn :<C-u>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap <silent> gN :<C-u>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
nnoremap <silent> gp :<C-u>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap <silent> gP :<C-u>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
nnoremap <silent> gr :<C-u>call VSCodeNotify('editor.action.goToReferences')<CR>
nnoremap <silent> gs :<C-u>call VSCodeNotify('workbench.action.gotoSymbol')<CR>
nnoremap <silent> gR :<C-u>call VSCodeNotify('goToPreviousReference')<CR>
nnoremap <silent> K :<C-u>call VSCodeNotify('editor.action.showHover')<CR>
nnoremap <silent> gi :<C-u>call VSCodeNotify('editor.action.goToImplementation')<CR>

function! s:switchEditorCustom(...) abort
  let count = a:1
  let direction = a:2
  for i in range(1, count ? count : 1)
    call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
  endfor
endfunction

nnoremap <silent> <tab> <Cmd>call <SID>switchEditorCustom(v:count, 'next')<CR>
nnoremap <silent> <s-tab> <Cmd>call <SID>switchEditorCustom(v:count, 'prev')<CR>


function! s:openVSCodeCommandsInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
  else
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

xnoremap <silent> <F1> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

function! s:movesLineDownEnMasse()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("editor.action.moveLinesDownAction", startLine, endLine, 1)
    call VSCodeCall('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })
  else
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("editor.action.moveLinesDownAction", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
  " normal! gv=gv
endfunction

nnoremap <silent> <a-j> :<C-u>call <SID>movesLineDownEnMasse()<CR>
xnoremap <silent> <a-j> :<C-u>call <SID>movesLineDownEnMasse()<CR>

function! s:movesLineUpEnMasse()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("editor.action.moveLinesUpAction", startLine, endLine, 1)
  else
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("editor.action.moveLinesUpAction", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
  " normal! gv=gv
endfunction

nnoremap <silent> <a-k> :<C-u>call <SID>movesLineUpEnMasse()<CR>
xnoremap <silent> <a-k> :<C-u>call <SID>movesLineUpEnMasse()<CR>
