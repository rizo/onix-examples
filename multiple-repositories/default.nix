{ pkgs ? import <nixpkgs> { } }:

let
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "ec732a8cb5bd74854591a2794f9cde84d9f62e96";
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
