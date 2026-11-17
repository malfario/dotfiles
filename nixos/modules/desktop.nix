{ pkgs, umbriel, noctalia, ... }:

{
  imports = [
    umbriel.nixosModules.default
    noctalia.nixosModules.default
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

  programs.fish.enable = true;


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
    model = "applealu_iso";
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
    ghostty
    zellij
    fishPlugins.hydro
    fishPlugins.fzf-fish
    fzf
    claude-code
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig = {
    subpixel.rgba = "rgb";
  };
}
