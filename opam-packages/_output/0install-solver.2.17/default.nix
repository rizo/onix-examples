{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  onix = import (builtins.fetchGit {
    url = "https://github.com/odis-labs/onix.git";
    rev = "ec24f411a8c1c7a78ab3e4ec8ab4dec9f14eba20";
  }) { inherit pkgs ocamlPackages; };

  scope = onix.build {
    ocaml = ocamlPackages.ocaml;
    lock = ./onix-lock.nix;
    overrides = { };
    withTools = true;
  };
in scope."0install-solver"
