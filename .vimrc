"—-neobundle conf start
if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインを記述する
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'vim-scripts/taglist.vim'
" perlomniはmakeが必要
NeoBundle 'c9s/perlomni.vim'
execute "NeoBundle 'Shougo/vimproc.vim'," . string({
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ })

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"—-neobundle conf end

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
" 縦分割でタグジャンプ
" 現在はgでのタグ選択に対応できない
map v<C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz

" Ctrl+cをESCに割り当て。Ctrl+cがESCと全く同じ動作になるはず
inoremap <C-c> <ESC>

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
inoremap `` ``<LEFT>
" ビジュアルモード時に入力するとwordを囲む
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap ` "zdi`<C-R>z`<ESC>

" 保存時に行末の空白を削除。カーソルが移動しないように記憶しておく
function! s:remove_dust()
    let cursor = getpos(".")
    %s/\s\+$//ge
    " %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" " j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" ファイルタイプ判別追加
" Perl
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead cpanfile set filetype=perl

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
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"----end neocomplcache default conf----
"
"----neocomplecache conf for Perl----
"::をdelimiterにしない。package名の補完が楽になる
if !exists('g:neocomplcache_delimiter_patterns')
    let g:neocomplcache_delimiter_patterns = {}
endif
let g:neocomplcache_delimiter_patterns['perl'] = []
"----end neocomplecache conf for Perl----

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
let g:syntastic_perl_checkers=['perl']
let g:syntastic_enable_perl_checker = 1
"----end Syntastic conf

"----unite conf
"バッファ一覧
noremap <C-U>b :Unite buffer<CR>
"ファイル一覧
noremap <C-U>f :UniteWithBufferDir -buffer-name=files file<CR>
"最近使ったファイルの一覧
noremap <C-U>r :Unite file_mru<CR>
"タブ一覧
noremap <C-U>t :Unite tab<CR>

"----VimFirer conf
let g:vimfiler_as_default_explorer = 1

"----yankround conf
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"----quickrun conf
" 横分割時は下へ新しいウィンドウを開く
set splitbelow
" 縦分割時は右へ新しいウィンドウを開く
set splitright

"----taglist conf
":Tlistでタグリストオープン

" 現在表示中のファイルのみのタグしか表示しない
let Tlist_Show_One_File = 1
" 右側にtag listのウインドを表示する
let Tlist_Use_Right_Window = 1
" taglistのウインドウだけならVimを閉じる
let Tlist_Exit_OnlyWindow = 1

" ----NeoComplcache Include completion----
"インクルードパスの指定
" let g:neocomplcache_include_paths = {
"   \ 'ruby' : '.,$HOME/.rvm/rubies/**/lib/ruby/1.8/',
"   \ 'perl' : system('perl -e "print join(q/,/,@INC)"'),
"   \ 'python' : '/usr/local/Cellar/python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/',
"   \ }
" "インクルード文のパターンを指定
" let g:neocomplcache_include_patterns = {
"   \ 'ruby' : '^\s*require',
"   \ 'perl' : '\\<\\(use\\\|require\\)\\>',
"   \ 'python' : '\s*\\(from\\\|import\\)',
"   \ }
"   " \ 'perl' : '^\s*use',
" "インクルード先のファイル名の解析パターン
" let g:neocomplcache_include_exprs = {
"   \ 'ruby' : substitute(v:fname,'::','/','g'),
"   \ 'perl' : substitute(substitute(substitute(v:fname,'::','/','g'),'->\*','',''),'$','.pm',''),
"   \ 'python' : substitute(v:fname,'\\.','/','g'),
"   \ }
"   " \ 'perl' : substitute(substitute(substitute(v:fname,'::','/','g'),'->\*','',''),'$','.pm',''),
" let g:neocomplcache_include_suffixes = {
"   \ 'python' : '.py',
"   \ }
"   " \ 'perl' : '.pm',
  "
