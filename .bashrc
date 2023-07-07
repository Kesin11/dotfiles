PS1="\u@\h:\W$ "
export PS1

# tmuxで各シェルの.bash_historyを同期
export HISTFILE=~/.bash_history
export HISTFILESIZE=50000
export HISTSIZE=50000
# コマンドの重複は認めない
export HISTCONTROL=ignoredups:erasedups
# shopt -u histappend # .bash_history追記モードは不要なのでOFF
unset PROMPT_COMMAND
# .bash_historyに前回コマンドを1行追加、端末ローカル履歴の削除、.bash_historyから履歴の再読込
# export PROMPT_COMMAND="history -a;history -c; history -r;$PROMPT_COMMAND"
# screenでは色々必要だったが、screenを使わないなら-aの即時書き込みだけで別ウィンドウ間で履歴共有可能
export PROMPT_COMMAND="history -a"

if [ -e $HOME/enhancd ]; then
    ENHANCD_DISABLE_DOT=1;
    source ~/enhancd/init.sh
fi

if [ -e $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi
