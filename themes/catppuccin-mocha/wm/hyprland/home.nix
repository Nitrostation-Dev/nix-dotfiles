{ ... }:
{
    imports = [
        ./settings.nix
    ];

    programs.fuzzel = {
        enable = true;
    };
}