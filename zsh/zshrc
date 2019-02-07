### Global config

# Enable nvim true color
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Set default shell editor
export EDITOR="vim"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Disable oh-my-zsh auto-update
export DISABLE_AUTO_UPDATE="true"

### zgen config
# mkdir ~/.zsh && curl -o ~/.zsh/zgen.zsh https://raw.githubusercontent.com/tarjoilija/zgen/master/zgen.zsh
source "$HOME/.zsh/zgen.zsh"

if ! zgen saved; then
  # Use omz
  zgen oh-my-zsh

  # Load plugins
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-autosuggestions

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

# Disable no match glob error
unsetopt nomatch 

# Zsh-autosuggest color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

source "$HOME/.zsh-aliases"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
