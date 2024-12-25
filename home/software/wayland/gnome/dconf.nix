{lib, ...}: {
  dconf.settings = with lib.hm.gvariant; {
    "org/gnome/desktop/interface" = {
      gtk-enable-primary-paste = false;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/preferences" = {
      mouse-button-modifier = "<Super>";
      num-workspaces = 5;
      resize-with-right-button = true;
      focus-mode = "sloppy";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>q"];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-5 = ["<Shift><Super>5"];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-5 = ["<Super>5"];
      toggle-fullscreen = ["<Super>f"];
      toggle-maximized = ["<Super>space"];
    };

    "org/gnome/shell/keybindings" = {
      # Remove the default hotkeys for opening favorited applications.
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      switch-to-application-6 = [];
      switch-to-application-7 = [];
      switch-to-application-8 = [];
      switch-to-application-9 = [];
      switch-to-application-10 = [];
    };

    "org/gnome/mutter" = {
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = true;
      experimental-features = ["scale-monitor-framebuffer"];
      num-workspaces = 5;
      workspaces-only-on-primary = true;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
      mic-mute = ["AudioMicMute"];
      next = ["AudioNext"];
      play = ["AudioPlay"];
      previous = ["AudioPrev"];
      stop = ["AudioStop"];
      volume-down = ["AudioLowerVolume"];
      volume-up = ["AudioRaiseVolume"];
      home = ["<Super>e"];
      www = ["<Super>w"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>Return";
      command = "/usr/bin/env blackbox";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>e";
      command = "/usr/bin/env nautilus";
      name = "File Manager";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "sleep";
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      favorite-apps = ["org.gnome.Nautilus.desktop" "com.raggesilver.BlackBox.desktop" "microsoft-edge.desktop" "chromium-browser.desktop" "zen.desktop" "org.telegram.desktop.desktop" "app.drey.PaperPlane.desktop" "com.obsproject.Studio.desktop" "gimp.desktop" "org.inkscape.Inkscape.desktop" "io.github.nate_xyz.Paleta.desktop" "org.gnome.Solanum.desktop" "io.bassi.Amberol.desktop" "org.nickvision.tubeconverter.desktop" "io.github.alainm23.planify.desktop" "com.rafaelmardojai.Blanket.desktop" "dev.bragefuglseth.Keypunch.Devel.desktop" "io.github.seadve.Kooha.desktop" "dev.zed.Zed.desktop" "net.nokyan.Resources.desktop" "io.github.kaii_lb.Overskride.desktop" "com.mattjakeman.ExtensionManager.desktop" "org.gnome.tweaks.desktop" "org.gnome.Settings.desktop"];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/keybindings" = {
      toggle-application-view = ["<Super>a"];
    };

    "org.gnome.shell.weather" = {
      automatic-location = false;
      locations = "[<(uint32 2, <('Tres Arroyos', '', false, [<(-38.3739, -60.2798)>], @a(dd) []>)>]";
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      sort-directories-first = true;
    };

    "com/github/stunkymonkey/nautilus-open-any-terminal" = {
      terminal = "blackbox";
    };
  };
}
