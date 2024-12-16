{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.homeModules.niri ./config.nix];

  home = {
    packages = with pkgs; [
      seatd
      jaq
    ];
  };
}
