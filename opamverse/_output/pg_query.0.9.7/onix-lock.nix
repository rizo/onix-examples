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
  cmdliner = {
    name = "cmdliner";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
      sha512 = "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
    };
    opam = "${repo}/packages/cmdliner/cmdliner.1.1.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  conf-libffi = {
    name = "conf-libffi";
    version = "2.0.0";
    opam = "${repo}/packages/conf-libffi/conf-libffi.2.0.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libffi ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  ctypes-foreign = {
    name = "ctypes-foreign";
    version = "0.18.0";
    opam = "${repo}/packages/ctypes-foreign/ctypes-foreign.0.18.0/opam";
    depends = with self; [ conf-libffi ];
    buildDepends = with self; [ conf-pkg-config ];
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
  pg_query = {
    name = "pg_query";
    version = "0.9.7";
    src = pkgs.fetchurl {
      url = "https://github.com/roddyyaga/pg_query-ocaml/archive/0.9.7.tar.gz";
      sha512 = "0efa2224ef75f1cea12437673da677964de0d56616e2166e2a794d6f6fd431b44dade1e18455cfeeab12576265f189030df4cd614f764970113476fc036633d2";
    };
    opam = "${repo}/packages/pg_query/pg_query.0.9.7/opam";
    depends = with self; [ cmdliner ctypes ctypes-foreign dune ocaml
                           ppx_deriving ];
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
  ppx_deriving = {
    name = "ppx_deriving";
    version = "5.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/releases/download/v5.2.1/ppx_deriving-v5.2.1.tbz";
      sha256 = "e96b5fb25b7632570e4b329e22e097fcd4b8e8680d1e43ef003a8fbd742b0786";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.5.2.1/opam";
    depends = with self; [ dune ocaml ocamlfind ppx_derivers ppxlib result ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
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
