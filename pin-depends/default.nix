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
  repos = [{
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "16930bbc587dcc61157036ef31040b5bcd3e52bc";
  }];
  deps = { "ocaml-system" = "*"; };
}
