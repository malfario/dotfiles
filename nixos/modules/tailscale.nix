{ config, lib, pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;

    # Clave de autenticación (no versionar en git).
    # Generar una reutilizable/efímera en https://login.tailscale.com/admin/settings/keys
    # y copiarla a esta ruta fuera de Nix.
    authKeyFile = "/var/lib/tailscale/authkey";

    # Habilita Tailscale SSH: el propio tailscaled atiende SSH sobre la tailnet,
    # con control de acceso vía las ACLs del admin console.
    extraUpFlags = [ "--ssh" ];
  };

  # Confiar en el tráfico de la tailnet.
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

  # Publica con TLS (vía Tailscale Serve) el servicio HTTP dockerizado
  # que escucha en localhost:5800. Requiere tener habilitado "HTTPS Certificates"
  # en el admin console de Tailscale para que se emitan los certificados.
  systemd.services.tailscale-serve-http = {
    description = "Publica localhost:5800 en la tailnet vía Tailscale Serve (HTTPS)";
    after = [ "tailscaled-autoconnect.service" ];
    requires = [ "tailscaled-autoconnect.service" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      ${lib.getExe config.services.tailscale.package} serve --bg http://127.0.0.1:5800
    '';
  };
}
