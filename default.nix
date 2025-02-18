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
  lib = pkgs.lib;

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

    nativeBuildInputs = [
      perl
      pkgs.shellcheck
    ];

    installPhase = ''
      install -Dv calculate $out/bin/calculate
      install -Dv calculate-and-push $out/bin/calculate-and-push
      install -Dv make-index $out/bin/make-index
    '';

    meta = with lib; {
      homepage = "https://github.com/xinux-org/monitor";
      description = "Monitoring and storing nix indexes in a repo.";
      licencse = lib.licenses.mit;
      platforms = with platforms; linux ++ darwin;
      mainProgram = "calculate-and-push";
      maintainers = [
        {
          name = "Sokhibjon Orzikulov";
          email = "sakhib@orzklv.uz";
          handle = "orzklv";
          github = "orzklv";
          githubId = 54666588;
          keys = [
            {
              fingerprint = "00D2 7BC6 8707 0683 FBB9  137C 3C35 D3AF 0DA1 D6A8";
            }
          ];
        }
      ];
    };
  }
