{ pkgs, ... }:
{
    fonts.packages = with pkgs; [
        maple-mono
        jetbrains-mono
        maple-mono-NF

        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
}