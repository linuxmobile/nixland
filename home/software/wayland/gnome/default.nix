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
      celluloid
      contrast
      eyedropper
      gnome-solanum
      keypunch
      kooha
      loupe
      muzika
      overskride
      paleta
      paper-plane
      papers
      parabolic
      planify
      resources
      easyeffects

      # Terminal
      (blackbox-terminal.override {sixelSupport = true;})
      lsix

      inkscape
      gimp
    ];
  };
}
