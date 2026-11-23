{ ... }:

{
  # Identificación y red
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "rleblic@172.26.0.0/24" ];
    };
  };

  # Allow SSH only from the LAN, not globally or over IPv6.
  networking.firewall.extraCommands = ''
    iptables -A nixos-fw -s 172.26.0.0/24 -p tcp --dport 22 -j nixos-fw-accept
  '';
  networking.firewall.extraStopCommands = ''
    iptables -D nixos-fw -s 172.26.0.0/24 -p tcp --dport 22 -j nixos-fw-accept 2>/dev/null || true
  '';
}
