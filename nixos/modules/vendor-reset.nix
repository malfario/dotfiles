{ config, ... }:

{
  boot.initrd.kernelModules = [
    "vendor-reset"
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.vendor-reset
  ];
}

