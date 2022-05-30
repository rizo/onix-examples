{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${repo}/packages/base-bigarray/base-bigarray.base/opam";
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
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
  coccinelle = {
    name = "coccinelle";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/coccinelle/coccinelle/archive/refs/tags/1.1.1.tar.gz";
      sha512 = "f935aef406d3356a8e3d08fa7dacd6dd8d49aeb3f00668b775a63881b8d8a259acbbaa21348cb32a8a1cc5cf13dcf10d7e871de0f7c0abb6e45eac24e892df98";
    };
    opam = "${repo}/packages/coccinelle/coccinelle.1.1.1/opam";
    depends = with self; [ conf-aclocal conf-autoconf conf-pkg-config
                           conf-python-3 conf-python-3-dev menhir num ocaml
                           ocamlfind parmap pcre pyml stdcompat ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  conf-aclocal = {
    name = "conf-aclocal";
    version = "2";
    opam = "${repo}/packages/conf-aclocal/conf-aclocal.2/opam";
    depends = with self; [ conf-automake ];
  };
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
  conf-libpcre = {
    name = "conf-libpcre";
    version = "1";
    opam = "${repo}/packages/conf-libpcre/conf-libpcre.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libpcre-devel or null)
                           (pkgs.libpcre3-dev or null) (pkgs.pcre or null)
                           (pkgs.pcre-dev or null) (pkgs.pcre-devel or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-python-3 = {
    name = "conf-python-3";
    version = "1.0.0";
    opam = "${repo}/packages/conf-python-3/conf-python-3.1.0.0/opam";
    depexts = with pkgs; [ python3 ];
  };
  conf-python-3-dev = {
    name = "conf-python-3-dev";
    version = "1";
    opam = "${repo}/packages/conf-python-3-dev/conf-python-3-dev.1/opam";
    depexts = with pkgs; [ (pkgs.epel-release or null) (pkgs.python or null)
                           (pkgs.python3 or null) (pkgs.python3-dev or null)
                           (pkgs.python3-devel or null)
                           (pkgs.python38 or null) ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  csexp = {
    name = "csexp";
    version = "1.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-dune/csexp/releases/download/1.5.1/csexp-1.5.1.tbz";
      sha256 = "d605e4065fa90a58800440ef2f33a2d931398bf2c22061a8acb7df845c0aac02";
    };
    opam = "${repo}/packages/csexp/csexp.1.5.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  dune-configurator = {
    name = "dune-configurator";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.3.2.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhir = {
    name = "menhir";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhir/menhir.20220210/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  num = {
    name = "num";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
      sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
    };
    opam = "${repo}/packages/num/num.1.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
  ocamlfind = {
    name = "ocamlfind";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
      sha512 = "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
    };
    opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
    buildDepends = with self; [ ocaml ];
  };
  parmap = {
    name = "parmap";
    version = "1.2.4";
    src = pkgs.fetchurl {
      url = "https://github.com/rdicosmo/parmap/releases/download/1.2.4/parmap-1.2.4.tbz";
      sha256 = "05391212320adc254d968240085a3a790e8e6fda3f71dac0f71baff3b34a6ace";
    };
    opam = "${repo}/packages/parmap/parmap.1.2.4/opam";
    depends = with self; [ base-bigarray base-unix dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  pcre = {
    name = "pcre";
    version = "7.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/pcre-ocaml/releases/download/7.5.0/pcre-7.5.0.tbz";
      sha256 = "671142f40b6d86171cbc067253faadf903019161d57488bd0fb6c5456c2cbd1a";
    };
    opam = "${repo}/packages/pcre/pcre.7.5.0/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-libpcre dune ocaml ];
  };
  pyml = {
    name = "pyml";
    version = "20220325";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/pyml/releases/download/20220325/pyml-20220325.tar.gz";
      sha512 = "462f86478a0131248805cc13d7eb4e5b4259241d9074e5ab00221018b7fe2d023a12ebf7ffcb81211ffca689fb6b065f251bd900e1925c481f98169e652ab6fa";
    };
    opam = "${repo}/packages/pyml/pyml.20220325/opam";
    depends = with self; [ dune ocaml stdcompat (self.utop or null) ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  stdcompat = {
    name = "stdcompat";
    version = "18";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/stdcompat/releases/download/v18/stdcompat-18.tar.gz";
      sha512 = "4323a43d906121951f62ee8da4dec2c3be30540bbdca114096fa3ca655ba05342b429343d0b51df6e8173541e255e3bfe57a047147b27bca1f6bb22a15ce0013";
    };
    opam = "${repo}/packages/stdcompat/stdcompat.18/opam";
    depends = with self; [ ocaml (self.ocamlfind or null)
                           (self.result or null) (self.seq or null)
                           (self.uchar or null) ];
    buildDepends = with self; [ ocaml (self.ocamlfind or null) ];
  };
}
