"----vundle conf
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" プラグインを記述する
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neosnippet'
Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'thinca/vim-quickrun'

" Vundleの処理後、ftpluginとindentを読み込む
filetype plugin indent on

"----global conf
set number
set showmode
syntax enable
"colorscheme solarized
"colorscheme desert
"colorscheme wombat256mod
colorscheme mycolor
set smartindent
set smarttab
set ignorecase
set smartcase
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hlsearch
set laststatus=2
set statusline=%f\ %{&fileencoding}
" 対応括弧に<>を追加
set matchpairs& matchpairs+=<:>
" ctagsの読み込み
set tags+=~/.tags
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" 新しいタブを一番右に作る
nmap <silent> tc :tablast <bar> tabnew<CR>
" タブを閉じる
nmap <silent> tx :tabclose<CR>

" 括弧を自動補完
" http://mba-hack.blogspot.jp/2013/02/vim.html#page12
" インサートモード時の自動補完
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
" ビジュアルモード時に入力するとwordを囲む
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を削除。カーソルが移動しないように記憶しておく
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
    " %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

"----global conf

"----neocomplecache default conf
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"----end neocomplcache default conf----

"----neosnippet conf
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
"----end neosnippet conf

"----Syntastic conf
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes' : [],
	\ 'passive_filetypes' : ['html'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pyflakes']
"----end Syntastic conf

"----unite conf
"バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
"ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
"最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
"タブ一覧
noremap <C-U><C-T> :Unite tab<CR>

"----Python conf"
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"----.vim/syntax/python.vim options
let python_version_2 = 1
let python_highlight_builtin_objs = 1
let python_highlight_builtin_funcs = 1
let python_highlight_indent_errors = 1

"----quickrun conf
" 横分割時は下へ新しいウィンドウを開く
set splitbelow
" 縦分割時は右へ新しいウィンドウを開く
set splitright

" Execute python script C-P
function! s:ExecPy()
    exe "!" . &ft . " %"
    :endfunction
    command! Exec call <SID>ExecPy()
    autocmd FileType python map <silent> <C-P> :call <SID>ExecPy()<CR>
