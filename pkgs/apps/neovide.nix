{ pkgs, ... }:
{
    programs.neovide = {
        enable = true;
        package = pkgs.neovide;
        settings = {
            font = {
                normal = [ "Maple Mono NF" "Jetbrains Mono NF" ];
                size = 11.0;
            };
        };
    };
}