set -x EDITOR vim

# added by pipx (https://github.com/pipxproject/pipx)
set -x PATH /Users/rleblic/.local/bin $PATH

set -x PATH /Users/rleblic/.poetry/bin $PATH

set -x PATH /Users/rleblic/bin $PATH
set -x PATH /Users/rleblic/.nimble/bin $PATH

set -x PATH /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin $PATH

set -x TERM xterm-color

status --is-interactive; and source (pyenv init -|psub)
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

alias ls=lsd

eval (starship init fish)

# Load private config
if [ -f $HOME/.config/fish/private.fish ]
  source $HOME/.config/fish/private.fish
end
