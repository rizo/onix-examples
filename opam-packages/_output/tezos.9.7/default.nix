{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_10;

  onix = import ../../onix.nix { inherit pkgs ocamlPackages; };

  scope = onix.build {
    ocaml = ocamlPackages.ocaml;
    lock = ./onix-lock.nix;
  };
in scope.tezos
