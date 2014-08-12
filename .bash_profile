#swhich PATH for MacPorts or homebrew
if [ -e /opt/local ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
elif [ -e /usr/local/Library/Homebrew ]; then
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
