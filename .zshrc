### Global config

# Enable nvim true color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Set default shell editor
export EDITOR="vim"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

### zgen config
# mkdir ~/.zsh && curl -o ~/.zsh/zgen.zsh https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh
source "$HOME/.zsh/zgen.zsh"

if ! zgen saved; then
  # Use omz
  zgen oh-my-zsh

  # Load plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions

  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/osx
  zgen oh-my-zsh plugins/brew
  zgen oh-my-zsh plugins/lein
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/docker

  # Default theme
  zgen oh-my-zsh themes/daveverwer

  # Apply config
  zgen save
fi

# Disable oh-my-zsh auto-update
export DISABLE_AUTO_UPDATE="true"

### Vi mode config
bindkey -v 
bindkey -M viins 'jj' vi-cmd-mode # Map jj to esc
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '^R' history-incremental-search-backward

# Disable no match glob error
unsetopt nomatch 

# Vi mode insert/normal mode hints
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
