{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Liga SFMono Nerd Font:size=7.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
        dpi-aware = "yes";
        horizontal-letter-offset = 0;
        vertical-letter-offset = 0;
        pad = "25x25center";
        term = "xterm-256color";
        selection-target = "clipboard";
        include = "${config.xdg.configHome}/foot/theme.ini";
      };
      desktop-notifications.command = "${lib.getExe pkgs.libnotify} -a \${app-id} -i \${app-id} \${title} \${body}";
      scrollback = {
        lines = 10000;
        multiplier = 3;
        indicator-position = "relative";
        indicator-format = "line";
      };
      url = {
        launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file, mailto, ipfs";
        uri-characters = ''
          abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]'';
      };
      cursor = {
        style = "beam";
        beam-thickness = "2";
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
      colors = {
        alpha = 1.0;
      };
    };
  };
}
