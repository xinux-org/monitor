{
  pkgs ? let
    lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
    nixpkgs = fetchTarball {
      url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
      sha256 = lock.narHash;
    };
  in
    import nixpkgs {overlays = [];},
  ...
}: let
  # Helpful functions
  inherit (pkgs) lib;

  wrapper = script: ''
    wrapProgram $out/bin/${script} \
      --set PATH ${lib.makeBinPath [
      perl
      pkgs.curl
      pkgs.coreutils
      pkgs.findutils
      pkgs.gnumake
      pkgs.gnused
      pkgs.gnugrep
    ]}
  '';

  # Wrapped perl
  perl = pkgs.perl.withPackages (ps: with ps; [JSON DateTime HTMLTidy]);
in
  pkgs.stdenv.mkDerivation rec {
    pname = "monitor";
    version = "0.0.1";

    src = ./src;

    preBuild = ''
      shellcheck ./calculate
      shellcheck ./calculate-and-push
      shellcheck ./make-index
    '';

    buildPhase = ''
      patchShebangs .
    '';

    nativeBuildInputs =
      (with pkgs; [
        shellcheck
        makeWrapper
      ])
      ++ [perl];

    installPhase = ''
      install -Dv calculate $out/bin/calculate
      install -Dv calculate-and-push $out/bin/calculate-and-push
      install -Dv make-index $out/bin/make-index
    '';

    postFixup = ''
      ${wrapper "calculate"}
      ${wrapper "calculate-and-push"}
      ${wrapper "make-index"}
    '';

    meta = with lib; {
      homepage = "https://github.com/xinux-org/monitor";
      description = "Monitoring and storing nix indexes in a repo.";
      licencse = licenses.mit;
      platforms = with platforms; linux ++ darwin;
      mainProgram = "calculate-and-push";
      maintainers = with maintainers; [orzklv];
    };
  }
