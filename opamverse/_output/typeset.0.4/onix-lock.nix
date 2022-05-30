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
  cps_toolbox = {
    name = "cps_toolbox";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/soren-n/cps-toolbox/archive/0.3.tar.gz";
      sha512 = "1dea5c679bc6c95c6c7a288618a2ffd00ad4d8538d977ba5441d9f86d37098b75d005077fd5f06bd3fb38f4da80387e762c42f6d28bb63ffa48e8bb104b9f74f";
    };
    opam = "${repo}/packages/cps_toolbox/cps_toolbox.0.3/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
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
  typeset = {
    name = "typeset";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/soren-n/typeset-ocaml/archive/0.4.tar.gz";
      sha512 = "f0a284e5508c00917ac05e4da924884f34b99a2a6a4c7d2afaad4af3efd6b30521fa35943610689f90a3f9dac8d856938736cd641d5bad336d2a64fca38cd54a";
    };
    opam = "${repo}/packages/typeset/typeset.0.4/opam";
    depends = with self; [ cps_toolbox dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
