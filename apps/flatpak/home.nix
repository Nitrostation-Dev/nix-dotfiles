{ ... }:
{
    services.flatpak = {
        enable = true;
        remotes = [{
            name = "flathub-beta"; location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
        }];
        packages = [
            "org.js.nuclear.Nuclear"
            "com.github.wwmm.easyeffects"
        ];
    };
}