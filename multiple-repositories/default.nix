{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "167ba5cb8c7c31eee1d1a250976615bb50e65f04";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };
in {
  scope = onix.build { projectRoot = ./.; };
  lock = onix.lock {
    repositories = [
      "https://github.com/kit-ty-kate/opam-alpha-repository"
      "https://github.com/ocaml/ocaml-beta-repository.git"
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f"
    ];
    resolutions = { "ocaml-system" = "*"; };
  };
}
