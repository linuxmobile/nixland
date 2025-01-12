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

      inputs.self.packages.${pkgs.system}.SF-Pro
      inputs.self.packages.${pkgs.system}.SF-Pro-mono

      # nerdfonts
      nerd-fonts.symbols-only
      nerd-fonts.geist-mono
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    #
    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        autohint = false;
        style = "full";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };
      defaultFonts = let
        addAll = builtins.mapAttrs (_: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
      in
        addAll {
          serif = ["Noto Sans Serif"];
          sansSerif = ["SF Pro"];
          monospace = ["PragmataPro Mono Liga"];
          emoji = [];
        };
    };
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
