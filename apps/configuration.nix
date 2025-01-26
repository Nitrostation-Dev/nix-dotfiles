{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;
        [
            firefox

            wget
            git
            curl
            nixfmt-rfc-style
        ];
}
