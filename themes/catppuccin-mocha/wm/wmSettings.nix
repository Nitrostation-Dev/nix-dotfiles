{ config, lib, userSettings, ... }:
{
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

    col.active_border = rgba(f38ba8ff)
    col.inactive_border = rgba(6c7086ff)

    resize_on_border = false
    allow_tearing = false
    layout = dwindle
}

decoration {
    rounding = 8

    active_opacity = 1.0
    inactive_opacity = 0.9

    dim_inactive = true
    dim_strength = 0.075
    dim_special = 0.4

    blur {
        enabled = true
        new_optimizations = true
        size = 8
        passes = 1

        popups = false

        vibrancy = 0.1696
    }

    shadow {
        enabled = true
        range = 1
        render_power = 1
        color = rgba(1a1a1aff)
        color_inactive = rgba(1a1a1eff)
    }
}
        '';
    };
}