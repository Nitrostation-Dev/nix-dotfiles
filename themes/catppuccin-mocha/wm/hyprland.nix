{ lib, userSettings, ... }:
lib.mkIf ( userSettings.wm == "hyprland" )
{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
                font = lib.mkForce "Maple Mono:size=9";
                use-bold = true;
                horizotal-pad = 5;
                vertical-pad = 20;
                inner-pad = 10;
                line-height = 12;

                image-size-ratio = 0;
                icons-enable = true;
                icon-theme = "Papirus-Dark";
            };
            border = {
                width = 2;
                radius = 8;
            };
        };
    };
}