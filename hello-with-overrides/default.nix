{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "95cb23ec5afc05fcc8c661d77e8cd70b34c7c55a";
  # }) { inherit pkgs ocamlPackages; };
  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };

in onix.project ./. {
  repositories = [
    "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f"
  ];
  overrides = self: super: {
    dune = pkgs.dune_3;
    ocaml-base-compiler = ocamlPackages.ocaml;
  };
}
