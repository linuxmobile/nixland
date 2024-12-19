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
    du-dust
    duf
    fd
    file
    jaq
    ripgrep
    killall
    koji
    jq

    yt-dlp
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
