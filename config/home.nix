{ inputs, lib, config, pkgs, userSettings, ... }:
{
    imports = [
        (./. + "../../user/wm" + ("/" + userSettings.wm) + "/home.nix")
        ../pkgs/home.nix

        (./. + "../../themes" + ("/" + userSettings.theme) + "/home.nix")
    ];

    # Use Fish
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set fish_greeting # Disable greeting
        '';
        plugins = [
            { name = "grc"; src = pkgs.fishPlugins.grc.src; }
            { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
            { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
            { name = "done"; src = pkgs.fishPlugins.done.src; }
        ];
    };

    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";
    home.stateVersion = "25.05";
}
