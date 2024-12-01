{
  pkgs,
  ...
}: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zeditor";
  };
in {
  home.packages = with pkgs; [
    zed-fhs
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nixd
    typescript-language-server
  ];
}
