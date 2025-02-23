{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "rose-pine-hyprcursor";

  src = pkgs.fetchFromGitHub {
    owner = "ndom91";
    repo = "rose-pine-hyprcursor";
    rev = "d2c0e6802f0ed1e7c638bb27b5aa8587b578d083";
    sha256 = "sha256-ArUX5qlqAXUqcRqHz4QxXy3KgkfasTPA/Qwf6D2kV0U=";
  };
  
  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out/
  '';
}
