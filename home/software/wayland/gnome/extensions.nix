{pkgs, ...}: let
  defaultExtensions = with pkgs.gnomeExtensions; [
    appindicator
    battery-time-2
    blur-my-shell
    dash-to-dock
    tiling-shell
    user-themes
    light-style
    media-controls
    tray-icons-reload
    search-light
    coverflow-alt-tab
    vitals
    clipboard-indicator
  ];

  gnomeShellScheme = "org/gnome/shell/extensions";
in {
  home.packages = with pkgs;
    [
      gnome-extension-manager
      dart-sass
    ]
    ++ defaultExtensions;

  dconf.settings = {
    "org/gnome/shell".enabled-extensions = builtins.map (extension: extension.extensionUuid) defaultExtensions;

    "${gnomeShellScheme}/blur-my-shell" = {
      brightness = 0.9;
    };

    "${gnomeShellScheme}/clipboard-indicator" = {
      display-mode = 0;
      disable-down-arrow = true;
      move-item-first = true;
      paste-button = true;
      toggle-menu = [
        "<Super>,"
      ];
    };

    "${gnomeShellScheme}/dash-to-dock" = {
      # intellihide = true;
      apply-custom-theme = true;
      autohide = true;
      background-opacity = 0.0;
      click-action = "minimize";
      dash-max-icon-size = 40;
      dock-fixed = true;
      dock-position = "BOTTOM";
      hot-keys = false;
      intellihide-mode = "ALL_WINDOWS";
      pressure-threshold = 150.0;
      require-pressure-to-show = true;
      scroll-action = "cycle-windows";
      show-favorites = true;
      show-trash = false;
      transparency-mode = "fixed";
    };

    "${gnomeShellScheme}/search-light" = {
      shortcut-search = ["<Super>d"];
    };

    "${gnomeShellScheme}/vitals" = {
      hide-icons = false;
      hide-zeros = false;
      include-public-ip = false;
      include-static-info = false;
      memory-measurement = 1;
      menu-centered = false;
      network-speed-format = 0;
      position-in-panel = 1;
      show-fan = false;
      show-network = true;
      show-storage = false;
      show-temperature = true;
      show-voltage = true;
      update-time = 30;
      use-higher-precision = false;
    };
  };
}
