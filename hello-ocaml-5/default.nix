{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "4960c6bb9ba3b8cec1d20b35b290350b1555d188";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };
in {
  scope = onix.build { projectRoot = ./.; };
  lock = onix.lock {
    repositories = [
      "https://github.com/kit-ty-kate/opam-alpha-repository"
      "https://github.com/ocaml/ocaml-beta-repository.git"
      "https://github.com/ocaml/opam-repository.git#fe53d261c062c23d8271f6887702b9bc7459ad2e"
    ];
    resolutions = { "ocaml-variants" = "5.0.0~beta1+options"; };
  };
}
