{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-threads = {
    name = "base-threads";
    version = "base";
    opam = "${repo}/packages/base-threads/base-threads.base/opam";
  };
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${repo}/packages/base-unix/base-unix.base/opam";
  };
  bitwuzla-c = {
    name = "bitwuzla-c";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/bitwuzla/ocaml-bitwuzla/releases/download/1.0.1/bitwuzla-1.0.1.tbz";
      sha256 = "c1414f286c096e6d6a4a0eb4dd7058e6b4b84904a8bc214a0a8e26c8957d40ae";
    };
    opam = "${repo}/packages/bitwuzla-c/bitwuzla-c.1.0.1/opam";
    depends = with self; [ conf-gmp dune ocaml ];
    buildDepends = with self; [ conf-g++ conf-gcc conf-git dune ocaml ];
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
  dune = {
    name = "dune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune/dune.3.2.0/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.14.0";
    opam = "${repo}/packages/ocaml/ocaml.4.14.0/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
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
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
}
