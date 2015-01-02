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

source $HOME/.bashrc_local
