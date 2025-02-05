{ pkgs, ... }:
{
    imports = [
        ./flatpak/configuration.nix

        ./fonts/fonts.nix
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

    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
    };
}
