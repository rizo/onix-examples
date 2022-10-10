{ pkgs ? import <nixpkgs> {} }:
rec {
  version = "0.0.5";
  repo = builtins.fetchGit {
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "52c72e08d7782967837955f1c50c330a6131721f";
  };
  scope = rec {
    aio = {
      name = "aio";
      version = "0.0.3";
      src = pkgs.fetchurl {
        url = "https://download.ocamlcore.org/libaio-ocaml/libaio-ocaml/1.0/libaio-ocaml_1.0.orig.tar.gz";
        sha256 = "1qgkds55zrradml4f9g94s2czl4rnc9zyzqbl0c4cqidh3k7agdk";
      };
      opam = "${repo}/packages/aio/aio.0.0.3/opam";
      depends = [ ocaml ocamlfind ];
      buildDepends = [ ocaml ocamlfind ];
      depexts = [ (pkgs.libaio-dev or null) ];
    };
    ocaml = {
      name = "ocaml";
      version = "4.14.0";
      opam = "${repo}/packages/ocaml/ocaml.4.14.0/opam";
      depends = [ ocaml-base-compiler ocaml-config ];
    };
    ocaml-base-compiler = {
      name = "ocaml-base-compiler";
      version = "4.14.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/ocaml/archive/4.14.0.tar.gz";
        sha256 = "39f44260382f28d1054c5f9d8bf4753cb7ad64027da792f7938344544da155e8";
      };
      opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.14.0/opam";
    };
    ocaml-config = {
      name = "ocaml-config";
      version = "2";
      opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
      depends = [ ocaml-base-compiler ];
    };
    ocamlfind = {
      name = "ocamlfind";
      version = "1.9.3";
      src = pkgs.fetchurl {
        url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
        sha512 = "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
      };
      opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
  };
}
