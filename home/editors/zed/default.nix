<<<<<<< HEAD
{
  config,
  pkgs,
  lib,
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
  jsonGenerator = lib.generators.toJSON {};
in {
||||||| parent of 4679ac2 (fix: improved zed)
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
=======
{pkgs, ...}: {
>>>>>>> 4679ac2 (fix: improved zed)
  home.packages = with pkgs; [
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nil
    typescript-language-server
    zed-editor
  ];

  programs.zsh.shellAliases = {
    zed = "zeditor";
  };
}
