#!/bin/bash

# alias
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -hlrt'
alias la='ls $LS_OPTIONS -hlrta'
export CLICOLOR=1

echo "-----Finish!!------"
