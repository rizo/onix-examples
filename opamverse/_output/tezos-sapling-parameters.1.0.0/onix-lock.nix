{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.14.0.tar.gz";
      sha256 = "39f44260382f28d1054c5f9d8bf4753cb7ad64027da792f7938344544da155e8";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.14.0/opam";
  };
  tezos-sapling-parameters = {
    name = "tezos-sapling-parameters";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos-sapling-parameters/-/archive/1.0.0/tezos-sapling-parameters-1.0.0.tar.bz2";
      sha512 = "53b71b7f9313598a00ab8fa41965fe045dec88a01fff4e2ab23d3c9fbb0a01bcb259b1b32c1755c08f904e20cd5f604813d9c3aec94382c329421a6e6162e9dd";
    };
    opam = "${repo}/packages/tezos-sapling-parameters/tezos-sapling-parameters.1.0.0/opam";
  };
}
