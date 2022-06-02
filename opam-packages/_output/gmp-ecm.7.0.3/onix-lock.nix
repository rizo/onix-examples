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
  conf-libtool = {
    name = "conf-libtool";
    version = "1";
    opam = "${repo}/packages/conf-libtool/conf-libtool.1/opam";
    depexts = with pkgs; [ libtool ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  gmp-ecm = {
    name = "gmp-ecm";
    version = "7.0.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/zimmerma/ecm/-/archive/git-7.0.3/ecm-git-7.0.3.tar.gz";
      sha512 = "106288d764f31e9a8f87efc5a4449b1942b7fd7d81c7a4e2e2367edcf8b35db315da8b4d32cebec618a19d78cfe3330f0e724f1f9cef5231886888c730370f37";
    };
    opam = "${repo}/packages/gmp-ecm/gmp-ecm.7.0.3/opam";
    depends = with self; [ conf-gmp ];
    buildDepends = with self; [ conf-autoconf conf-automake conf-g++
                                conf-libtool ];
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
