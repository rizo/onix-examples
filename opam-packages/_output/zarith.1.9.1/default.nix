{ pkgs ? import <nixpkgs> { } }:

let
  ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;

  onix = import ../../onix.nix { inherit pkgs ocamlPackages; };

  scope = onix.build {
    ocaml = ocamlPackages.ocaml;
    lock = ./onix-lock.nix;
    overrides = {
      zarith = pkg:
        pkg.overrideAttrs (super: {
          # For versions < 1.12
          prePatch = super.prePatch + ''
            test -f ./z_pp.pl && patchShebangs ./z_pp.pl
          '';
        });
    };
  };
in scope.zarith
