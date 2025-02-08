{ pkgs, ... }:
{
    imports = [
        ./wayland.nix
    ];

    programs.hyprland.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    environment.systemPackages = with pkgs; [
        kitty
    ];
}