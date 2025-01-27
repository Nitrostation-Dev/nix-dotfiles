{ pkgs, ... }:
{
    home.packages = with pkgs; [
        # Gnome Extensions
        gnomeExtensions.blur-my-shell
        gnomeExtensions.dash2dock-lite
        gnomeExtensions.tophat
        gnomeExtensions.unite
    ];
}