if has('win32') || has('win64')
    let g:split_rc = split($MYVIMRC, '\')
    let g:config_folder = g:split_rc[0:-2]
    let g:config = join(g:config_folder, '\')
else
    let g:split_rc = split($MYVIMRC, '/')
    let g:config_folder = g:split_rc[0:-2]
    let g:config = '/'.join(g:config_folder, '/')
endif

let vimplug_exists=expand(g:config.'/autoload/plug.vim')
if has('win32') && !has('win64')
    let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
    let curl_exists=expand('curl')
endif

set nocompatible

if !filereadable(vimplug_exists)
    if !executable(curl_exists)
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

if exists('g:vscode')
    call plug#begin()
    for f in split(glob(g:config.'/vscode/**/*.vim'), '\n')
        exe 'source' f
    endfor
    call plug#end()
    autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

elseif exists('g:started_by_firenvim')
    call plug#begin()
    for f in split(glob(g:config.'/firenvim/*.vim'), '\n')
        exe 'source' f
    endfor
    call plug#end()
    autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif
else
    for f in split(glob(g:config.'/no-gui/*.vim'), '\n')
        exe 'source' f
    endfor
    lua require('plugins')
endif



if has('termguicolors')
    set termguicolors
endif
