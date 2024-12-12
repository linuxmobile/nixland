{pkgs, ...}: {
  imports = [
    ./browsers/chromium.nix
    ./browsers/edge.nix
    ./browsers/zen.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    tdesktop
    vesktop

    ps_mem
    nitch
    maxfetch

    # misc
    pciutils
    nixos-icons
    colord
    ffmpegthumbnailer
    imagemagick
    rizin
    nodejs
    nodePackages.pnpm
    jq
    socat
    catimg
    bun

    scrcpy

    burpsuite
    mitmproxy
  ];
}
