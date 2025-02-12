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
            grc
            fzf
            fd
            bat
        ];

    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
    };
}
