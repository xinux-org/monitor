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
}:
pkgs.stdenv.mkDerivation {
  name = "monitor-dev";

  nativeBuildInputs = let
    perl = pkgs.perl.withPackages (ps: with ps; [JSON DateTime HTMLTidy]);
  in
    (with pkgs; [
      # Nix
      nixd
      shfmt
      statix
      deadnix
      alejandra

      # Bash
      shellcheck
      bash-language-server

      # Utils
      coreutils
      curl
      findutils
      gawk
      git
      gnugrep
      gnused
      jq
      recode
    ])
    ++
    # Perl with libraries
    [perl];

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
