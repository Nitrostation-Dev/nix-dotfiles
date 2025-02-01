{ pkgs, ... }:
{
    stylix = {
        enable = true;
        image = ./wallpaper.png;
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            sansSerif = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            monospace = {
                package = pkgs.jetbrains-mono;
                name = "Jetbrains Mono";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
        base16Scheme = ./colorScheme.yaml;

        cursor = {
            package = pkgs.phinger-cursors;
            name = "Phinger-cursors-dark";
            size = 28;
        };
    };
}