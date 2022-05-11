alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export LS_OPTIONS='--color=auto'
if command -v dircolors >/dev/null 2>&1
then
  test -r ~/.dircolors && eval `dircolors -b ~/.dircolors`
fi
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -hlrt'
alias la='ls $LS_OPTIONS -hlrta'