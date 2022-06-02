{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  bitwuzla-bin = {
    name = "bitwuzla-bin";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/bitwuzla/ocaml-bitwuzla/releases/download/1.0.0/bitwuzla-1.0.0.tbz";
      sha256 = "004ccb630a070829fedcbaf071fc50f5c7df2e5f47d2016e228ab775df6961d8";
    };
    opam = "${repo}/packages/bitwuzla-bin/bitwuzla-bin.1.0.0/opam";
    buildDepends = with self; [ conf-cmake conf-g++ conf-gcc conf-git
                                conf-gmp ];
  };
  conf-cmake = {
    name = "conf-cmake";
    version = "1";
    opam = "${repo}/packages/conf-cmake/conf-cmake.1/opam";
    depexts = with pkgs; [ (pkgs.cmake or null) (pkgs.cmake3 or null)
                           (pkgs.dev-util/cmake or null)
                           (pkgs.devel/cmake or null)
                           (pkgs.epel-release or null)
                           (pkgs.system:cmake or null) ];
  };
  conf-g++ = {
    name = "conf-g++";
    version = "1.0";
    opam = "${repo}/packages/conf-g++/conf-g++.1.0/opam";
    depexts = with pkgs; [ gcc ];
  };
  conf-gcc = {
    name = "conf-gcc";
    version = "1.0";
    opam = "${repo}/packages/conf-gcc/conf-gcc.1.0/opam";
    depexts = with pkgs; [ gcc ];
  };
  conf-git = {
    name = "conf-git";
    version = "1.1";
    opam = "${repo}/packages/conf-git/conf-git.1.1/opam";
    depexts = with pkgs; [ git ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
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
}
