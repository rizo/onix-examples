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
  repos = [{
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "9e6ae0a9398cf087ec2b3fbcd62cb6072ccf95ce";
  }];
  deps = {
    "ocaml-system" = "*";
    "pp" = ./vendor/pp/pp.opam;
  };
}
