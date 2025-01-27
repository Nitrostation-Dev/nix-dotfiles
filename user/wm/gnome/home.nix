{ lib, pkgs, ... }:
{
    home.packages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.blur-my-shell
        gnomeExtensions.dash2dock-lite
        gnomeExtensions.tophat
        gnomeExtensions.unite
        gnomeExtensions.coverflow-alt-tab
    ];

    dconf.settings = {
        # Extension Settings
        "org/gnome/shell" = {
            enabled-extensions = [
                "user-theme@gnome-shell-extensions.gcampax.github.com"
                "blur-my-shell@aunetx"
                "dash2dock-lite@icedman.github.com"
                "tophat@fflewddur.github.io"
                "unite@hardpixel.eu"
            ];
        };
        # 1. Blur my Shell
        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
            blur = true;
        };

        "org/gnome/shell/extensions/blur-my-shell" = {
            pipelines = "{'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.69999999999999996>, 'unscaled_radius': <50>}>}>]>}, 'pipeline_{'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.69999999999999996>, 'unscaled_radius': <50>}>}>]>}, 'pipeline_default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000001'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>, <{'type': <'corner'>, 'id': <'effect_000000000002'>, 'params': <{'radius': <24>}>}>]>}}default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000001'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>, <{'type': <'corner'>, 'id': <'effect_000000000002'>, 'params': <{'radius': <24>}>}>]>}}";
        };
        # 2. Dash2Dock Lite
        "org/gnome/shell/extensions/dash2dock-lite" = {
            autohide-dash = true;
            icon-spacing = 0.40252293577981652;
            icon-size = 0.20092024539877301;
            edge-distance = 0.53103448275862064;
            dock-padding = 0.69626168224299068;
            border-thickness = 1;
            border-color = (mkTuple [ 0.18431372940540314 0.18823529779911041 0.25882354378700256 1.0 ]); 
            # background-color = (0.11764705926179886 0.11764705926179886 0.18039216101169586 0.73666667938232422);
            running-indicator-style = 1;
            running-indicator-color = (0.5372549295425415 0.70588231086730957 0.98039215803146362 0.62999999523162842);
            apps-icon = false;
            mounted-icon = true;
            animation-spread = 0.46000000000000002;
            animation-rise = 1.0;
        };

        # 3. TopHat
        "org/gnome/shell/extensions/tophat" = {
            cpu-display = "numeric";
            mem-display = "numeric";
            show-fs = false;
        };

        # 4. Unite
        "org/gnome/shell/extensions/unite" = {
            show-window-buttons = "maximized";
            extend-left-box = false;
            reduce-panel-spacing = true;
            greyscale-tray-icons = true;
            desktop-name-text = "Desktop";
            window-buttons-theme = "catppuccin";
            hide-window-titlebars = "maximized";
            window-buttons-placement = "first";
        };
    };
}