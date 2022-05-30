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
  prbnmcn-mcts = {
    name = "prbnmcn-mcts";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-mcts/archive/0.0.1.tar.gz";
      sha512 = "2492e2d420c1d68921f77275db1a1864d99b2dcea6a5b6fb88a91b9a6b90670ef83bc5b11316efeadef5f0c1164f3d854bb6c760e2ccab331e270eea29279313";
    };
    opam = "${repo}/packages/prbnmcn-mcts/prbnmcn-mcts.0.0.1/opam";
    depends = with self; [ dune ocaml prbnmcn-ucb1 ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-ucb1 = {
    name = "prbnmcn-ucb1";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-ucb1/archive/0.0.1.tar.gz";
      sha512 = "eb06575e045e76baf547be094354ae868c2705ae4c9101a3e653d019213b313da10ba35560e792faad2476e79b70541944475a24140b7f55f7b9e51299075486";
    };
    opam = "${repo}/packages/prbnmcn-ucb1/prbnmcn-ucb1.0.0.1/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
  };
}
