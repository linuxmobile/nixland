{pkgs, ...}: {
  home.packages = with pkgs; [
    zed-editor
  ];

  programs.zsh.shellAliases = {
    zed = "zeditor";
  };
}
