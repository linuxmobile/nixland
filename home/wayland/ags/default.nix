{ pkgs
, lib
, config
, inputs
, ...
}: {
  home.packages = with pkgs; [
    sassc
    swww
    inotify-tools
    dart-sass
  ];
  programs.ags.enable = true;
}
