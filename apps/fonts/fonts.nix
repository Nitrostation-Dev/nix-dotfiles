{ pkgs, ... }:
{
    fonts.packages = with pkgs; [
        maple-mono
        jetbrains-mono
    ];
}