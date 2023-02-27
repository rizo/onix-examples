{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/odis-labs/onix.git";
    rev = "a5534a86d3eee96c80c41c3c895407fef06dcc9a";
  }) {
    inherit pkgs;
    verbosity = "info";
  };

in onix.env {
  path = ./.;
  deps = { "ocaml-system" = "*"; };
  opam-lock = ./with-pin-depends-opam-lock.opam.locked;
  flags = {
    test = true;
    doc = true;
    dev-setup = true;
  };
}
