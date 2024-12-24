{
  pkgs,
  inputs,
  ...
}: {
  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [
      oxygen
      plasma-browser-integration
      elisa
      kate
      khelpcenter
      okular
      gwenview
    ];
    systemPackages = with pkgs; [
      kdePackages.qtstyleplugin-kvantum
      kdePackages.sddm-kcm
      kdePackages.qt6ct
      kde-rounded-corners
      inputs.kwin-effects-forceblur.packages.${pkgs.system}.default

      # apps
      amberol
      celluloid
      kooha
      loupe
      resources
      cavalier
      easyeffects

      wl-clipboard
    ];
  };

  services = {
    xserver.enable = true;
    xserver.desktopManager.xterm.enable = false;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
    desktopManager.plasma6 = {
      enable = true;
    };
  };

  programs = {
    dconf.enable = true;
    kdeconnect.enable = true;
  };
}
