{ config, inputs, pkgs, ... }:
{
  programs.home-manager.enable = true;

  home.username = "rleblic";
  home.homeDirectory = "/Users/rleblic";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    grc
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    GIT_EDITOR = "hx";
  };

  imports = [
    ./programs/lsd.nix
    ./programs/carapace.nix
    ./programs/zoxide.nix
    ./programs/atuin.nix
    ./programs/aerospace.nix
  ];

  programs = {
    kitty = {
      enable = true;
      shellIntegration.enableFishIntegration = true;
      themeFile = "OneDark";
      font = {
        name = "JetBrains Mono";
        size = 14.0;
      };
      settings = {
        macos_option_as_alt = "left";
        macos_show_window_title_in = "none";
        window_margin_width = 8.0;
        window_padding_width = 0.0;
        hide_window_decorations = "titlebar-and-corners";
        macos_quit_when_last_window_closed = true;
        adjust_column_width = -1;
        cursor_trail = 100;
        # text_composition_strategy = "legacy";
      };
    };

    fish = {
      enable = true;
      plugins = [
        { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
        { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ];
    };

    alacritty = {
      enable = true;
      theme = "one_dark";
      settings = {
        env = {
          TERM = "xterm-color";
        };
        window = {
          decorations = "none";
          option_as_alt = "OnlyLeft";
          padding = {
            x = 8;
            y = 8;
          };
        };
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          size = 14.0;
        };
      };
    };
  };
}
