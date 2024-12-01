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
          serif = ["Libertinus Serif"];
          sansSerif = ["SF Pro Rounded"];
          monospace = ["ZedMono Nerd Font"];
          emoji = [];
        };
    };
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
  };
}
