if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
		source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
		PS1="\u@\h:\W\$(__git_ps1)\$ "
elif [ -f /etc/bash_completion.d/git ]; then
		source /etc/bash_completion.d/git
		PS1="\u@\h:\W\$(__git_ps1)\$ "
else PS1="\u@\h:\W "
fi	   

export PS1
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -hlrt'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
