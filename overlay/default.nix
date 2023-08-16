{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/odis-labs/onix.git";
    rev = "962c95978864d3b7269354fdf0c8dd548acd191a";
  }) {
    inherit pkgs;
    verbosity = "info";
  };

in onix.env {
  path = ./.;
  overlay = self: super: {
    dune = pkgs.dune_3;
    ocaml-base-compiler = pkgs.ocaml-ng.ocamlPackages.ocaml;
  };
  deps = { ocaml = "4.14.0"; };
}
