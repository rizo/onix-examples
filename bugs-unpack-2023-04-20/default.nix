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
  overlay = self: super: {
    timedesc-tzdb =
      # https://nixos.org/manual/nixpkgs/stable/#var-stdenv-sourceRoot
      super.timedesc-tzdb.overrideAttrs (attrs: { sourceRoot = "."; });
  };
}
