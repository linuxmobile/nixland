{
  pkgs,
  specialArgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      specialArgs.inputs.nixos-cosmic.packages.x86_64-linux.xdg-desktop-portal-cosmic
    ];
    config.common.default = "*";
  };
}
