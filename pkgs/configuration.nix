{ pkgs, ... }:
{
    imports = [
        ./apps/nh.nix
        ./apps/flatpak.nix
        ./apps/fonts.nix

        ./apps/syncthing.nix
        ./apps/steam.nix
    ];

    environment.systemPackages = with pkgs;
        [
            firefox

            gnome-tweaks

            wget
            git
            curl

            nixfmt-rfc-style
            
            gcc
            cargo
            htop
            grc
            fzf
            fd
            bat

            wineWowPackages.waylandFull
            winetricks
            bottles
            mangohud
        ];

    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
    };
}
