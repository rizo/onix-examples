{ nixpkgs ? import <nixpkgs> { }, overlay ? import ./overlay nixpkgs }:

let
newScope = onixpkgs:
  nixpkgs.lib.callPackageWith ({ inherit nixpkgs; } // onixpkgs);

packages = nixpkgs.lib.makeScope newScope (self: {
    "base-threads" = self.callPackage ./packages/base-threads { };
    "base-unix" = self.callPackage ./packages/base-unix { };
    "conf-gmp" = self.callPackage ./packages/conf-gmp { };
    "conf-m4" = self.callPackage ./packages/conf-m4 { };
    "dune" = self.callPackage ./packages/dune { };
    "example" = self.callPackage ./packages/example { };
    "fmt" = self.callPackage ./packages/fmt { };
    "gmp" = self.callPackage ./packages/gmp { };
    "ocaml" = self.callPackage ./packages/ocaml { };
    "ocaml-config" = self.callPackage ./packages/ocaml-config { };
    "ocaml-system" = nixpkgs.ocaml-ng.ocamlPackages_4_14.ocaml;
    "ocamlbuild" = self.callPackage ./packages/ocamlbuild { };
    "ocamlfind" = self.callPackage ./packages/ocamlfind { };
    "pp" = self.callPackage ./packages/pp { };
    "topkg" = self.callPackage ./packages/topkg { };
    "zarith" = self.callPackage ./packages/zarith { };
});

in packages.overrideScope' overlay
