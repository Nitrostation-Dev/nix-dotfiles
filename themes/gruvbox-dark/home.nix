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
        };

        iconTheme = {
            enable = true;
            package = pkgs.catppuccin-papirus-folders;
            dark = "Papirus-Dark";
            light = "Papirus-Light";
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