flake: {pkgs, ...}: let
  system = pkgs.hostPlatform.system;
  base = flake.packages.${system}.default;
in
  pkgs.mkShell {
    inputsFrom = [base];

    packages = let
      perl = pkgs.perl.withPackages (ps: with ps; [JSON DateTime HTMLTidy]);
    in
      (with pkgs; [
        nixd
        statix
        deadnix
        alejandra

        bash-language-server

        coreutils
        findutils
        gawk
        git
        gnugrep
        gnused
        jq
        recode
      ])
      ++ [perl];

    shellHook = ''
      rm -rf result
    '';
  }
