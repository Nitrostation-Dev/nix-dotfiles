{ pkgs, ... }:
{
    imports = [
        # ./flatpak/home.nix
    ];

    programs.vscode.enable = true;

    home.packages = with pkgs; 
        [
            brave
            discord

            strawberry
            easyeffects

            neovim
        ];
}
