{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "SF Pro";
      package = inputs.self.packages.${pkgs.system}.SF-Pro;
      size = 11;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme.override {
        boldPanelIcons = true;
        alternativeIcons = true;
      };
    };
  };
  xdg.configFile."gtk-4.0/gtk.css".enable = lib.mkForce false;

  home.sessionVariables = {
    XDG_ICON_DIR = "${pkgs.whitesur-icon-theme}/share/icons/WhiteSur";
  };
}
