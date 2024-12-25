{pkgs, ...}: {
  home.packages = with pkgs; [
    zed-editor
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nixd
    typescript-language-server
  ];

  programs.zsh.shellAliases = {
    zed = "zeditor";
  };
}
