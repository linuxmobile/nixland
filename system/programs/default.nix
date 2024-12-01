{pkgs,...}:{
  imports = [
    ./fonts.nix
    ./home-manager.nix
    # ./qt.nix
    ./xdg.nix
  ];

  programs = {
    # make HM-managed GTK stuff work
    dconf.enable = true;
    seahorse.enable = true;
    adb.enable = true;
  };
  services.udev.packages = [pkgs.android-udev-rules];
}
