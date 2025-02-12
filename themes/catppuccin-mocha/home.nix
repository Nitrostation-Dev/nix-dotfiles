{ pkgs, lib, config, userSettings, ... }:
{
    imports = [
        ./wm/wmSettings.nix
        ./wm/hyprland.nix
    ];
    
    stylix = {
        enable = true;
        image = ./wallpaper.png;
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
            };
            sansSerif = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
            };
            monospace = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
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
            package = pkgs.catppuccin-papirus-folders;
            dark = "Papirus-Dark";
            light = "Papirus-Light";
        };

        cursor = {
            package = pkgs.catppuccin-cursors.mochaDark;
            name = "catppuccin-mocha-dark-cursors";
            size = 28;
        };

        base16Scheme = ./colorScheme.yaml;

        autoEnable = true;
        targets.vscode.enable = false;
        opacity = {
            applications = 0.9;
            terminal = 0.9;
        };
    };

    home.pointerCursor = lib.mkForce {
        gtk.enable = true;
        x11.enable = true;
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 28;
    };

    # Customize Kitty
    programs.kitty = {
        enable = true;
        settings = {
            window_padding_width = 16;
        };
    };
}