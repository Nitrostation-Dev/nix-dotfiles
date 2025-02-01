{
    config,
    pkgs,
    systemSettings,
    userSettings,
    ...
}:

{
    imports = [
        ../system/hardware/bluetooth.nix
        ../system/hardware/pipewire.nix
        ../system/hardware/printer.nix
        (./. + "../../system/wm" + ("/" + userSettings.wm) + ".nix")

        ../pkgs/configuration.nix
        (./. + "../../themes" + ("/" + userSettings.theme) + "/configuration.nix")
    ];

    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = systemSettings.hostname; # Define Hostname
    networking.networkmanager.enable = true;

    time.timeZone = systemSettings.timezone;

    i18n.defaultLocale = systemSettings.locale;
    
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = systemSettings.kb_layout;
        variant = systemSettings.kb_variant;
    };
    
    nix.settings.experimental-features = [
        "nix-command"
        "flakes"
    ];
    
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.pranavanath = {
    	isNormalUser = true;
    	description = "Pranavanath";
    	extraGroups = [ "networkmanager" "wheel" ];
    };

    system.stateVersion = "24.11";
}
