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
    owner = "mosguinz";
    repo = "SFMono-NerdFont";
    rev = "master";
    sha256 = "sha256-xgA33pFp7mNcwPaTUZMQI8Sy89jsDfVlL3Uvb6l53n0=";
  };

  nativeBuildInputs = [unzip];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp *.otf $out/share/fonts/opentype
  '';

  meta = with lib; {
    description = "San Francisco Pro Font Mono";
    homepage = "https://github.com/mosguinz/SFMono-NerdFont";
    license = licenses.mit;
    maintainers = [maintainers.mosguinz];
  };
}
