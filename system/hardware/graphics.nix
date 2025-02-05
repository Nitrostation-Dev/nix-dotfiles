{ config, pkgs, ... }:
{
    hardware.opengl = {
        enable = true;
        extraPackages = with pkgs; [
            vpl-gpu-rt
        ];
    };

    hardware.nvidia = {
        modesettings.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}