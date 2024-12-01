{
  config,
  lib,
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
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        NIXOS_OZONE_WL = "1";
      };
      spawn-at-startup = [
        (makeCommand "/usr/libexec/polkit-gnome-authentication-agent-1")
        # (makeCommand "hyprlock")
        (makeCommand "systemctl --user start clight")
        (makeCommand "wl-paste --type image --watch cliphist store")
        (makeCommand "wl-paste --type text --watch cliphist store")
        {
          command = [
            "${pkgs.dbus}/bin/dbus-update-activation-environment"
            "--systemd"
            "DISPLAY"
            "WAYLAND_DISPLAY"
            "SWAYSOCK"
            "XDG_CURRENT_DESKTOP"
            "XDG_SESSION_TYPE"
            "NIXOS_OZONE_WL"
            "XCURSOR_THEME"
            "XCURSOR_SIZE"
            "XDG_DATA_DIRS"
          ];
        }
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
            refresh = 75.973;
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
          active.gradient = {
            angle = 45;
            relative-to = "workspace-view";
            from = "#9796f0";
            to = "#fbc7d4";
          };
          inactive.color = "#000000";
        };

        preset-column-widths = [
          {proportion = 1.0 / 3.0;}
          {proportion = 1.0 / 2.0;}
          {proportion = 2.0 / 3.0;}
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
      binds = with config.lib.niri.actions; let
        set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
        brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
        playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
        ags = spawn "${pkgs.ags}/bin/ags" "-r";
      in
        {
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
          "Mod+Return".action = spawn "${pkgs.foot}/bin/foot";
          # "Ctrl+Alt+L".action = spawn "pgrep hyprlock || hyprlock";

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
          "Mod+J".action = focus-workspace-down;
          "Mod+K".action = focus-workspace-up;
          "Mod+Left".action = focus-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+Down".action = focus-window-down;
          "Mod+Up".action = focus-window-up;

          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+L".action = move-column-right;
          "Mod+Shift+K".action = move-column-to-workspace-up;
          "Mod+Shift+J".action = move-column-to-workspace-down;

          "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
          "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        }
        // (lib.attrsets.mergeAttrsList (
          map (x: let
            xStr = builtins.toString x;
          in {
            "Mod+${xStr}".action = focus-workspace x;
            "Mod+Shift+${xStr}".action = move-column-to-workspace x;
          })
          (builtins.genList (x: x + 1) 9)
        ));
      window-rules = [
        {
          geometry-corner-radius = let
            radius = 8.0;
          in {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };
          clip-to-geometry = true;
        }
        {
          matches = [{app-id = "org.telegram.desktop";}];
          block-out-from = "screencast";
          max-width = 550;
        }
        {
          matches = [{app-id = "app.drey.PaperPlane";}];
          block-out-from = "screencast";
          max-width = 550;
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
