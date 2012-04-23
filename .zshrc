# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"
export ZSH_THEME="clean"

export EDITOR="vim"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew lein rvm)

source $ZSH/oh-my-zsh.sh

bindkey -v # Use vi-mode
bindkey -M viins 'jj' vi-cmd-mode # Map jj to esc

# Bind C-R to incremental reverse search in vi-mode
# One may still use vi-history-search-backward with <Esc>/<search text><Enter> + [n|N]
bindkey -M vicmd '^R' history-incremental-search-backward

unsetopt nomatch

# Set cursor shape to vertical bar on insert mode
function zle-line-init {
  zle -K viins
}

function zle-line-init zle-keymap-select {
  if [ $KEYMAP = vicmd ]; then
    echo -ne "\033]50;CursorShape=2\a"
  else
    echo -ne "\033]50;CursorShape=0\a"
  fi
}

#zle -N zle-line-init
#zle -N zle-keymap-select

# Load local profile settings and aliases
source ~/.zshrc-local

if [[ -f ~/.zsh-aliases ]]; then
  . ~/.zsh-aliases
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
