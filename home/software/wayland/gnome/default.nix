{
  inputs,
  pkgs,
  ...
}: {
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
      paleta
      paper-plane
      (papers.override {supportNautilus = true;})
      parabolic
      planify
      resources
      newsflash

      # Terminal
      (blackbox-terminal.override {sixelSupport = true;})
      lsix

      inputs.ghostty.packages.${pkgs.system}.default
    ];
  };
}
