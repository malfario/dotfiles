fish_add_path -U ~/go/bin ~/.local/bin ~/.poetry/bin ~/bin ~/.nimble/bin /usr/local/sbin /usr/local/bin
fish_add_path -U ~/.fish/bin
fish_add_path -U /run/current-system/sw/bin

if status is-interactive
    set -x EDITOR hx
    # set -x TERMINFO /usr/share/terminfo
    # set -x TERM xterm-256color
    # set -x SHELL /usr/local/bin/fish
    set -x ANDROID_HOME ~/Library/Android/sdk

    fish_add_path -U ~/adb-fastboot/platform-tools
    fish_add_path -U ~/dev/flutter-sdk/flutter/bin
    fish_add_path -U $ANDROID_HOME/cmdline-tools/latest/bin
    fish_add_path -U $ANDROID_HOME/cmdline-tools/latest
    fish_add_path -U $ANDROID_HOME/tools/bin
    fish_add_path -U $ANDROID_HOME/platform-tools

    # Always use bat
    alias cat bat

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
    eval "$(pyenv init --path)"
    # pyenv init - | source

    # Setup rbenv
    # source (rbenv init -|psub)

    # Setup starship
    eval (starship init fish)

    # Load private config
    if [ -f $HOME/.config/fish/private.fish ]
        source $HOME/.config/fish/private.fish
    end

    direnv hook fish | source
end
