#!/bin/bash
#Vim
if [[ ! -d "$HOME/.vim" ]]; then
    mkdir $HOME/.vim
fi

ln -s $HOME/dotfiles/vimrc $HOME/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Neovim
if [[ ! -d "$HOME/.config/nvim" ]]; then
    mkdir $HOME/.config/nvim
fi

ln -s $HOME/dotfiles/vimrc $HOME/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#zsh
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
