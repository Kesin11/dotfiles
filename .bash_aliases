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

    # WSLでBurnToastを使ってデスクトップに通知を送る
    # https://github.com/microsoft/WSL/issues/2466#issuecomment-370316815
    alias toast='powershell.exe -command New-BurntToastNotification'
fi

# Claude with OpenRouter
claude-openrouter() {
    local MODEL_NAME="${1:?Model name is required}"
    ANTHROPIC_BASE_URL="https://openrouter.ai/api" \
    ANTHROPIC_AUTH_TOKEN="$OPENROUTER_API_KEY" \
    ANTHROPIC_API_KEY="" \
    ANTHROPIC_DEFAULT_SONNET_MODEL="$MODEL_NAME" \
    ANTHROPIC_DEFAULT_OPUS_MODEL="$MODEL_NAME" \
    ANTHROPIC_DEFAULT_HAIKU_MODEL="$MODEL_NAME" \
    claude
}
