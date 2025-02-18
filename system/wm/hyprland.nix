{ inputs, pkgs, ... }:
{
    imports = [
        ./wayland.nix
    ];

    services.xserver.displayManager.gdm.enable = true;
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };

    environment.systemPackages = with pkgs; [
        kitty
        udisks
        udiskie
    ];

    services.udisks2.enable = true;
}