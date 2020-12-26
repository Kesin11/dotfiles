"—-neobundle conf start
if has('vim_starting')
   set nocompatible               " Be iMproved

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" プラグインを記述する
" neocompleteはVim 8.2+に非対応
NeoBundle has('lua') && v:version < 802 ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/open-browser-github.vim', {'depends': 'tyru/open-browser.vim'}
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'haya14busa/incsearch.vim'

NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'elzr/vim-json'

NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-perl/vim-perl'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()

" Required:
filetype off
filetype plugin indent off

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
set backspace=indent,eol,start
set noswapfile
set incsearch " インクリメントサーチ
set wildmenu
set wildmode=longest:full "コマンドモードの補完タイプ
set noequalalways " 分割時に必ず2分割される
set virtualedit=block " ビジュアルモードで文字が存在しないところまでカーソル移動か可能になる

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
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>
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

" C-p, C-nによる履歴呼び出しにフィルタリングを適用
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


" ファイルタイプ判別追加
" Perl
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
autocmd BufNewFile,BufRead cpanfile set filetype=perl
" HTML
autocmd BufNewFile,BufRead *.tx     set filetype=html
" Coffee script
autocmd BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" Ruby
autocmd BufRead,BufNewFile,BufReadPre Fastfile   set filetype=ruby

" ファイルタイプ毎の設定
autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 短縮入力
cnoreabbrev vdiff vertical diffsplit

"----global conf

"----neocomplete or neocomplcache conf
if neobundle#is_installed('neocomplete')
    source ~/dotfiles/.vimrc.neocomplete
elseif neobundle#is_installed('neocomplcache')
    source ~/dotfiles/.vimrc.neocomplcache
endif

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

"----Syntastic conf
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes' : [],
	\ 'passive_filetypes' : ['html'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_python_exec = system('which python3')
let g:syntastic_python_checkers = ['pyflakes', 'mypy']
let g:syntastic_perl_checkers=['perl']
let g:syntastic_coffee_checkers=['coffeelint']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_aggregate_errors = 1

"----unite conf
nnoremap [unite]    <Nop>
nmap     <Space> [unite]
"ファイル一覧
nnoremap <silent>[unite]f :UniteWithBufferDir -buffer-name=files file<CR>
"ファイル一覧 再帰
nnoremap <silent>[unite]F :Unite file_rec<CR>
"最近使ったファイルの一覧, バッファ一覧
nnoremap <silent>[unite]r :Unite file_mru buffer<CR>
"タブ一覧
nnoremap <silent>[unite]t :Unite tab<CR>
"include一覧
nnoremap <silent>[unite]i :Unite file_include<CR>
" unite-outline
nnoremap <silent>[unite]o :Unite -no-quit -winheight=10 outline<CR>
" unite grep
nnoremap <silent>[unite]g :Unite grep -buffer-name=grep-buffer<CR>
" unite grep with <C-R><C-W>
nnoremap <silent>[unite]grw :Unite grep:. -buffer-name=grep-buffer<CR><C-R><C-W>
" UniteResume
nnoremap <silent>[unite]u :UniteResume<CR>
nnoremap <silent>[unite]ug :UniteResume grep-buffer<CR>
" Unite quickfix location_list
nnoremap <silent>[unite]l :Unite -no-quit -winheight=10 location_list<CR>

" Start insert mode when open unite buffer
call unite#custom#profile('default', 'context', {
\ 'start_insert': 1
\ })

"----VimFirer conf
let g:vimfiler_as_default_explorer = 1
nnoremap <silent><C-e> :VimFiler -split -simple -winwidth=45 -no-quit<CR>

"----yankround conf
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_use_region_hl = 1

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

"----perl tidy conf
nnoremap ,pt <Esc>:%! perltidy -se<CR>
vnoremap ,pt <Esc>:'<,'>! perltidy -se<CR>

"----lightline conf
let g:lightline = {
    \ 'colorscheme': 'wombat' }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste', 'modified' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.inactive = {
    \ 'left': [ ['modified'], [ 'relativepath' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }
let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }

"----incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)u

"----coffee-script
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et

" QuickRunのcoffee
let g:quickrun_config = {}
let g:quickrun_config['coffee'] = {
\'command' : 'coffee',
\'exec' : ['%c -cbp %s']
\}

"----javascript
"JSONを開いた時にダブルクォーテーションが隠されるVim標準機能をvim-jsonで無効化
let g:vim_json_syntax_conceal = 0

filetype plugin indent on
