{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/odis-labs/onix.git";
    rev = "2ba70cf1b11826fd4bd920269dc9613ed427febd";
  }) {
    inherit pkgs;
    verbosity = "info";
  };

in onix.env {
  path = ./.;
  deps = { "ocaml-system" = "*"; };
  opam-lock = ./with-pin-depends-opam-lock.opam.locked;
  vars = {
    "with-test" = true;
    "with-doc" = true;
    "with-dev-setup" = true;
  };
}
