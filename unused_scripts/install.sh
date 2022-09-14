#!/bin/bash

#Tmux
echo "-----Installing tmux configurations-----"
ln -sf $PWD/tmux.conf $HOME/.tmux.conf

ln -sf $PWD/simple.conf $HOME/.simple.conf

echo "-----tmux configurations installed-----"
#Vim
echo "-----Installing vim configurations-----"
mkdir -p $HOME/.vim

ln -sf $PWD/vimrc $HOME/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "-----vim configurations installed-----"
#zsh
echo "-----Installing zsh configurations-----"
sh -c "RUNZSH=no $(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

ln -sf $PWD/zshrc $HOME/.zshrc
echo "-----zsh configurations installed-----"
#sakura term
echo "-----Installing sakura configurations-"
mkdir -p $HOME/.config/sakura
ln -sf $PWD/sakura.conf $HOME/.config/sakura/sakura.conf
