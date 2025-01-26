{ config, pkgs, systemSettings, ... }:
{
    environment.systemPackages = with pkgs;
        [
            wayland
        ];

    services.xserver = {
        enable = true;
        xkb = {
            layout = systemSettings.kb_layout;
            variant = systemSettings.kb_variant;
        };
    };
}