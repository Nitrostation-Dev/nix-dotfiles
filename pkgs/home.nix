{ pkgs, ... }:
{
    imports = [
        # ./flatpak/home.nix
        ./apps/retroarch.nix
        ./apps/firefox.nix
        # ./apps/emacs.nix
    ];

    programs.vscode.enable = true;

    home.packages = with pkgs; 
        [
            discord

            strawberry
            easyeffects

            neovim

            tic-80
        ];

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
        };
    };
}
