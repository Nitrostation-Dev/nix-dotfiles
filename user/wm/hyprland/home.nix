{ inputs, config, pkgs, userSettings, systemSettings, ... }:
{
    home.packages = with pkgs; [
        nautilus
        file-roller
        gnome-disk-utility

        cava
        zathura
        qimgv

        fuzzel
        wlogout
        hyprlock

        pavucontrol
        playerctl
        brightnessctl

    ];

    services.clipman.enable = true;
    
    # HYPRLAND CONFIG
    wayland.windowManager.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

        plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}; [
            borders-plus-plus
        ];

        extraConfig = ''
# MONITORS
monitor=,preferred,auto,1.0

# ENVIRONMENT VARIABLES
env = XCURSOR_SIZE,32
env = HYPRCURSOR_SIZE,32

# STARTUP APPLICATIONS
exec-once = udiskie

# LOOK AND FEEL
general {
    gaps_in = 5
    gaps_out = 20
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
animations {
    enabled = yes, please :)
    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1
    animation = global, 1, 10, default
    animation = border, 1, 5.39, easeOutQuint
    animation = windows, 1, 4.79, easeOutQuint
    animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsOut, 1, 1.49, linear, popin 87%
    animation = fadeIn, 1, 1.73, almostLinear
    animation = fadeOut, 1, 1.46, almostLinear
    animation = fade, 1, 3.03, quick
    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade
    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear
    animation = workspaces, 1, 1.94, almostLinear, fade
    animation = workspacesIn, 1, 1.21, almostLinear, fade
    animation = workspacesOut, 1, 1.94, almostLinear, fade
}
dwindle {
    pseudotile = true
    preserve_split = true 
}
master {
    new_status = master
}
# ENVIRONMENT VARIABLES
env = XCURSOR_SIZE,32
env = HYPRCURSOR_SIZE,32

misc {
    force_default_wallpaper = -1 
    disable_hyprland_logo = false
}

# INPUT
input {
    kb_layout = ${systemSettings.kb_layout}
    # kb_variant = ${systemSettings.kb_variant}
    kb_variant = ${systemSettings.kb_variant}

    follow_mouse = 2
    sensitivity = 0.2
    accel_profile = 0.2144477506 0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387

    touchpad {
        natural_scroll = true 
    }
}

device {
    name = instant-usb-gaming-mouse-
    accel_profile = flat
    sensitivity = -0.2
}

gestures {
    workspace_swipe = true
    workspace_swipe_fingers = 3
    workspace_swipe_distance = 800
    workspace_swipe_min_speed_to_force = 50
}

# PROGRAMS
$terminal = kitty
$menu = fuzzel --placeholder="Apps List"

# KEYBINDS
$mainMod = SUPER

bind = $mainMod, Q, killactive,
bind = $mainMod, F, fullscreen,
bind = $mainMod, V, togglefloating,
bind = $mainMod, P, pseudo,
bind = $mainMod, GRAVE, togglesplit,

bind = $mainMod, DELETE, exec, wlogout
bind = $mainMod SHIFT, DELETE, exit
bind = $mainMod, RETURN, exec, $terminal 
bind = $mainMod, E, exec, nautilus 
bind = $mainMod, R, exec, $menu
bind = $mainMod SHIFT, V, exec, clipman pick --tool=CUSTOM --tool-args="fuzzel --placeholder=\"Clipboard History\" -d"

# Cycle focus
bind = ALT, TAB, cyclenext,
bind = ALT SHIFT, TAB, cyclenext, prev

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move focused window with mainMod + SHIFT + arrow keys
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow, r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Resize focused window with mainMod + CTRL + arrow keys
binde = $mainMod CTRL, left, resizeactive, -50 0
binde = $mainMod CTRL, right, resizeactive, 50 0
binde = $mainMod CTRL, up, resizeactive, 0 50
binde = $mainMod CTRL, down, resizeactive, 0 -50

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Laptop multimedia keys for volume and LCD brightness
bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

# Requires playerctl
bindl = , XF86AudioNext, exec, playerctl next
bindl = , XF86AudioPause, exec, playerctl play-pause
bindl = , XF86AudioPlay, exec, playerctl play-pause
bindl = , XF86AudioPrev, exec, playerctl previous

# LOAD THEME SPECIFIC SETTINGS
# ${config.hyprland_theme_settings}

# WindowRules
windowrulev2 = float, class:org.gnome.Nautilus
windowrulev2 = float, class:org.gnome.Calculator
windowrulev2 = float, class:org.pulseaudio.pavucontrol
windowrulev2 = float, class:.blueman-manager-wrapped

windowrulev2 = size 1200 800, class:org.gnome.Nautilus
windowrulev2 = size 200 500, class:org.gnome.Calculator
windowrulev2 = size 500 500, class:org.pulseaudio.pavucontrol
windowrulev2 = size 500 500, class:.blueman-manager-wrapped
        '';
    };

    # HYPRLOCK CONFIG
    programs.hyprlock = {
        enable = true;
        package = pkgs.hyprlock;
    #     settings = {
    #         general = {
    #             disable_loading_bar = true;
    #             grace = 300;
    #             hide_cursor = true;
    #             no_fade_in = false;

    #         };

    #         background = [
    #             {
    #                 path = "screenshot";
    #                 blur_passes = 3;
    #                 blur_size = 8;
    #             }
    #         ];

    #         input-field = {
    #             size = "200, 50";
    #             position = "0, -50";
    #             monitor = "";
    #             dots_center = true;
    #             fade_on_empty = false;
    #             font_color = "rgb(202, 211, 245)";
    #             inner_color = "rgb(91, 96, 120)";
    #             outer_color = "rgb(24, 25, 38)";
    #             outline_thickness = 5;
    #             # placeholder_text = '\'<span foreground="##cad3f5">Password...</span>'\';
    #             shadow_passes = 2;
    #         };
    #     };
    };
}
