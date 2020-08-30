#!/bin/bash

echo 'Setup git/contrib/diff-highlight...'

# debian
if [ -e /usr/share/doc/git/contrib/diff-highlight ]; then
    sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
    sudo chmod +x /usr/local/bin/diff-highlight
# Fallback to download old one script diff-hightlight
else
   curl https://raw.githubusercontent.com/git/git/3dbfe2b8ae94cbdae5f3d32581aedaa5510fdc87/contrib/diff-highlight/diff-highlight -o /usr/local/bin/diff-highlight
   chmod +x /usr/local/bin/diff-highlight
fi