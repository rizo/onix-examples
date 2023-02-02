{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "95cb23ec5afc05fcc8c661d77e8cd70b34c7c55a";
  # }) { inherit pkgs ocamlPackages; };
  onix = import ./../onix.nix {
    inherit pkgs ocamlPackages;
    verbosity = "debug";
  };

in onix.env {
  path = ./.;
  repo = {
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "f3dcd527e82e83facb92cd2727651938cb9fecf9";
  };
  deps = { "ocaml-system" = "*"; };
}
