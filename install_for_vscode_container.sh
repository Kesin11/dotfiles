cd ~/
ln -fs ~/dotfiles/.bashrc .
ln -fs ~/dotfiles/.inputrc .
ln -fs ~/dotfiles/.gitconfig .

# TODO: ubuntuだったら.bashrc_ubuntuを読み込んで、git diff highlightなどを読み込ませる

echo "-----Finish!!------"
echo "Replace .gitconfig to local one if you need use another one"
