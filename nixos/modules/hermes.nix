{ pkgs, ... }:

{
  services.hermes-agent = {
    enable = true;
    addToSystemPackages = true;

    # Hermes se ejecuta nativamente en NixOS.
    container.enable = false;

    # Usuario dedicado y estado persistente.
    user = "hermes";
    group = "hermes";
    createUser = true;

    stateDir = "/var/lib/hermes";
    workingDirectory = "/var/lib/hermes/workspace";

    # Credenciales de Telegram y proveedor LLM.
    environmentFiles = [
      "/var/lib/hermes/env"
    ];

    # Herramientas disponibles para el agente.
    extraPackages = with pkgs; [
      git
      nix
      jq
      ripgrep
      fd
      diffutils
      coreutils
      jj
    ];

    # Gateway y memoria.
    settings = {
      memory = {
        memory_enabled = true;
        user_profile_enabled = true;
      };

      terminal = {
        backend = "local";
        timeout = 300;
      };
    };

    restart = "always";
    restartSec = 5;
  };
}
