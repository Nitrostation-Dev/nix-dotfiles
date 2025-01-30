{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        home-manager.url = "github:nix-community/home-manager/master";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

        stylix.url = "github:danth/stylix";
    };

    outputs = inputs@{ self, ... }:
    let 
        systemSettings = {
            system = "x86_64-linux";
            hostname = "nixos";
            timezone = "Asia/Kolkata";
            locale = "en_IN";
            kb_layout = "us";
            kb_variant = "colemak_dh";
        };

        userSettings = {
            username = "pranavanath";
            wm = "gnome";
        };

        pkgs = import inputs.nixpkgs {
            system = systemSettings.system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
        lib = inputs.nixpkgs.lib;

    in {
        nixosConfigurations.${systemSettings.hostname} = lib.nixosSystem {
            system = systemSettings.system;
            modules = [
                inputs.nix-flatpak.nixosModules.nix-flatpak
                inputs.stylix.nixosModules.stylix

                ./config/configuration.nix
                ./hardware-configuration.nix
            ];
            specialArgs = {
                inherit inputs;
                inherit systemSettings;
                inherit userSettings;
            };
        };

        homeConfigurations.${userSettings.username} = inputs.home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [
                # inputs.nix-flatpak.homeManagerModules.nix-flatpak
                inputs.stylix.homeManagerModules.stylix
                
                ./config/home.nix
            ];
            extraSpecialArgs = {
                inherit inputs;
                inherit systemSettings;
                inherit userSettings;
            };
        };
    };
}
