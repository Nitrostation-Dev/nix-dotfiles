{ pkgs, ... }:
{
    imports = [
        ./flatpak/configuration.nix

        ./fonts/fonts.nix
    ];

    environment.systemPackages = with pkgs;
        [
            gnome-tweaks

            wget
            git
            curl
            nixfmt-rfc-style
        ];
}
