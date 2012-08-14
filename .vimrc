"vundle conf"
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" プラグインを記述する
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'

" Vundleの処理後、ftpluginとindentを読み込む
filetype plugin indent on


"global conf"
set number
set showmode
syntax on
set smartindent
set smarttab
set ignorecase
set smartcase
set tabstop=4

"Python conf"
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
" Execute python script C-P 
function! s:ExecPy()
    exe "!" . &ft . " %"
    :endfunction
    command! Exec call <SID>ExecPy()
    autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>
