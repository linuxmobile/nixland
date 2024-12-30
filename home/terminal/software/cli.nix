{pkgs, ...}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar

    # misc
    libnotify
    fontconfig

    # utils
    dijo
    du-dust
    duf
    fd
    jq
    bc
    file
    jaq
    ripgrep
    killall
    koji
  ];

  programs = {
    eza.enable = true;
    eza.enableZshIntegration = true;
    ssh.enable = true;
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
