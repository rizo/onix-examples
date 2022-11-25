{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "167ba5cb8c7c31eee1d1a250976615bb50e65f04";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };

in onix.project ./. {
  repositories = [
    "https://github.com/kit-ty-kate/opam-alpha-repository"
    "https://github.com/ocaml/ocaml-beta-repository.git"
    "https://github.com/ocaml/opam-repository.git#fe53d261c062c23d8271f6887702b9bc7459ad2e"
  ];

  resolutions = { "ocaml-variants" = "5.0.0~beta1+options"; };
}
