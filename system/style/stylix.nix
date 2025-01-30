{ pkgs, ... }:
{
    stylix = {
        enable = true;
        image = ../../themes/catppuccin-mocha/wallpaper.png;
        polarity = "dark";
        fonts = {
            serif = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
            };
            sansSerif = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
            };
            monospace = {
                package = pkgs.maple-mono;
                name = "Maple Mono";
            };
            emoji = {
                package = pkgs.noto-fonts-emoji;
                name = "Noto Color Emoji";
            };
        };
        base16Scheme = ../../themes/catppuccin-mocha/catppuccin-mocha.yaml;

        cursor = {
            package = pkgs.catppuccin-cursors.mochaDark;
            name = "catppuccin-mocha-dark-cursors";
            size = 28;
        };
    };
}