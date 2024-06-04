{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./extensions.nix
  ];

  home = {
    packages = with pkgs; [
      amberol
      blanket
      celluloid
      contrast
      eyedropper
      gnome-solanum
      kooha
      loupe
      overskride
      paleta
      paper-plane
      papers
      parabolic
      planify
      resources

      # Terminal
      (blackbox-terminal.override {sixelSupport = true;})
      lsix

      inkscape
      gimp
    ];
  };
}