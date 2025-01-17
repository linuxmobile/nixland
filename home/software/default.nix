{
  pkgs,
  ...
}: {
  imports = [
    ./browsers/chromium.nix
    ./browsers/edge.nix
    ./browsers/zen.nix
    ./gtk.nix
    ./media
  ];

  home.packages = with pkgs; [
    # messaging
    telegram-desktop
    vesktop

    ps_mem
    fastfetch

    # misc
    pciutils
    nixos-icons
    colord
    ffmpegthumbnailer
    imagemagick
    rizin
    xcolor
    nodejs
    nodePackages.pnpm
    jq
    socat
    # catimg
    bun

    scrcpy
    mitmproxy
  ];
}
