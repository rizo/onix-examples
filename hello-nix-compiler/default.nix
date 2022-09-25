{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
  onix = import ./nix/onix.nix { inherit pkgs ocamlPackages; };
in {
  packages = onix.build {
    lockFile = ./onix-lock.nix;
    withTest = false;
    withDoc = false;
    withTools = false;
  };

  lock = onix.lock {
    repoUrl =
      "https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f";
    resolutions = { ocaml-system = "4.14.0"; };
  };
}

