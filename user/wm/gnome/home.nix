{ config, lib, pkgs, ... }:
let
    inherit (lib.hm.gvariant) mkTuple mkDouble;
in
{
    home.packages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.blur-my-shell
        gnomeExtensions.dash2dock-lite
        gnomeExtensions.tophat
        gnomeExtensions.unite
    ];

    dconf.settings = {
        # Gnome Settings
        "org/gnome/shell" = {
            favorite-apps = [
                "app.zen_browser.zen.desktop" "home-manager-discord.desktop" "org.strawberrymusicplayer.strawberry.desktop" "home-manager-com.github.wwmm.easyeffects.desktop" "home-manager-code.desktop"
            ];
        };

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

        # 2. Dash2Dock Lite
        "org/gnome/shell/extensions/dash2dock-lite" = {
            autohide-dash = true;
            icon-spacing = (mkDouble "0.40252293577981652");
            icon-size = (mkDouble "0.20092024539877301");
            edge-distance = (mkDouble "0.53103448275862064");
            dock-padding = (mkDouble "0.69626168224299068");
            border-thickness = 1;
            border-color = (mkTuple [ (mkDouble "0.18431372940540314") (mkDouble "0.18823529779911041") (mkDouble "0.25882354378700256") (mkDouble "1.0") ]); 
            background-color = (mkTuple [ (mkDouble "0.11764705926179886") (mkDouble "0.11764705926179886") (mkDouble "0.18039216101169586") (mkDouble "0.73666667938232422") ]);
            running-indicator-style = 1;
            running-indicator-color = (mkTuple [ 0.5372549295425415 0.70588231086730957 0.98039215803146362 0.62999999523162842 ]);
            apps-icon = false;
            mounted-icon = true;
            animation-spread = (mkDouble "0.56");
            animation-rise = (mkDouble "1.0");
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