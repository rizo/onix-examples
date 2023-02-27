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
  repos = [
    {
      url = "https://github.com/kit-ty-kate/opam-alpha-repository";
      rev = "cafd5168f52ea965cdfa64d347944c92ca431362";
    }
    {
      url = "https://github.com/ocaml/ocaml-beta-repository.git";
      rev = "79aeeadd813bdae424ab53f882f08bee0a4e0b89";
    }
    {
      url = "https://github.com/ocaml/opam-repository.git";
      rev = "16930bbc587dcc61157036ef31040b5bcd3e52bc";
    }
  ];

  deps = { "ocaml-variants" = "5.1.0+trunk"; };
}
