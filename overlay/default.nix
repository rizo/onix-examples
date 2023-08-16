{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "2ba70cf1b11826fd4bd920269dc9613ed427febd";
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
