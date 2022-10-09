{ pkgs ? import <nixpkgs> {} }:
rec {
  version = "0.0.5";
  repo = builtins.fetchGit {
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "f3dcd527e82e83facb92cd2727651938cb9fecf9";
  };
  scope = rec {
    base-threads = {
      name = "base-threads";
      version = "base";
    };
    base-unix = {
      name = "base-unix";
      version = "base";
    };
    dune = {
      name = "dune";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      depends = [ base-threads base-unix ocaml ];
      buildDepends = [ ocaml ];
    };
    fmt = {
      name = "fmt";
      version = "0.9.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
        sha512 = "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
      };
      depends = [ base-unix ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    hello-nix-compiler = {
      name = "hello-nix-compiler";
      version = "root";
      src = ./.;
      depends = [ fmt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ocaml = {
      name = "ocaml";
      version = "4.14.0";
      depends = [ ocaml-config ocaml-system ];
    };
    ocaml-config = {
      name = "ocaml-config";
      version = "2";
      depends = [ ocaml-system ];
    };
    ocaml-system = {
      name = "ocaml-system";
      version = "4.14.0";
      depexts = [ pkgs.ocaml-ng.ocamlPackages_4_14.ocaml ];
    };
    ocamlbuild = {
      name = "ocamlbuild";
      version = "0.14.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
        sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    ocamlfind = {
      name = "ocamlfind";
      version = "1.9.5";
      src = pkgs.fetchurl {
        url = "http://download.camlcity.org/download/findlib-1.9.5.tar.gz";
        sha512 = "03514c618a16b02889db997c6c4789b3436b3ad7d974348d2c6dea53eb78898ab285ce5f10297c074bab4fd2c82931a8b7c5c113b994447a44abb30fca74c715";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    topkg = {
      name = "topkg";
      version = "1.0.5";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
        sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
      };
      depends = [ ocaml ocamlbuild ];
      buildDepends = [ ocaml ocamlbuild ocamlfind ];
    };
  };
}
