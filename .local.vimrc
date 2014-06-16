" Syntasticとquickrunをcartonに対応させる

" thinca/vim-localrcのインストールが必要
" Cartonで管理しているAmon2プロジェクトなどのトップ.local.vimrcとして置く
let carton_path = system('carton exec perl -e "print join(q/,/,@INC)"')
let lib_path = fnamemodify(finddir("lib", ";"), ":p")
let g:syntastic_perl_lib_path = join([carton_path, lib_path], ',')

let g:quickrun_config = {
\   'perl' : {
\       'cmdopt': '-Ilib',
\       'exec': 'carton exec perl %o %s',
\    },
\}
