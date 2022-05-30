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
  prbnmcn-cgrph = {
    name = "prbnmcn-cgrph";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-cgrph/archive/0.0.2.tar.gz";
      sha512 = "72d9a45ed81d2b0c7eec1b25489458298fcb25b6adcf399317aa3d8d7c245a0055b96f17955287f632d0bad2fd6a7fb87a2c93b0883e0d9ba0d738c05b5fe3f8";
    };
    opam = "${repo}/packages/prbnmcn-cgrph/prbnmcn-cgrph.0.0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-dagger = {
    name = "prbnmcn-dagger";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-dagger/archive/0.0.2.tar.gz";
      sha512 = "a0f3f9190b23a408724d24bf47fb5c5fd9b4fdefa4d3b19bbc67117aa20fb7799045d9046a535365772f131947c2bd931d756226a9571fba84201e713a87e8ca";
    };
    opam = "${repo}/packages/prbnmcn-dagger/prbnmcn-dagger.0.0.2/opam";
    depends = with self; [ dune prbnmcn-cgrph pringo ];
    buildDepends = with self; [ dune ];
  };
  pringo = {
    name = "pringo";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/pringo/archive/1.3.tar.gz";
      sha512 = "6a44adbf0980415cc1c899f351add6094b947043000223b58b226f5d0b4d926c8c8cd39c9336f8ccffb565fd5f8bf23263f465dcd3143488f53241f9e9d440b1";
    };
    opam = "${repo}/packages/pringo/pringo.1.3/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
