{pkgs, ...}: {
  home.packages = with pkgs; [
<<<<<<< HEAD
    zed-editor
||||||| parent of 4679ac2 (fix: improved zed)
    zed-fhs
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nixd
    typescript-language-server
=======
    nodejs
    biome
    vue-language-server
    vscode-langservers-extracted
    nil
    typescript-language-server
    zed-editor
>>>>>>> 4679ac2 (fix: improved zed)
  ];

  programs.zsh.shellAliases = {
    zed = "zeditor";
  };
}
