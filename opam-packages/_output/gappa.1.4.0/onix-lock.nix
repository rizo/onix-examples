{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-automake = {
    name = "conf-automake";
    version = "1";
    opam = "${repo}/packages/conf-automake/conf-automake.1/opam";
    depends = with self; [ conf-autoconf ];
    depexts = with pkgs; [ (pkgs.automake or null)
                           (pkgs.devel/automake or null)
                           (pkgs.sys-devel/automake or null) ];
  };
  conf-bison = {
    name = "conf-bison";
    version = "2";
    opam = "${repo}/packages/conf-bison/conf-bison.2/opam";
    depexts = with pkgs; [ (pkgs.bison or null) (pkgs.devel/bison or null)
                           (pkgs.sys-devel/bison or null) ];
  };
  conf-boost = {
    name = "conf-boost";
    version = "1";
    opam = "${repo}/packages/conf-boost/conf-boost.1/opam";
    depexts = with pkgs; [ boost ];
  };
  conf-flex = {
    name = "conf-flex";
    version = "2";
    opam = "${repo}/packages/conf-flex/conf-flex.2/opam";
    depexts = with pkgs; [ (pkgs.flex or null) (pkgs.sys-devel/flex or null)
                           (pkgs.textproc/flex or null) ];
  };
  conf-g++ = {
    name = "conf-g++";
    version = "1.0";
    opam = "${repo}/packages/conf-g++/conf-g++.1.0/opam";
    depexts = with pkgs; [ gcc ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-mpfr = {
    name = "conf-mpfr";
    version = "3";
    opam = "${repo}/packages/conf-mpfr/conf-mpfr.3/opam";
    buildDepends = with self; [ conf-gmp conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libmpfr-dev or null) (pkgs.mpfr or null)
                           (pkgs.mpfr-dev or null) (pkgs.mpfr-devel or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  gappa = {
    name = "gappa";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/gappa/gappa/-/archive/gappa-1.4.0.tar.gz";
      sha512 = "d5ed841fc8def27ae3973c97d9a242e2fe4997888d3a8c2d46029aab2c5311ec5d0df3a0780fc88eead20d6aa4b34122c9bb8d290f3a2b4886488f34602d43c7";
    };
    opam = "${repo}/packages/gappa/gappa.1.4.0/opam";
    depends = with self; [ conf-boost conf-gmp conf-mpfr ];
    buildDepends = with self; [ conf-autoconf conf-automake conf-bison
                                conf-flex conf-g++ ];
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
