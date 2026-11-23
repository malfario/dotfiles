{ ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    listenOptions = [ "/run/docker.sock" ];

    # Keep container networks within the reserved range, away from the LAN/VPN.
    daemon.settings = {
      bip = "10.200.0.1/24";
      default-address-pools = [
        {
          base = "10.200.128.0/17";
          size = 24;
        }
      ];
    };
  };
}
