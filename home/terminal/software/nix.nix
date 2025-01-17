{
  pkgs,
  self,
  ...
}:
# nix tooling
{
  home.packages = with pkgs; [alejandra deadnix statix self.packages.${pkgs.system}.repl];

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };
}
