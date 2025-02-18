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
        ../system/hardware/graphics.nix
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

    # Enable Cachix for Hyprland
    nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };

    # Use Fish in Interactive Shell
    programs.bash = {
        interactiveShellInit = ''
if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
then
    shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
    exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
fi
        '';
    };

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = (_: true);

    system.stateVersion = "24.11";
}
