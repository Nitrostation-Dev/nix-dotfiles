{ pkgs, ... }:
{
    programs.vscode.enable = true;

    home.packages = with pkgs; 
        [
            brave
            discord

            nuclear
            easyeffects

            neovim
        ];
}
