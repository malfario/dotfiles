{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  llm-agents = inputs.llm-agents.packages.${system};
  zen-browser = inputs.zen-browser.packages.${system};
in
{
  imports = [
    inputs.umbriel.nixosModules.default
    inputs.noctalia.nixosModules.default
    ./media.nix
    ./plex.nix
  ];

  # Graphics & acceleration
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      carapace _carapace fish | source
    '';
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rleblic/dotfiles";
  };

  # Wayland compositor
  programs.umbriel.enable = true;

  # Desktop shell
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = false;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.chromium.enable = true;

  # Desktop services
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  security.rtkit.enable = true;
  services.upower.enable = true;

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "mac";
  };

  environment.systemPackages = with pkgs; [
    kitty
    xwayland
    wl-clipboard
    xdg-utils
    stow
    ripgrep
    firefox
    carapace
    zellij
    fishPlugins.hydro
    fishPlugins.fzf-fish
    fzf
    chromium
    google-chrome
    ghostty
    zen-browser.default
    tuios
    llm-agents.claude-code
    jujutsu
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    subpixel.rgba = "rgb";
  };
}
