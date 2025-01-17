{
  config,
  inputs,
  pkgs,
  ...
}: let
  pointer = config.home.pointerCursor;
  makeCommand = command: {
    command = [command];
  };
in {
  programs.niri = {
    enable = true;
    settings = {
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = ":0";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
      };
      spawn-at-startup = [
        (makeCommand "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
        (makeCommand "hyprlock")
        (makeCommand "wl-paste --type image --watch cliphist store")
        (makeCommand "wl-paste --type text --watch cliphist store")
      ];
      input = {
        keyboard.xkb.layout = "latam";
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          # scroll-factor = 0.1;
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus = true;
        workspace-auto-back-and-forth = true;
      };
      outputs = {
        "eDP-1" = {
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = -1080;
          };
        };
      };
      cursor = {
        size = 20;
        theme = "${pointer.name}";
      };
      layout = {
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 1;
          active.color = "#16aff1";
          inactive.color = "#245b89";
        };

        preset-column-widths = [
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
          {proportion = 1.0;}
        ];
        default-column-width = {proportion = 1.0 / 2.0;};

        gaps = 8;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };

      animations.shaders.window-resize = ''
        vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
          vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

          vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
          vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

          // We can crop if the current window size is smaller than the next window
          // size. One way to tell is by comparing to 1.0 the X and Y scaling
          // coefficients in the current-to-next transformation matrix.
          bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
          bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

          vec3 coords = coords_stretch;
          if (can_crop_by_x)
              coords.x = coords_crop.x;
          if (can_crop_by_y)
              coords.y = coords_crop.y;

          vec4 color = texture2D(niri_tex_next, coords.st);

          // However, when we crop, we also want to crop out anything outside the
          // current geometry. This is because the area of the shader is unspecified
          // and usually bigger than the current geometry, so if we don't fill pixels
          // outside with transparency, the texture will leak out.
          //
          // When stretching, this is not an issue because the area outside will
          // correspond to client-side decoration shadows, which are already supposed
          // to be outside.
          if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
              color = vec4(0.0);
          if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
              color = vec4(0.0);

          return color;
        }
      '';

      binds = with config.lib.niri.actions; let
        set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
        brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
        playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
        ags = spawn "${pkgs.ags}/bin/ags" "-r";
      in {
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

        "XF86AudioPlay".action = playerctl "play-pause";
        "XF86AudioStop".action = playerctl "pause";
        "XF86AudioPrev".action = playerctl "previous";
        "XF86AudioNext".action = playerctl "next";

        "XF86AudioRaiseVolume".action = set-volume "5%+";
        "XF86AudioLowerVolume".action = set-volume "5%-";

        "XF86MonBrightnessUp".action = brillo "-A" "5";
        "XF86MonBrightnessDown".action = brillo "-U" "5";

        "XF86Calculator".action = ags "recorder.start()";
        "Print".action = screenshot-screen;
        "Mod+Shift+Alt+S".action = screenshot-window;
        "Mod+Shift+S".action = screenshot;
        "Mod+D".action = spawn "${pkgs.anyrun}/bin/anyrun";
        "Mod+Return".action = spawn "${
          inputs.ghostty.packages.${pkgs.system}.default
        }/bin/ghostty";
        "Ctrl+Alt+L".action = spawn "sh -c pgrep hyprlock || hyprlock";

        "Mod+U".action = spawn "XDG_CURRENT_DESKTOP=gnome gnome-control-center";

        "Mod+Q".action = close-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;
        "Mod+C".action = center-column;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Plus".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Plus".action = set-window-height "+10%";

        "Mod+H".action = focus-column-left;
        "Mod+L".action = focus-column-right;
        "Mod+J".action = focus-window-or-workspace-down;
        "Mod+K".action = focus-window-or-workspace-up;
        "Mod+Left".action = focus-column-left;
        "Mod+Right".action = focus-column-right;
        "Mod+Down".action = focus-workspace-down;
        "Mod+Up".action = focus-workspace-up;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+L".action = move-column-right;
        "Mod+Shift+K".action = move-column-to-workspace-up;
        "Mod+Shift+J".action = move-column-to-workspace-down;

        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
      };
      window-rules = [
        {
          geometry-corner-radius = let
            radius = 16.0;
          in {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [{app-id = "org.telegram.desktop";}];
          block-out-from = "screencast";
        }
        {
          matches = [{app-id = "app.drey.PaperPlane";}];
          block-out-from = "screencast";
        }
        {
          matches = [{app-id = "com.rafaelmardojai.Blanket";}];
        }
        {
          matches = [{app-id = "org.nickvision.cavalier";}];
        }
      ];

      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
    };
  };
}
