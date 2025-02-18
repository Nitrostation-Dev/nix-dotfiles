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
    gaps_out = 8

    border_size = 2

    col.active_border = rgba(89b4faff) rgba(94e2d5ff) 45deg
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
        size = 12
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

# COLORS
plugin {
    borders-plus-plus {
        add-borders = 0
        col.border_1 = rgb(1e1e2e)
        border_size_1 = 5
        natural_rounding = no
    }
}

# Opacity for certain applications
windowrulev2 = opacity 0.9, class:org.gnome.Nautilus
windowrulev2 = opacity 0.95, class:Code 
windowrulev2 = opacity 0.95, class:firefox
windowrulev2 = opacity 0.9, class:org.gnome.Calendar
windowrulev2 = opacity 0.9, class:org.gnome.Calculator
windowrulev2 = opacity 0.9, class:org.pulseaudio.pavucontrol
windowrulev2 = opacity 0.9, class:.blueman-manager-wrapped
        '';
    };
}