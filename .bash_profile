# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ssh-agent using tmux
# http://d.hatena.ne.jp/xabre/20130407/1365327582
SOCK="/tmp/ssh-agent-$USER"
if test $SSH_AUTH_SOCK && [ $SSH_AUTH_SOCK != $SOCK ]
then
    rm -f $SOCK
    ln -sf $SSH_AUTH_SOCK $SOCK
    export SSH_AUTH_SOCK=$SOCK
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
