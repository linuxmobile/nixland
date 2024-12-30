{
  stdenv,
  lib,
  fetchFromGitHub,
  unzip,
}:
stdenv.mkDerivation rec {
  pname = "SF-Pro-mono";
  version = "v3.0.0";

  src = fetchFromGitHub {
    owner = "shaunsingh";
    repo = "SFMono-Nerd-Font-Ligaturized";
    rev = "main";
    sha256 = "sha256-AYjKrVLISsJWXN6Cj74wXmbJtREkFDYOCRw1t2nVH2w=";
  };

  nativeBuildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype/
  '';

  meta = with lib; {
    description = "Patched SF Mono fonts for programming";
    homepage = "https://github.com/shaunsingh/SFMono-Nerd-Font-Ligaturized";
    license = licenses.mit;
    maintainers = [maintainers.IPconfig];
  };
}
