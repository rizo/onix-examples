{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  # Use this in your code:
  # onix = import (builtins.fetchGit {
  #   url = "https://github.com/odis-labs/onix.git";
  #   rev = "95cb23ec5afc05fcc8c661d77e8cd70b34c7c55a";
  # }) { inherit pkgs ocamlPackages; };

  onix = import ./../onix.nix { inherit pkgs ocamlPackages; };

in onix.project ./. {
  repositories = [
    "https://github.com/kit-ty-kate/opam-alpha-repository#0a81964b3d1e27a6aaf699e3a2153059b77435e2"
    "https://github.com/ocaml/ocaml-beta-repository.git#79aeeadd813bdae424ab53f882f08bee0a4e0b89"
    "https://github.com/ocaml/opam-repository.git#fe53d261c062c23d8271f6887702b9bc7459ad2e"
  ];

  resolutions = { "ocaml-variants" = "5.0.0~beta1+options"; };
}
