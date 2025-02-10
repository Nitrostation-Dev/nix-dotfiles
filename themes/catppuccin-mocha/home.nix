{ pkgs, lib, config, userSettings, ... }:
{
    # lib.mkIf (userSettings.wm = "hyprland") {
    imports = [
        ./wm/hyprland.nix
    ];
    # };
    
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

        targets.vscode.enable = false;
    };

    # Hyprland Config
    home.pointerCursor = lib.mkForce {
        gtk.enable = true;
        x11.enable = true;
        name = "catppuccin-mocha-dark-cursors";
        package = pkgs.catppuccin-cursors.mochaDark;
        size = 28;
    };

    options = with lib; with types; {
        hyprland_theme_settings = mkOption { type = str; };
    };
    config = {
        hyprland_theme_settings = ''
# LOOK AND FEEL
general {
    gaps_in = 4 
    gaps_out = 10

    border_size = 2

    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    resize_on_border = false

    allow_tearing = false

    layout = dwindle
}

decoration {
    rounding = 10

    active_opacity = 1.0
    inactive_opacity = 1.0

    shadow {
        enabled = true
        range = 4
        render_power = 3
        color = rgba(1a1a1aee)
    }

    blur {
        enabled = true
        size = 3
        passes = 1

        vibrancy = 0.1696
    }
}
        '';
    };
}