{ inputs, ... }:
{
    imports = [
        ./wayland.nix
    ];

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [
        orca
        evince
        geary
        gnome-tour
        gnome-user-docs
        baobab
        epiphany
        gnome-contacts
        gnome-logs
        gnome-maps
        gnome-music
        gnome-connections
        simple-scan
        yelp
        gnome-software
    ];
}