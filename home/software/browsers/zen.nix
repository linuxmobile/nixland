{
  inputs,
  pkgs,
  ...
}: let
  # Create a wrapper script for zen-browser with Wayland enabled
  zenWithWayland = pkgs.symlinkJoin {
    name = "zen-browser-wayland";
    paths = [inputs.zen-browser.packages."${pkgs.system}".twilight];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/zen \
        --set MOZ_ENABLE_WAYLAND 1
    '';
  };
in {
  home.packages = [zenWithWayland];
}
