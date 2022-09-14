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
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme bira

antigen apply


#bindkey -v

# doom() {
#     emacs $@ &
#     disown
#     exit
# }

# ufetch

# alias r=ranger
alias ls='ls --color'

alias gpush='git push -u origin $(git rev-parse --abbrev-ref HEAD)'

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/wseabra/.sdkman"
[[ -s "/home/wseabra/.sdkman/bin/sdkman-init.sh" ]] && source "/home/wseabra/.sdkman/bin/sdkman-init.sh"
export PATH=$PATH:/home/wseabra/.postools:/home/wseabra/Android/Sdk/platform-tools:/home/wseabra/Android/Sdk/emulator:/home/wseabra/.local/bin
alias possh="ssh -oStrictHostKeyChecking=no MAINAPP@127.0.0.1 -p 51000"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
