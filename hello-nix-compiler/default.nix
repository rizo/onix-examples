{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
  onix = import ./nix/onix.nix { inherit pkgs ocamlPackages; };
in {
  scope = onix.build { lockFile = ./onix-lock.nix; };

  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#f3dcd527e82e83facb92cd2727651938cb9fecf9";
    resolutions = { "ocaml-system" = "*"; };
  };
}

