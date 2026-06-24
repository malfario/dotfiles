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
    devenv
    p7zip-rar
    ghostty-bin
    profanity
    doggo
    pi-coding-agent
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
    ./programs/zellij.nix
    ./programs/kitty.nix
  ];

  programs = {
    fish = {
      enable = true;
      plugins = [
        { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
        { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
        { name = "grc"; src = pkgs.fishPlugins.grc.src; }
      ];
      interactiveShellInit = ''
        devenv hook fish | source
      '';
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
