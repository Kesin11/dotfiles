cd ~/dotfiles
git submodule init
git submodule update

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
