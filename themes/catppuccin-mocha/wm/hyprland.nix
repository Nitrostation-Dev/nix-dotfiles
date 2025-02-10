{ lib, userSettings, ... }:
lib.mkIf ( userSettings.wm == "hyprland" )
{
    programs.fuzzel = {
        enable = true;
    };
}