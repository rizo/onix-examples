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
  ounit = {
    name = "ounit";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit/ounit.2.2.6/opam";
    depends = with self; [ ounit2 ];
    buildDepends = with self; [ ocamlfind ];
  };
  ounit2 = {
    name = "ounit2";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit2/ounit2.2.2.6/opam";
    depends = with self; [ base-bytes base-unix dune ocaml seq stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-core = {
    name = "qcheck-core";
    version = "0.14";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/0.14.tar.gz";
      sha256 = "0qlm86wmymaf8ci86ybyhv677iig0l66p9q87fdsnrffryf7rl68";
    };
    opam = "${repo}/packages/qcheck-core/qcheck-core.0.14/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-ounit = {
    name = "qcheck-ounit";
    version = "0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/0.9.tar.gz";
      sha512 = "e1007b4a3be338406d855efcf8d13ac4961963a6c77b794ab83973950e21c777cb66ab6020a0a714f96866597bc8bf7a76a84243e5062dab5b41978e78422e0b";
    };
    opam = "${repo}/packages/qcheck-ounit/qcheck-ounit.0.9/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ounit qcheck-core ];
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
