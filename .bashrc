if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
	   source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi	   

PS1="\u@\h:\W\$(__git_ps1)\$ "
export PS1
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -hlrt'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
