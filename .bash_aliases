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

# WSLでmacのpbcopy,pbpasteの代わり
# https://qiita.com/yugo-yamamoto/items/693725fff9bcb0ded6b5
if [ `uname` = "Linux" ]; then
    alias pbcopy='clip.exe'
    alias pbpaste="powershell.exe -command \"[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding('utf-8');Get-Clipboard\""
fi
