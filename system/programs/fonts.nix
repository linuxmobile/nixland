{
  pkgs,
  inputs,
  ...
}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # normal fonts
      libertinus
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      roboto

      inputs.self.packages.${pkgs.system}.SF-Pro

      # nerdfonts
      nerd-fonts.zed-mono
      nerd-fonts.symbols-only
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    fontconfig.defaultFonts = let
      addAll = builtins.mapAttrs (_: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
    in
      addAll {
        serif = ["Libertinus Serif"];
        sansSerif = ["SF Pro"];
        monospace = ["ZedMono"];
        emoji = [];
      };
  };
}
