{ pkgs, ... }:

let
  nixosMaintainerSkill =
    ../../hermes/skills/nixos-maintainer;
in
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
      gh
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

      model = {
        provider = "openai-codex";
        default = "gpt-6.1-sol";
      };

      skills = {
        external_dirs = [
          "/etc/hermes/skills"
        ];
      };
    };

    restart = "always";
    restartSec = 5;
  };

  # Skills declarativas gestionadas por NixOS
  environment.etc."hermes/skills/nixos-maintainer".source =
    ../../hermes/skills/nixos-maintainer;
}
