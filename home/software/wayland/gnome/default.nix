{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = with pkgs; [
      amberol
      blanket
      cavalier
      (celluloid.override {youtubeSupport = true;})
      contrast
      easyeffects
      eyedropper
      gnome-solanum
      halftone
      keypunch
      kooha
      letterpress
      loupe
      muzika
      overskride
      paleta
      paper-plane
      (papers.override {supportNautilus = true;})
      parabolic
      planify
      resources

      # Terminal
      (blackbox-terminal.override {sixelSupport = true;})
      lsix
    ];
  };
}
