{ pkgs, lib, ... }:
{
    stylix = {
        enable = true;
        image = ./wallpaper.png;
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            sansSerif = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            monospace = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
            sizes = {
                applications = 11;
                desktop = 10;
                popups = 10;
                terminal = 10;
            };
        };

        iconTheme = {
            enable = true;
            package = pkgs.gruvbox-plus-icons;
            dark = "Gruvbox-Plus-Dark";
            light = "Gruvbox-Plus-Dark";
        };

        cursor = {
            package = pkgs.phinger-cursors;
            name = "Phinger-cursors-dark";
            size = 28;
        };

        base16Scheme = ./colorScheme.yaml;

        targets.vscode.enable = false;
    };

    home.pointerCursor = lib.mkForce {
        gtk.enable = true;
        x11.enable = true;
        name = "Phinger-cursors-dark";
        package = pkgs.phinger-cursors;
        size = 28;
    };
}