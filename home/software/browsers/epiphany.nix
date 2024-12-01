{pkgs, ...}: {
  home.packages = [
    pkgs.epiphany
  ];

  dconf.settings = {
    "org/gnome/epiphany/web" = {
      enable-webextensions = true;
      show-developer-actions = true;
      enable-mouse-gestures = true;
      switch-to-new-tab = true;
      use-google-search-suggestions = true;
      web-extensions-active = [
        "uBlock Origin"
        "Bitwarden Password Manager"
      ];
      ask-for-default = false;
    };
  };
}
