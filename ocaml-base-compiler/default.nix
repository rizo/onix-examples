{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "00720d8a87daef3bbf66eb89e2b7d8efcaf577aa";
  }) {
    inherit pkgs;
    verbosity = "info";
  };

in onix.env {
  path = ./.;
  repos = [{
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "b239951e2279e4b35b1fcef0a4da819a409faa5d";
  }];
  deps = { "ocaml-base-compiler" = "5.1.1"; };
}
