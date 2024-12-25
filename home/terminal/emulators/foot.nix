{pkgs, ...}: {
  home.packages = [pkgs.libsixel];
  programs.foot = {
    enable = true;
    settings = {
      csd = {
        size = 0;
      };
      main = {
        font = "SFMono Nerd Font:size=7.5:fontfeatures=calt:fontfeatures=dlig:fontfeatures=liga";
        dpi-aware = "yes";
        pad = "25x25center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        term = "xterm-256color";
        selection-target = "clipboard";
      };
      scrollback = {
        lines = 10000;
        multiplier = 3;
      };
      url = {
        launch = "xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file";
        uri-characters = ''
          abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]'';
      };
      cursor = {
        style = "beam";
        beam-thickness = "2";
      };
      colors = {
        alpha = 1.0;
        foreground = "ebdbb2";
        background = "131313";
        regular0 = "3C3836"; # black
        regular1 = "EA6962"; # red
        regular2 = "A9B665"; # green
        regular3 = "D8A657"; # yellow
        regular4 = "7DAEA3"; # blue
        regular5 = "D3869B"; # magenta
        regular6 = "89B482"; # cyan
        regular7 = "D4BE98"; # white
        bright0 = "3C3836"; # bright black
        bright1 = "EA6962"; # bright red
        bright2 = "A9B665"; # bright green
        bright3 = "D8A657"; # bright yellow
        bright4 = "7DAEA3"; # bright blue
        bright5 = "D3869B"; # bright magenta
        bright6 = "89B482"; # bright cyan
        bright7 = "D4BE98"; # bright white
      };
      tweak = {
        font-monospace-warn = "no";
        sixel = "yes";
      };
    };
  };
}
