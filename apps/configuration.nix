{ pkgs, ... }:
{
    imports = [
        ./flatpak/configuration.nix
    ];

    environment.systemPackages = with pkgs;
        [
            firefox

            gnome-tweaks

            wget
            git
            curl
            nixfmt-rfc-style
        ];
}
