{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  md2mld = {
    name = "md2mld";
    version = "0.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mseri/md2mld/releases/download/0.5.1/md2mld-0.5.1.tbz";
      sha256 = "c8e7066b28ab70a1dc687a6939a4c6934aef9734c058659b0534168250dee503";
    };
    opam = "${repo}/packages/md2mld/md2mld.0.5.1/opam";
    depends = with self; [ base-bytes dune ocaml omd ];
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
  omd = {
    name = "omd";
    version = "2.0.0+alpha2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/omd/releases/download/2.0.0.alpha2/omd-2.0.0.alpha2.tbz";
      sha256 = "bee39a6fbb5e32efbbc7eb81574f6472d568f2cb37ba93f2de188d4b68fc7396";
    };
    opam = "${repo}/packages/omd/omd.2.0.0~alpha2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  testu01 = {
    name = "testu01";
    version = "1.2.3+0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/LesBoloss-es/ocaml-testu01/archive/1.2.3-0.2.tar.gz";
      sha512 = "9ce7eecf68b50c91586711025e0f06b9531ca7298c5e2796337d8a1eaf13938c7a64343e78b66c7e3b17b39f9623eb6240fffe92bd24eba074e52fd43213d6e5";
    };
    opam = "${repo}/packages/testu01/testu01.1.2.3-0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune md2mld ocaml ];
  };
}
