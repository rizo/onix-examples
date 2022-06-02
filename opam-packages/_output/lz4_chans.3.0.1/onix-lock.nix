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
  conf-lz4 = {
    name = "conf-lz4";
    version = "1.0.0";
    opam = "${repo}/packages/conf-lz4/conf-lz4.1.0.0/opam";
    depexts = with pkgs; [ (pkgs.liblz4-tool or null) (pkgs.lz4 or null) ];
  };
  dolog = {
    name = "dolog";
    version = "6.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/dolog/archive/v6.0.0.tar.gz";
      sha256 = "0idxs1lnpsh49hvxnrkb3ijybd83phzbxfcichchw511k9ismlia";
    };
    opam = "${repo}/packages/dolog/dolog.6.0.0/opam";
    depends = with self; [ base-unix dune ocaml ];
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
  lz4_chans = {
    name = "lz4_chans";
    version = "3.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/lz4-chans/archive/v3.0.1.tar.gz";
      sha256 = "1i1hpr95hf6a6qxj203shicvc5h5as9h9xjcv92w8k6y88h061z2";
    };
    opam = "${repo}/packages/lz4_chans/lz4_chans.3.0.1/opam";
    depends = with self; [ base-unix conf-lz4 dolog dune ocaml ];
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
}
