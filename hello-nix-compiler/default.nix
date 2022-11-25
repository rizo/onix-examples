{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "167ba5cb8c7c31eee1d1a250976615bb50e65f04";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };

in onix.project ./. {
  repositories = [
    "https://github.com/ocaml/opam-repository.git#03cdcda5b3a74772bd5f92ff9bcfb1b1310ceaf3"
  ];
  resolutions = { "ocaml-system" = "*"; };
}
