{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/boot.nix
    ../../modules/networking.nix
  ];

  # Localización
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";

  console.keyMap = "us";

  # Usuario principal
  users.users.rleblic = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  users.mutableUsers = true;

  # Permitir administración mediante sudo
  security.sudo.wheelNeedsPassword = true;

  # Firmware y gráficos Intel
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  # Herramientas iniciales
  environment.systemPackages = with pkgs; [
    git
    vim
    helix
    wget
    curl
    pciutils
    usbutils
    parted
    qemu
  ];

  # Almacenamiento de máquinas virtuales
  fileSystems."/vm" = {
    device = "/dev/disk/by-uuid/f1bb5252-d269-4e65-8f6c-4c62ed731f8c";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems."/boot".options = lib.mkForce [
    "umask=0077"
  ];

  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  # Versión de compatibilidad del sistema
  system.stateVersion = "26.05";
}

