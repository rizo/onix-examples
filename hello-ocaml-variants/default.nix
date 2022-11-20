{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "4960c6bb9ba3b8cec1d20b35b290350b1555d188";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };
in {
  scope = onix.build { lockFile = ./onix-lock.nix; };
  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f";
    resolutions = {
      ocaml-variants = "<5.0";
      ocaml-option-flambda = "*";
    };
  };
}
