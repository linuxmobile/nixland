{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = {
      # instant repl with automatic flake loading
      repl = pkgs.callPackage ./repl {};
      SF-Pro = pkgs.callPackage ./SF-Pro {inherit (pkgs) stdenv;};
      SF-Pro-mono = pkgs.callPackage ./SF-Pro-mono {};
    };
  };
}
