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
  repos = [
    { url = "https://github.com/kit-ty-kate/opam-alpha-repository"; }
    { url = "https://github.com/ocaml/ocaml-beta-repository.git"; }
    {
      url = "https://github.com/ocaml/opam-repository.git";
      rev = "52c72e08d7782967837955f1c50c330a6131721f";
    }
  ];
  deps = { "ocaml-system" = "*"; };
}
