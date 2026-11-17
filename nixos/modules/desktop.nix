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

  # Wayland compositor
  programs.umbriel.enable = true;

  # Desktop shell
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = false;
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
  ];
}
