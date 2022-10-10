{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
  onix = import ../../onix.nix { inherit pkgs ocamlPackages; };
in {
  scope = onix.build { lockFile = ./onix-lock.nix; };
  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f";
  };
}
