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
    file
    jaq
    ripgrep
    killall

    yt-dlp
    cfspeedtest
    onefetch
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
