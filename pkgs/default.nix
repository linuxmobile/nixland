{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};
      SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
<<<<<<< HEAD
      cosmic-ext-alt = pkgs.callPackage ./cosmic-ext-alt {};
||||||| parent of 870e06f (feat(fonts): added sf-pro mono font)
=======
      SF-Pro-mono = pkgs.callPackage ./SF-Pro-mono {};
>>>>>>> 870e06f (feat(fonts): added sf-pro mono font)
    };
  };
}
