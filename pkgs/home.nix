{ pkgs, ... }:
{
    imports = [
        # ./flatpak/home.nix
        ./apps/retroarch.nix
        ./apps/floorp.nix
    ];

    programs.vscode.enable = true;

    home.packages = with pkgs; 
        [
            brave
            discord

            strawberry
            easyeffects

            neovim

            tic-80
        ];
}
