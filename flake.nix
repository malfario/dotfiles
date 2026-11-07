{
  description = "NixOS desktop configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    umbriel.url = "github:noctalia-dev/umbriel/cachix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  outputs = { self, nixpkgs, umbriel, noctalia, home-manager, ... } @ inputs:
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit umbriel noctalia;
        };

        modules = [
          ./nixos/hosts/desktop/configuration.nix
        ];
      };
      vmware = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos/hosts/vmware/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.rleblic.imports = [
              ./home.nix
            ];
            home-manager.extraSpecialArgs = {
              inherit inputs;
              system = "x86_64-linux";
            };

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      homeConfigurations."rleblic@desktop" =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          modules = [
            ./home/users/rleblic/home.nix
          ];
        };
    };
  };
}
