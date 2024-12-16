{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.homeModules.niri ./config.nix ./scripts/start-cosmic-ext.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
    ];
  };
}
