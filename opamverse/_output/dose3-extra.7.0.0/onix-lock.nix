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
  base64 = {
    name = "base64";
    version = "3.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-base64/releases/download/v3.5.0/base64-v3.5.0.tbz";
      sha256 = "589de9c00578ebfe784198ac9818d3586c474b2316b6cd3e1c46ccb1f62ae3a4";
    };
    opam = "${repo}/packages/base64/base64.3.5.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  camlbz2 = {
    name = "camlbz2";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/irill/camlbz2/-/archive/0.7.0/camlbz2-0.7.0.tar.gz";
      sha256 = "0yn6mfyq7wxbikczx5cap5j8zyjfgmi835z7m5vyn3wg69ys69gp";
    };
    opam = "${repo}/packages/camlbz2/camlbz2.0.7.0/opam";
    depends = with self; [ conf-aclocal conf-autoconf conf-libbz2 ocaml
                           ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  camlzip = {
    name = "camlzip";
    version = "1.11";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/camlzip/archive/rel111.tar.gz";
      sha256 = "ffbbc5de3e1c13dc0e59272376d232d2ede91b327551063d47fddb74f1d5ed37";
    };
    opam = "${repo}/packages/camlzip/camlzip.1.11/opam";
    depends = with self; [ conf-zlib ocaml ];
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
  conf-libbz2 = {
    name = "conf-libbz2";
    version = "1";
    opam = "${repo}/packages/conf-libbz2/conf-libbz2.1/opam";
    depexts = with pkgs; [ (pkgs.bzip2 or null) (pkgs.bzip2-dev or null)
                           (pkgs.bzip2-devel or null)
                           (pkgs.libbz2-dev or null)
                           (pkgs.libbz2-devel or null) ];
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
  conf-zlib = {
    name = "conf-zlib";
    version = "1";
    opam = "${repo}/packages/conf-zlib/conf-zlib.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ zlib ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  cudf = {
    name = "cudf";
    version = "0.9+1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/irill/cudf/-/archive/v0.9/cudf-v0.9.tar.gz";
      sha256 = "1di5d1cbk867cy4xw2igvl87qf0s2d1i4719k634fqvr6ygppp3j";
    };
    opam = "${repo}/packages/cudf/cudf.0.9-1/opam";
    depends = with self; [ ocaml (self.extlib or null)
                           (self.extlib-compat or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  dose3 = {
    name = "dose3";
    version = "7.0.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/irill/dose3/-/archive/7.0.0/dose3-7.0.0.tar.gz";
      sha512 = "98dc4bd28e9f4aa8384be71b31783ae1afac577ea587118b8457b554ffe302c98e83d0098971e6b81803ee5c4f2befe3a98ef196d6b0da8feb4121e982ad5c2f";
    };
    opam = "${repo}/packages/dose3/dose3.7.0.0/opam";
    depends = with self; [ base64 cudf dune extlib ocaml ocamlgraph re
                           stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  dose3-extra = {
    name = "dose3-extra";
    version = "7.0.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/irill/dose3/-/archive/7.0.0/dose3-7.0.0.tar.gz";
      sha512 = "98dc4bd28e9f4aa8384be71b31783ae1afac577ea587118b8457b554ffe302c98e83d0098971e6b81803ee5c4f2befe3a98ef196d6b0da8feb4121e982ad5c2f";
    };
    opam = "${repo}/packages/dose3-extra/dose3-extra.7.0.0/opam";
    depends = with self; [ camlbz2 camlzip dose3 dune extlib ocaml parmap ];
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
  extlib = {
    name = "extlib";
    version = "1.7.8";
    src = pkgs.fetchurl {
      url = "https://ygrek.org/p/release/ocaml-extlib/extlib-1.7.8.tar.gz";
      sha256 = "935ca46843af40dc33306d9cce66163d3733312bf444e969b5a8fa3f3024f85a";
    };
    opam = "${repo}/packages/extlib/extlib.1.7.8/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ base-bytes cppo ocaml ocamlfind ];
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
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  ocamlgraph = {
    name = "ocamlgraph";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
      sha256 = "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
    };
    opam = "${repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
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
  re = {
    name = "re";
    version = "1.10.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-re/releases/download/1.10.4/re-1.10.4.tbz";
      sha256 = "83eb3e4300aa9b1dc7820749010f4362ea83524742130524d78c20ce99ca747c";
    };
    opam = "${repo}/packages/re/re.1.10.4/opam";
    depends = with self; [ dune ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  stdlib-shims = {
    name = "stdlib-shims";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
      sha256 = "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
    };
    opam = "${repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
