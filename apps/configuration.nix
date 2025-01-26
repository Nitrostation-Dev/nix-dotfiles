{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;
        [
            firefox

            gnome-tweaks

            wget
            git
            curl
            nixfmt-rfc-style
        ];
}
