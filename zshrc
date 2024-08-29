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
export EDITOR='nvim'
export BROWSER='google-chrome'

source ~/.zsh/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme jonathan

antigen apply


#bindkey -v

# doom() {
#     emacs $@ &
#     disown
#     exit
# }

# ufetch

customFind () {
    if [[ $# -eq 1 ]]; then
        rg --files | rg -e $1
    elif [[ $# -eq 2 ]]; then
        rg --files $2 | rg -e $1
    else
        echo "usage: fd PATTERN [PATH]"
    fi
}

alias fd=customFind

# alias r=ranger
alias ls='ls --color'

alias gpush='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

alias xcb=~/.postools/xcb

alias nvim='~/neovim/bin/nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

alias cdmamba='cd ~/Stone/repos/pos-mamba'

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/wseabra/.sdkman"
[[ -s "/home/wseabra/.sdkman/bin/sdkman-init.sh" ]] && source "/home/wseabra/.sdkman/bin/sdkman-init.sh"
export PATH=$PATH:/home/wseabra/.postools:/home/wseabra/Android/Sdk/platform-tools:/home/wseabra/Android/Sdk/emulator:/home/wseabra/.local/bin:$HOME/.emacs.d/bin/:$HOME/neovim/bin
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.cache/*,output/*,.ccls/*}"'
alias possh="ssh -oStrictHostKeyChecking=no MAINAPP@127.0.0.1 -p 51000"
export CLANGD_FLAGS="-j 1"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
