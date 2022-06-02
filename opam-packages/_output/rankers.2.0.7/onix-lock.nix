{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base = {
    name = "base";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base-v0.15.0.tar.gz";
      sha256 = "8657ae4324a9948457112245c49d97d2da95f157f780f5d97f0b924312a6a53d";
    };
    opam = "${repo}/packages/base/base.v0.15.0/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
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
  batteries = {
    name = "batteries";
    version = "3.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-batteries-team/batteries-included/archive/refs/tags/v3.5.1.tar.gz";
      sha512 = "36c8561079aa9fefc864c2f03bd8ae20aa05987bb67e7a9beac3ab4f440dbf7d44f141c172b05fddb1a5b618fc55a27962bb45fc39bd7b3a15d56e0ed3ff3870";
    };
    opam = "${repo}/packages/batteries/batteries.3.5.1/opam";
    depends = with self; [ num ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  bigarray-compat = {
    name = "bigarray-compat";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/bigarray-compat/releases/download/v1.1.0/bigarray-compat-1.1.0.tbz";
      sha256 = "434469a48d5c84e80d621b13d95eb067f8138c1650a1fd5ae6009a19b93718d5";
    };
    opam = "${repo}/packages/bigarray-compat/bigarray-compat.1.1.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bst = {
    name = "bst";
    version = "7.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/bisec-tree/archive/v7.0.0.tar.gz";
      sha256 = "1zfwi4hf924cm0lac56my4y3xglqng9m127mvh8jxd58f8nbv8mi";
    };
    opam = "${repo}/packages/bst/bst.7.0.0/opam";
    depends = with self; [ batteries dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  camltc = {
    name = "camltc";
    version = "0.9.8";
    src = pkgs.fetchurl {
      url = "https://github.com/toolslive/camltc/releases/download/camltc-0.9.8/camltc-0.9.8.tar.gz";
      sha256 = "1i861d4fiwa11a3f929421hiqlhi22zmq434r83gfl1qx5znqw99";
    };
    opam = "${repo}/packages/camltc/camltc.0.9.8/opam";
    depends = with self; [ dune logs lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-gnuplot = {
    name = "conf-gnuplot";
    version = "0.1";
    opam = "${repo}/packages/conf-gnuplot/conf-gnuplot.0.1/opam";
    depexts = with pkgs; [ (pkgs.gnuplot or null) (pkgs.gnuplot-x11 or null) ];
  };
  conf-graphviz = {
    name = "conf-graphviz";
    version = "0.1";
    opam = "${repo}/packages/conf-graphviz/conf-graphviz.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ (pkgs.graphviz or null)
                           (pkgs.media-gfx/graphviz or null)
                           (pkgs.system:graphviz or null) ];
  };
  conf-nlopt = {
    name = "conf-nlopt";
    version = "1";
    opam = "${repo}/packages/conf-nlopt/conf-nlopt.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.NLopt-devel or null)
                           (pkgs.epel-release or null)
                           (pkgs.libnlopt-dev or null) (pkgs.nlopt or null)
                           (pkgs.nlopt-devel or null) ];
  };
  conf-openblas = {
    name = "conf-openblas";
    version = "0.2.1";
    opam = "${repo}/packages/conf-openblas/conf-openblas.0.2.1/opam";
    depexts = with pkgs; [ (pkgs.cblas or null) (pkgs.epel-release or null)
                           (pkgs.lapack-dev or null) (pkgs.lapacke or null)
                           (pkgs.libc-dev or null)
                           (pkgs.liblapacke-dev or null)
                           (pkgs.libopenblas-dev or null)
                           (pkgs.openblas or null)
                           (pkgs.openblas-dev or null)
                           (pkgs.openblas-devel or null) ];
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
  conf-rdkit = {
    name = "conf-rdkit";
    version = "1";
    opam = "${repo}/packages/conf-rdkit/conf-rdkit.1/opam";
    depexts = with pkgs; [ (pkgs.librdkit-dev or null)
                           (pkgs.python-rdkit or null)
                           (pkgs.python3-rdkit or null)
                           (pkgs.rdkit-devel or null) ];
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
  cpm = {
    name = "cpm";
    version = "12.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/cpmlib/archive/v12.0.0.tar.gz";
      sha256 = "0cxsl73jaf012k08p2yl05m0s9li462cgqkzqxx57vj4j462kskv";
    };
    opam = "${repo}/packages/cpm/cpm.12.0.0/opam";
    depends = with self; [ batteries dune ocaml (self.conf-gnuplot or null) ];
    buildDepends = with self; [ dune ocaml ];
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
  cpu = {
    name = "cpu";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/cpu/archive/v2.0.0.tar.gz";
      sha256 = "1aga2cal07nfqgsfgn41gbdb7dyhj5l4967dq6vzpznrbyp2y09q";
    };
    opam = "${repo}/packages/cpu/cpu.2.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ conf-autoconf dune ocaml ];
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
  ctypes = {
    name = "ctypes";
    version = "0.20.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-ctypes/archive/0.20.1.tar.gz";
      sha256 = "1iwf4yv29zp7sg78qw7jcsiyyk1xbjvjxrsjliay98jjq75imgvq";
    };
    opam = "${repo}/packages/ctypes/ctypes.0.20.1/opam";
    depends = with self; [ bigarray-compat integers ocaml
                           (self.ctypes-foreign or null)
                           (self.mirage-xen or null) ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  dokeysto = {
    name = "dokeysto";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/dokeysto/archive/v4.0.0.tar.gz";
      sha256 = "069h2b5i61905b9dvqnd7zf36zkp0cvx1cic2981jxz80h9ngawn";
    };
    opam = "${repo}/packages/dokeysto/dokeysto.4.0.0/opam";
    depends = with self; [ base-bytes base-unix dune extunix ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dokeysto_camltc = {
    name = "dokeysto_camltc";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/dokeysto/archive/v4.0.0.tar.gz";
      sha256 = "069h2b5i61905b9dvqnd7zf36zkp0cvx1cic2981jxz80h9ngawn";
    };
    opam = "${repo}/packages/dokeysto_camltc/dokeysto_camltc.4.0.0/opam";
    depends = with self; [ camltc dokeysto dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dolog = {
    name = "dolog";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/dolog/archive/v4.0.0.tar.gz";
      sha256 = "00xm60adkwd06xclcz9k5xz214w2raq21s0n01svdh2cjplmfnxx";
    };
    opam = "${repo}/packages/dolog/dolog.4.0.0/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune/dune.2.9.3/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.2.9.3/opam";
    depends = with self; [ csexp dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  eigen = {
    name = "eigen";
    version = "0.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/eigen/releases/download/0.3.2/eigen-0.3.2.tbz";
      sha256 = "30169e1fa1e9128a6a1e21e4f6fc5995d19a5af37296348efce47aecbdc557aa";
    };
    opam = "${repo}/packages/eigen/eigen.0.3.2/opam";
    depends = with self; [ ctypes dune dune-configurator ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  extunix = {
    name = "extunix";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ygrek/extunix/releases/download/v0.4.0/extunix-0.4.0.tbz";
      sha256 = "6814472d982a703ae2b02fa8bc219be69cab12f2db618e4550dd1d6c275633d2";
    };
    opam = "${repo}/packages/extunix/extunix.0.4.0/opam";
    depends = with self; [ base-bigarray base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune dune-configurator ocaml ppxlib ];
    depexts = with pkgs; [ (pkgs.libexecinfo-dev or null) ];
  };
  integers = {
    name = "integers";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-integers/archive/0.7.0.tar.gz";
      sha256 = "11f67v9bijhkbnia7vrdp6sfpyw92kp39kn4p1p2860qkbx1gdcb";
    };
    opam = "${repo}/packages/integers/integers.0.7.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  logs = {
    name = "logs";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/logs/releases/logs-0.7.0.tbz";
      sha256 = "1jnmd675wmsmdwyb5mx5b0ac66g4c6gpv5s4mrx2j6pb0wla1x46";
    };
    opam = "${repo}/packages/logs/logs.0.7.0/opam";
    depends = with self; [ ocaml (self.base-threads or null)
                           (self.cmdliner or null) (self.fmt or null)
                           (self.js_of_ocaml or null) (self.lwt or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  lwt = {
    name = "lwt";
    version = "5.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt/lwt.5.5.0/opam";
    depends = with self; [ dune dune-configurator mmap ocaml ocplib-endian
                           result seq (self.base-threads or null)
                           (self.base-unix or null) (self.conf-libev or null)
                           (self.ocaml or null)
                           (self.ocaml-syntax-shims or null) ];
    buildDepends = with self; [ cppo dune ocaml (self.ocaml or null) ];
  };
  minicli = {
    name = "minicli";
    version = "5.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/minicli/archive/v5.0.2.tar.gz";
      sha256 = "076fpqwg4mwyac23wkjrrzw1rha2bsjzjirlh2gxg0hz5brslq3n";
    };
    opam = "${repo}/packages/minicli/minicli.5.0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mmap = {
    name = "mmap";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mmap/releases/download/v1.2.0/mmap-1.2.0.tbz";
      sha256 = "1602a8abc8e232fa94771a52e540e5780b40c2f2762eee6afbd9286502116ddb";
    };
    opam = "${repo}/packages/mmap/mmap.1.2.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  molenc = {
    name = "molenc";
    version = "11.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/molenc/archive/v11.4.0.tar.gz";
      sha256 = "08a0cxb110cgd2dqxiji1n95qj15h0mklm7wi23sy8xq1136nncj";
    };
    opam = "${repo}/packages/molenc/molenc.11.4.0/opam";
    depends = with self; [ batteries bst conf-graphviz conf-python-3
                           conf-rdkit cpm dokeysto_camltc dolog dune minicli
                           ocaml ocamlgraph owl parany ];
    buildDepends = with self; [ dune ocaml ];
  };
  nlopt-ocaml = {
    name = "nlopt-ocaml";
    version = "0.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mkur/nlopt-ocaml/archive/release-0.5.1.tar.gz";
      sha256 = "0a09nq2laszr5bsiim9jxghbmb1fmmnpznh6p3pcpajlf7fppfis";
    };
    opam = "${repo}/packages/nlopt-ocaml/nlopt-ocaml.0.5.1/opam";
    depends = with self; [ conf-nlopt ocaml ];
    buildDepends = with self; [ oasis ocaml ocamlbuild ocamlfind ];
  };
  npy = {
    name = "npy";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/LaurentMazare/npy-ocaml/archive/0.0.9.tar.gz";
      sha512 = "d682a748fd94d077e763bab259946690aff3b4da5ff374820e79802a49dc6f75ab0d0af3a739a52538453508687c3675a29860ff36c12f2b33a0de59c8ab5b2a";
    };
    opam = "${repo}/packages/npy/npy.0.0.9/opam";
    depends = with self; [ camlzip dune ocaml ];
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
  oasis = {
    name = "oasis";
    version = "0.4.11";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/oasis/oasis/0.4.11/oasis-0.4.11.tar.gz";
      sha256 = "0bn13mzfa98dq3y0jwzzndl55mnywaxv693z6f1rlvpdykp3vdqq";
    };
    opam = "${repo}/packages/oasis/oasis.0.4.11/opam";
    depends = with self; [ base-unix ocaml ocamlbuild
                           (self.benchmark or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ocamlify ocamlmod ];
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
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.12.4";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.4/ocaml-compiler-libs-v0.12.4.tbz";
      sha256 = "4ec9c9ec35cc45c18c7a143761154ef1d7663036a29297f80381f47981a07760";
    };
    opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.4/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ocamlify = {
    name = "ocamlify";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlify/ocamlify/0.0.1/ocamlify-0.0.1.tar.gz";
      sha256 = "1j9nb3vjqbdsx3d6jazixgrh776051zkrc06nsc5q5ilp1jhrwkm";
    };
    opam = "${repo}/packages/ocamlify/ocamlify.0.0.1/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocamlmod = {
    name = "ocamlmod";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlmod/ocamlmod/0.0.9/ocamlmod-0.0.9.tar.gz";
      sha256 = "0cgp9qqrq7ayyhddrmqmq1affvfqcn722qiakjq4dkywvp67h4aa";
    };
    opam = "${repo}/packages/ocamlmod/ocamlmod.0.0.9/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocplib-endian = {
    name = "ocplib-endian";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocplib-endian/archive/refs/tags/1.2.tar.gz";
      sha512 = "2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85";
    };
    opam = "${repo}/packages/ocplib-endian/ocplib-endian.1.2/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  owl = {
    name = "owl";
    version = "1.0.2+1";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl/releases/download/1.0.2/owl-1.0.2.tbz";
      sha256 = "38d210ce6c1c2f09631fd59951430e4f364b5ae036c71ed1b32ce559b2a29263";
    };
    opam = "${repo}/packages/owl/owl.1.0.2-1/opam";
    depends = with self; [ base-bigarray conf-openblas ctypes dune
                           dune-configurator eigen npy ocaml owl-base ];
    buildDepends = with self; [ base dune ocaml stdio ];
  };
  owl-base = {
    name = "owl-base";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl/releases/download/1.0.2/owl-1.0.2.tbz";
      sha256 = "38d210ce6c1c2f09631fd59951430e4f364b5ae036c71ed1b32ce559b2a29263";
    };
    opam = "${repo}/packages/owl-base/owl-base.1.0.2/opam";
    depends = with self; [ base-bigarray dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  parany = {
    name = "parany";
    version = "12.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/parany/archive/v12.2.0.tar.gz";
      sha256 = "1k1xrx7zdgw72ahksdabd7wilds8hjngbc95q4l5wp05gqml6i4k";
    };
    opam = "${repo}/packages/parany/parany.12.2.0/opam";
    depends = with self; [ base-unix cpu dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_derivers = {
    name = "ppx_derivers";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
      sha256 = "159vqy616ni18mn0dlv8c2y4h7mb4hahwjn53yrr59yyhzhmwndn";
    };
    opam = "${repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.26.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.26.0/ppxlib-0.26.0.tbz";
      sha256 = "63117b67ea5863935455fe921f88fe333c0530f0483f730313303a93af817efd";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.26.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs ppx_derivers
                           sexplib0 stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  rankers = {
    name = "rankers";
    version = "2.0.7";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/rankers/archive/v2.0.7.tar.gz";
      sha256 = "014q6k83j21py7qnwdfgdcpv2ain0433v2r1k7zvl7dxiqan06xz";
    };
    opam = "${repo}/packages/rankers/rankers.2.0.7/opam";
    depends = with self; [ base-unix batteries bst conf-gnuplot cpm dolog
                           dune minicli molenc nlopt-ocaml parany ];
    buildDepends = with self; [ dune ];
  };
  result = {
    name = "result";
    version = "1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
      sha256 = "0cpfp35fdwnv3p30a06wd0py3805qxmq3jmcynjc3x2qhlimwfkw";
    };
    opam = "${repo}/packages/result/result.1.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexplib0-v0.15.0.tar.gz";
      sha256 = "94462c00416403d2778493ac01ced5439bc388a68ac4097208159d62434aefba";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/stdio-v0.15.0.tar.gz";
      sha256 = "c37292921dc6a88425f773eba6bdbeac1dedacd1f55917fa4bcd9c4b25795e4b";
    };
    opam = "${repo}/packages/stdio/stdio.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
}
