fish_add_path -U ~/go/bin ~/.local/bin ~/.poetry/bin ~/bin ~/.nimble/bin /usr/local/sbin

if status is-interactive
  set -x TERM xterm-color
  set -x EDITOR vim

  # Setup LSD
  alias ls=lsd

  # Set color theme
  set -U fish_color_normal normal
  set -U fish_color_command normal
  set -U fish_color_quote 657b83
  set -U fish_color_redirection 6c71c4
  set -U fish_color_end 268bd2
  set -U fish_color_error dc322f
  set -U fish_color_param 839496
  set -U fish_color_comment 586e75
  set -U fish_color_match --background=brblue
  set -U fish_color_selection white --bold --background=brblack
  set -U fish_color_search_match bryellow --background=black
  set -U fish_color_history_current --bold
  set -U fish_color_operator 00a6b2
  set -U fish_color_escape 00a6b2
  set -U fish_color_cwd green
  set -U fish_color_cwd_root red
  set -U fish_color_valid_path --underline
  set -U fish_color_autosuggestion 586e75
  set -U fish_color_user brgreen
  set -U fish_color_host normal
  set -U fish_color_cancel -r
  set -U fish_pager_color_completion B3A06D
  set -U fish_pager_color_description B3A06D
  set -U fish_pager_color_prefix cyan --underline
  set -U fish_pager_color_progress brwhite --background=cyan

  # Setup pyenv
  pyenv init --path | source
  pyenv init - | source

  # Setup starship
  eval (starship init fish)

  # Load private config
  if [ -f $HOME/.config/fish/private.fish ]
    source $HOME/.config/fish/private.fish
  end
end
