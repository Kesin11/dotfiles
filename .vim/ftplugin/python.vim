" virtualenv環境でないときは普段使いのPythonのタグを読み込む
if empty($VIRTUAL_ENV)
    " 事前にctagsでtagsファイルを生成する
    " ctags --languages=python -f .python.tags -R \
    " /usr/local/Cellar/Python/2.7.5/Frameworks/Python.framework/Versions/2.7/lib/python2.7/
    setlocal tags+=~/.python.tags
endif

"----Python conf"
setlocal autoindent
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"----.vim/syntax/python.vim options
let python_version_2 = 1
let python_highlight_builtin_objs = 1
let python_highlight_builtin_funcs = 1
let python_highlight_indent_errors = 1

