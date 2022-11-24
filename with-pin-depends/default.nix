{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "4960c6bb9ba3b8cec1d20b35b290350b1555d188";
  # }) { inherit pkgs ocamlPackages; };
  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };

in onix.project ./. {
  repositories = [
    "https://github.com/ocaml/opam-repository.git#03cdcda5b3a74772bd5f92ff9bcfb1b1310ceaf3"
  ];
  resolutions = { "ocaml-system" = "*"; };
}
