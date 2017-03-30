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
shopt -u histappend # .bash_history追記モードは不要なのでOFF
unset PROMPT_COMMAND
# .bash_historyに前回コマンドを1行追加、端末ローカル履歴の削除、.bash_historyから履歴の再読込
export PROMPT_COMMAND="history -a;history -c; history -r;$PROMPT_COMMAND"

if [ -e $HOME/dotfiles/tool/enhancd ]; then
    ENHANCD_DISABLE_DOT=1;
    source ~/dotfiles/tool/enhancd/enhancd.sh
fi

if [ -e $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi

# added by travis gem
[ -f /Users/Kesin/.travis/travis.sh ] && source /Users/Kesin/.travis/travis.sh
