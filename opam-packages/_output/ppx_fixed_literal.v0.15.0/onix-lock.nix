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
  ppx_fixed_literal = {
    name = "ppx_fixed_literal";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_fixed_literal-v0.15.0.tar.gz";
      sha256 = "f04136ce33f999c08cadb92a17f371b4dcb086a7ae0039e5c2c86b2ce985a9fc";
    };
    opam = "${repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
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
