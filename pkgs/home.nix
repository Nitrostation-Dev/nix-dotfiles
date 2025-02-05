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
}
