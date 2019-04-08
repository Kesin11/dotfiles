# make synbolic link .vim first, because neobundle will install to .vim
cd ~/
ln -is ~/dotfiles/.vim .

# NeoBundle
cd ~/dotfiles
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

cd ~/
ln -is ~/dotfiles/.bash_profile .
ln -is ~/dotfiles/.bashrc .
ln -is ~/dotfiles/.vimrc .
# ln -is ~/dotfiles/.screenrc .
ln -is ~/dotfiles/.tmux.conf .
ln -is ~/dotfiles/.inputrc .
ln -is ~/dotfiles/.gitconfig .

# atom
sh ~/dotfiles/.atom/setup.sh

# vscode
sh ~/dotfiles/vscode/setup.sh

# tool
mkdir ~/dotfiles/tool
sh ~/dotfiles/tool/setup.sh

echo "Replace .gitconfig to local one if you need use another one"
