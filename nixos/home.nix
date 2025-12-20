{ config, pkgs, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  fonts.fontconfig.enable = true;
  
  home.username = "rleblic";
  home.homeDirectory = "/home/rleblic";
  home.packages = with pkgs; [
    scooter
    grc
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "fish";
  };

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  programs.zen-browser.enable = true;

  programs.lazygit.enable = true;
  programs.yazi.enable = true;

  programs.fd.enable = true;
  programs.fzf.enable = true;
  programs.bat.enable = true;
  programs.ripgrep.enable = true;
  programs.direnv.enable = true;

  programs.lsd = {
    enableFishIntegration = true;
    enable = true;
  };

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    plugins = [
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
      { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.qutebrowser = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    theme = "one_dark";
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
      };
      window = {
        decorations = "none";
        padding = {
          x = 8;
          y = 8;
        };
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "rleblic@gmail.com";
        name = "Rafa Leblic";
      };
      alias = {
        ci = "commit";
        co = "checkout";
        st = "status";
        br = "branch";
      };
    };
  };

  programs.zellij = {
    enable = true;
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
      editor = {
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        indent-guides.render = true;
        soft-wrap.enable = true;
        bufferline = "multiple";
        true-color = true;
      };
      keys.normal = {
        space = {
          b = {
            d = ":buffer-close";
            b = "buffer_picker";
          };
          f = {
            f = "file_picker";
            s = ":write";
            t = ":toggle-option auto-format";
          };
          q = {
            q = ":quit";
          };
          t = {
            w = ":toggle whitespace.render all none";
          };
        };
      };
    };
  };
}
