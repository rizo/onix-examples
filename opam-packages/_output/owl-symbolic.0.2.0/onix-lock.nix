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
    version = "4.12.1";
    opam = "${repo}/packages/ocaml/ocaml.4.12.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.12.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.12.1.tar.gz";
      sha256 = "f5a48a90557cb47ace7b1590fcab1362a1af38629a218350f69c225c57e96a41";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.12.1/opam";
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-protoc = {
    name = "ocaml-protoc";
    version = "2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mransan/ocaml-protoc/archive/2.2.0.tar.gz";
      sha512 = "ee368b2be9ddb40dc3ef15eea7e96af9595c93fc8d92b1ad7f50e018cbda6ed6fc613bf41fcf4729974b2ce9dfbcd78ccbcb8a38d59d17bf4ceb24f581392303";
    };
    opam = "${repo}/packages/ocaml-protoc/ocaml-protoc.2.2/opam";
    depends = with self; [ dune ocaml pbrt stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  owl-base = {
    name = "owl-base";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl/releases/download/0.9.0/owl-0.9.0.tbz";
      sha256 = "1f47c9c447b008e65cbd2a8b3495fcf5ad3de701206be4e6a43aa61f473b795c";
    };
    opam = "${repo}/packages/owl-base/owl-base.0.9.0/opam";
    depends = with self; [ base-bigarray dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  owl-symbolic = {
    name = "owl-symbolic";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/owlbarn/owl_symbolic/releases/download/0.2.0/owl-symbolic-0.2.0.tbz";
      sha256 = "6444401f8bad918b3fb0d09c2cfe4b83e1e8a96a3cdf70fd89577affa7ddddfc";
    };
    opam = "${repo}/packages/owl-symbolic/owl-symbolic.0.2.0/opam";
    depends = with self; [ dune ocaml owl-base ];
    buildDepends = with self; [ dune ocaml ocaml-protoc ];
  };
  pbrt = {
    name = "pbrt";
    version = "2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mransan/ocaml-protoc/archive/2.2.0.tar.gz";
      sha512 = "ee368b2be9ddb40dc3ef15eea7e96af9595c93fc8d92b1ad7f50e018cbda6ed6fc613bf41fcf4729974b2ce9dfbcd78ccbcb8a38d59d17bf4ceb24f581392303";
    };
    opam = "${repo}/packages/pbrt/pbrt.2.2/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
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
