#swhich PATH for MacPorts or homebrew
if [ -e /opt/local ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
elif [ -e /usr/local/Library/Homebrew ]; then
    export PATH=/usr/local/bin:$PATH
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
