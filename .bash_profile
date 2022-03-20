#swhich PATH for MacPorts or homebrew

if [ "$(uname -m)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -e /usr/local/Homebrew ]; then
    export PATH=/usr/local/bin:$PATH
fi

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
