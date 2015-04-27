PS1="\u@\h:\W "
export PS1
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -hlrt'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# Ctrl+fでパス文字列を/ごとに削除
bind '\C-f:unix-filename-rubout'

# peco
alias phistory='eval $(history | cut -c 8- | uniq | peco)'
alias pcdr='eval $(history | cut -c 8- | grep '^cd' | uniq | peco)'

# tmuxで各シェルの.bash_historyを同期
export HISTFILE=~/.bash_history
export HISTFILESIZE=50000
export HISTSIZE=50000
# コマンドの重複は認めない
export HISTCONTROL=ignoredups:erasedups
shopt -u histappend
unset PROMPT_COMMAND
# 毎回bash_historyに追記、ローカルと入れ替えをすることで各ペインで同期する
export PROMPT_COMMAND="history -n;history -w;history -c;history -r;$PROMPT_COMMAND"

source $HOME/.bashrc_local
