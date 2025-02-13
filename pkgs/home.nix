{ pkgs, ... }:
{
    imports = [
        ./apps/neovide.nix
        # ./apps/retroarch.nix
        # ./apps/emacs.nix
    ];

    programs.vscode.enable = true;

    home.packages = with pkgs; 
        [
            discord

            strawberry
            easyeffects

            neovim
            gnome-calculator
            gnome-calendar

            tic-80
        ];

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/about" = "firefox.desktop";
            "x-scheme-handler/unknown" = "firefox.desktop";
        };
    };
}
