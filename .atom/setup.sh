# update atom installed package list
# apm list --installed --bare > packages.txt

if [ -e ~/.atom ]; then
    cd ~/.atom
    ln -is ~/dotfiles/.atom/init.coffee
    ln -is ~/dotfiles/.atom/keymap.cson
    ln -is ~/dotfiles/.atom/snippets.cson
    ln -is ~/dotfiles/.atom/styles.less

    apm install --packages-file ~/dotfiles/.atom/packages.txt
fi
