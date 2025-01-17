{
  config,
  pkgs,
  ...
}: {
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    systemPackages = with pkgs; [
      gnome-text-editor
      ffmpegthumbnailer
      adwaita-icon-theme
      dconf-editor
      gnome-themes-extra
      gnome-tweaks
      nautilus-python
      nautilus-open-any-terminal
      wl-clipboard
    ];

    gnome.excludePackages =
      (with pkgs; [
        gnome-console
        gedit
        gnome-connections
        gnome-photos
        gnome-tour
        snapshot
        cheese # webcam tool
        epiphany # web browser
        geary # email reader
        evince # document viewer
      ])
      ++ (with pkgs; [
        eog
        gnome-music
        gnome-characters
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        yelp # Help view
        gnome-contacts
        gnome-initial-setup
        simple-scan
        gnome-shell-extensions
        gnome-maps
        gnome-font-viewer
      ]);
  };

  services.xserver = {
    enable = true;
    displayManager = {
      gdm.enable = true;
    };
    desktopManager.xterm.enable = false;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [
        pkgs.nautilus-open-any-terminal
      ];
    };
  };
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "linuxmobile";

  xdg.portal.extraPortals = with pkgs; [xdg-desktop-portal-gnome];

  services.udev.packages = with pkgs; [gnome-settings-daemon];

  programs.dconf.profiles = {
    gdm.databases = [
      {
        settings = {
          "org/gnome/mutter".experimental-features = ["scale-monitor-framebuffer"];
          # "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
          "org/gnome/desktop/peripherals/touchpad".tap-to-click = true;
        };
      }
    ];
  };
}
