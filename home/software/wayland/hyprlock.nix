{
  config,
  inputs,
  pkgs,
  ...
}: let
  font_family = "SF Pro Rounded";
in {
  programs.hyprlock = {
    enable = true;

    package = inputs.hyprlock.packages.${pkgs.system}.hyprlock;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          path = "${config.xdg.userDirs.download}/blue_distortion_1.jpg";
          blur_passes = 3;
          blur_size = 6;
          noise = 0.1;
          contrast = 1.1;
          brightness = 1.2;
        }
      ];

      input-fields = [
        {
          monitor = "eDP-1";

          size = {
            width = 300;
            height = 50;
          };

          outline_thickness = 2;

          # outer_color = "rgb(${c.primary})";
          # inner_color = "rgb(${c.on_primary_container})";
          # font_color = "rgb(${c.primary_container})";

          fade_on_empty = false;
          # placeholder_text = ''<span font_family="${font_family}" foreground="##${c.primary_container}">Password...</span>'';

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 50;
          # color = "rgb(${c.primary})";

          position = "0, 150";

          valign = "center";
          halign = "center";
        }
        {
          monitor = "";
          text = "cmd[update:3600000] date +'%a %b %d'";
          inherit font_family;
          font_size = 20;
          # color = "rgb(${c.primary})";

          position = "0, 50";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
