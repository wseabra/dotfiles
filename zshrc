# Lines configured by zsh-newuser-install
export TERM=xterm-256color
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/waldomiro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
export EDITOR='vim'

source ~/.zsh/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme kolo

antigen apply


bindkey -v

ufetch
