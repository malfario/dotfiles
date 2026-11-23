{ ... }:

{
  # Identificación y red
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "rleblic@172.26.0.0/24" ];
    };
  };
}
