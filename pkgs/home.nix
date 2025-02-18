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
            floorp
            discord

            strawberry
            easyeffects

            neovim

            mission-center
            flowtime
            recordbox
                
            gnome-text-editor
            gnome-calculator
            gnome-calendar
        ];

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "floorp.desktop";
            "x-scheme-handler/https" = "floorp.desktop";
            "x-scheme-handler/about" = "floorp.desktop";
            "x-scheme-handler/unknown" = "floorp.desktop";

            "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
            "text/plain" = "org.gnome.TextEditor.desktop";
        };
    };
}
