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
NeoBundle 'prabirshrestha/asyncomplete.vim'
NeoBundle 'prabirshrestha/asyncomplete-buffer.vim'
NeoBundle 'prabirshrestha/asyncomplete-neosnippet.vim'
NeoBundle 'prabirshrestha/asyncomplete-file.vim'
NeoBundle 'Shougo/neco-syntax'
NeoBundle 'prabirshrestha/asyncomplete-necosyntax.vim'
NeoBundle 'Shougo/neco-vim'
NeoBundle 'prabirshrestha/asyncomplete-necovim.vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'haya14busa/incsearch.vim'

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

" ----asyncomplete"
let g:asyncomplete_min_chars = 2
let g:asyncomplete_matchfuzzy = 0
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))

call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
    \ 'name': 'necosyntax',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
    \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
    \ 'name': 'necovim',
    \ 'allowlist': ['vim'],
    \ 'completor': function('asyncomplete#sources#necovim#completor'),
    \ }))


"----neosnippet conf
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

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


filetype plugin indent on
