{ ... }:

{
  services.plex = {
    enable = true;
    openFirewall = false;

    accelerationDevices = [
      "/dev/dri/renderD128"
    ];
  };

  users.users.plex.extraGroups = [
    "render"
  ];

  networking.firewall.allowedTCPPorts = [ 32400 ];

  systemd.services.plex = {
    unitConfig.RequiresMountsFor = [ "/mnt/media" ];
  };
}
