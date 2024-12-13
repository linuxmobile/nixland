{pkgs, ...}: {
  imports = [
    ./anyrun
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

    # misc
    ps_mem
    pciutils
    nixos-icons
    colord
    ffmpegthumbnailer
    imagemagick
    cliphist
    nodejs
    nodePackages.pnpm
    catimg
    bun

    nitch
    maxfetch
    netscanner

    # gnome
    dconf-editor
    file-roller
    nautilus
    amberol
    # blanket
    cavalier
    celluloid
    # contrast
    # eyedropper
    # gnome-solanum
    # keypunch
    kooha
    loupe
    overskride
    # paleta
    # paper-plane
    papers
    # parabolic
    # planify
    pwvucontrol
    resources
    gnome-control-center
    

    # inkscape
    # gimp
    scrcpy

    ironbar
    burpsuite
    xwayland-run
  ];
}
