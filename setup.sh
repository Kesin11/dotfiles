cd ~/dotfiles
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

cd ~/
ln -is ~/dotfiles/.bash_profile .
ln -is ~/dotfiles/.bashrc .
ln -is ~/dotfiles/.vim .
ln -is ~/dotfiles/.vimrc .
ln -is ~/dotfiles/.jshintrc .
ln -is ~/dotfiles/.screenrc .
ln -is ~/dotfiles/.tmux.conf .
ln -is ~/dotfiles/.perltidyrc .
ln -is ~/dotfiles/.inputrc .
ln -is ~/dotfiles/.gitconfig .
