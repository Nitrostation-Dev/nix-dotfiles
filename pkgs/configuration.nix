{ pkgs, ... }:
{
    imports = [
        ./apps/flatpak.nix
        ./apps/fonts.nix

        ./apps/syncthing.nix
    ];

    environment.systemPackages = with pkgs;
        [
            firefox

            gnome-tweaks

            wget
            git
            curl
            nixfmt-rfc-style
            htop
            grc
            fzf
            fd
            bat

            warpinator
        ];

    networking.firewall = {
        allowedTCPPorts = [
            42000
            42001
        ];
        allowedUDPPorts = [
            5353
        ];
    };

    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
    };
}
