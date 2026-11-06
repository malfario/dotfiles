{ ... }:

{
  # Arranque UEFI
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Virtualización por hardware
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];
}
