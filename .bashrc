#git-completion
if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then #macports
    source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
    PS1="\u@\h:\W\$(__git_ps1)\$ "
elif [ -f $(brew --prefix)/etc/bash_completion ]; then #homebrew
    source $(brew --prefix)/etc/bash_completion
    PS1="\u@\h:\W\$(__git_ps1)\$ "
elif [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then #homebrew another
    source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
    PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '
elif [ -f /etc/bash_completion.d/git ]; then #linux
    source /etc/bash_completion.d/git
    PS1="\u@\h:\W\$(__git_ps1)\$ "
else PS1="\u@\h:\W " #not installed
fi

export PS1
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -hlrt'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

source $HOME/.bashrc_local
