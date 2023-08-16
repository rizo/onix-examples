{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    onix = {
      url = "github:odis-labs/onix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, onix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        onix' = (builtins.trace
          "${builtins.toJSON (builtins.attrNames onix.packages)}"
          onix.packages.${system}.${"4_14"});

        env = onix'.env {
          path = ./.;
          lock = ./onix-lock.json;
          repo = {
            url = "https://github.com/ocaml/opam-repository.git";
            rev = "03cdcda5b3a74772bd5f92ff9bcfb1b1310ceaf3";
          };
          deps = { "ocaml-system" = "*"; };
        };
      in {
        packages = { default = env.pkgs.hello-nix-compiler-flakes; };
        devShells = {
          x = pkgs.mkShell { nativeBuildInputs = [ pkgs.hello onix' ]; };
        };
      });
}
