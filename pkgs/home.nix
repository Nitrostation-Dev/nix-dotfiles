{ pkgs, ... }:
{
    imports = [
        ./apps/retroarch.nix
        ./apps/syncthing.nix
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
            "text/html" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/about" = "firefox.desktop";
            "x-scheme-handler/unknown" = "firefox.desktop";
        };
    };
}
