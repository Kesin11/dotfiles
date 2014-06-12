" Syntasticとquickrunをcartonに対応させる
"
" thinca/vim-localrcのインストールが必要
" Cartonで管理しているAmon2プロジェクトなどのトップ.local.vimrcとして置く
let g:syntastic_perl_lib_path = system('carton exec perl -e "print join(q/,/,@INC)"')
let g:quickrun_config = {
\   'perl' : {
\       'cmdopt': '-Ilib',
\       'exec': 'carton exec perl %o %s',
\    },
\}
