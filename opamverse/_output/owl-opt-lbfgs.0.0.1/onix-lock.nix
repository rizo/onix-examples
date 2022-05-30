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
  conf-gfortran = {
    name = "conf-gfortran";
    version = "0";
    opam = "${repo}/packages/conf-gfortran/conf-gfortran.0/opam";
    depexts = with pkgs; [ (pkgs.gcc or null) (pkgs.gcc-fortran or null)
                           (pkgs.gcc-gfortran or null)
                           (pkgs.gfortran or null) (pkgs.lang/gcc or null) ];
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
  lbfgs = {
    name = "lbfgs";
    version = "0.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/L-BFGS-ocaml/releases/download/0.9.3/lbfgs-0.9.3.tbz";
      sha256 = "6e5cc5b0cda7ce445e09bd7bf0f8e04ab02ce1f8059dd39872993cc4aec91253";
    };
    opam = "${repo}/packages/lbfgs/lbfgs.0.9.3/opam";
    depends = with self; [ base-bigarray base-bytes dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ conf-gfortran cppo dune ocaml ];
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
  owl-opt = {
    name = "owl-opt";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl_opt/archive/v0.0.1.tar.gz";
      sha256 = "0zhkkf413nyzf4mck932r5mz9ycca2l6idzb6f0h1jvr6id80d9f";
    };
    opam = "${repo}/packages/owl-opt/owl-opt.0.0.1/opam";
    depends = with self; [ dune ocaml owl ppx-owl-opt ];
    buildDepends = with self; [ dune ocaml ];
  };
  owl-opt-lbfgs = {
    name = "owl-opt-lbfgs";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl_opt/archive/v0.0.1.tar.gz";
      sha256 = "0zhkkf413nyzf4mck932r5mz9ycca2l6idzb6f0h1jvr6id80d9f";
    };
    opam = "${repo}/packages/owl-opt-lbfgs/owl-opt-lbfgs.0.0.1/opam";
    depends = with self; [ dune lbfgs ocaml owl owl-opt ppx-owl-opt ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx-owl-opt = {
    name = "ppx-owl-opt";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl_opt/archive/v0.0.1.tar.gz";
      sha256 = "0zhkkf413nyzf4mck932r5mz9ycca2l6idzb6f0h1jvr6id80d9f";
    };
    opam = "${repo}/packages/ppx-owl-opt/ppx-owl-opt.0.0.1/opam";
    depends = with self; [ base dune ocaml ppxlib ];
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
}
