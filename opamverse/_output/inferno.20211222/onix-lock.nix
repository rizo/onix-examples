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
  inferno = {
    name = "inferno";
    version = "20211222";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/inferno/-/archive/20211222/archive.tar.gz";
      sha512 = "d00e2c3e3524d4dd3cba98ab6a8f1f9e95c475993c42f24bf4c46ddb527ae74b37ac1fec118a385556dadb733caeaaa071d06e536c91097045439ab39be25e65";
    };
    opam = "${repo}/packages/inferno/inferno.20211222/opam";
    depends = with self; [ dune ocaml pprint ];
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
  pprint = {
    name = "pprint";
    version = "20220103";
    src = pkgs.fetchurl {
      url = "https://github.com/fpottier/pprint/archive/20220103.tar.gz";
      sha512 = "1c4d85e529414dc2d52602fae7e44ca036d2d35e9ce1906fd88b0f8a8d0ba1527042b0e5117fdeb51237b2311020a711065a917cc158b63e2ac932c97fa28406";
    };
    opam = "${repo}/packages/pprint/pprint.20220103/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
