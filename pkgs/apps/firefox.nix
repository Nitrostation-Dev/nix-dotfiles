{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        preferences = {
            "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
    };

    xdg.mimeApps = {
        enable = true;
        defaultApplications = {
            "text/html" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/about" = "app.zen_browser.zen.desktop";
            "x-scheme-handler/unknown" = "app.zen_browser.zen.desktop";
        };
    };
}