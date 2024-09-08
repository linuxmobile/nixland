{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./browsers/edge.nix
    ./browsers/firefox.nix
    # ./browsers/epiphany.nix
    # ./browsers/qutebrowser.nix
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

    # gnome
    dconf-editor
    file-roller
    nautilus
    # amberol
    # blanket
    # cavalier
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

    inkscape
    # gimp
    scrcpy
  ];
}
