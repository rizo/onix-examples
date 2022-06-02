{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  afl-persistent = {
    name = "afl-persistent";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/stedolan/ocaml-afl-persistent/archive/v1.3.tar.gz";
      sha256 = "0p8flm9h2qj6fc3j4qn727mkwc5v00kxslcrdcafx9s8jlxw8j0i";
    };
    opam = "${repo}/packages/afl-persistent/afl-persistent.1.3/opam";
    depends = with self; [ base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
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
  monolith = {
    name = "monolith";
    version = "20210525";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/monolith/-/archive/20210525/archive.tar.gz";
      sha512 = "1fd19b5f188bd333f5ae9966da71993bcadbe94b2d150e7e6064caaf0a7a1e6cd822926e0a75d42f7037757a075f2b3f44dd6f1fdfd004c17933d73ea81a7cb2";
    };
    opam = "${repo}/packages/monolith/monolith.20210525/opam";
    depends = with self; [ afl-persistent dune ocaml pprint seq ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
