{ pkgs, ... }:
{
    stylix = {
        enable = true;
        image = ../../system/style/wallpaper.png;
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
            sizes = {
                applications = 11;
                desktop = 10;
                popups = 10;
                terminal = 10;
            };
        };
        base16Scheme = ../../system/style/catppuccin-mocha.yaml;

        targets.vscode.enable = false;
    };
}