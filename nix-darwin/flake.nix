{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, ... }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        vim
        profanity
        scooter
        nh
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      nix.settings.extra-nix-path = "nixpkgs=flake:nixpkgs";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      system.primaryUser = "rleblic";

      services.spacebar ={
        enable = true;
        package = pkgs.spacebar;
        config = {
          text_font =         ''"Helvetica Neue:Bold:10.0"'';
          icon_font =         ''"FontAwesome:Regular:10.0"'';
          background_color =  "0xff262626";
          foreground_color =  "0xffa8a8a8";
          space_icon_strip =  "1 2 3 4 5 6 7 8 9 10";
          power_icon_strip =  " ";
          space_icon =        "";
          clock_icon =        "";
          clock_format =      ''"%a %b %e %k:%M"'';
        };
      };

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.rleblic = {
        home = "/Users/rleblic";
        description = "Rafa";
        shell = pkgs.fish;
        #extraGroups = [ "networkmanager" "wheel" "docker" ];
        packages = with pkgs; [
          vscode-langservers-extracted
          lima
        ];
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Mac-Mini-de-Rafa
    darwinConfigurations."Mac-Mini-de-Rafa" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.rleblic = import ./home.nix;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            system = "aarch64-darwin";
          };
        }
      ];
    };
  };
}
