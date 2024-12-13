{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
    swww
    libnotify
    wl-clipboard
    cliphist
    socat
  ];
}
