set -x EDITOR vim

# added by pipx (https://github.com/pipxproject/pipx)
set -x PATH /Users/rleblic/.local/bin $PATH

set -x PATH /Users/rleblic/.poetry/bin $PATH

status --is-interactive; and source (pyenv init -|psub)
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

alias ls=lsd
