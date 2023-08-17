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
  deps = { "ocaml-base-compiler" = "5.0.0"; };
}
