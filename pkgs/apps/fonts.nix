{ pkgs, ... }:
{
    fonts.packages = with pkgs; [
        maple-mono
        jetbrains-mono
        maple-mono-NF

        nerd-fonts.jetbrains-mono
    ];
}