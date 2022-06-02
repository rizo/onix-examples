{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-rust = {
    name = "conf-rust";
    version = "0.1";
    opam = "${repo}/packages/conf-rust/conf-rust.0.1/opam";
    depexts = with pkgs; [ cargo rustc ];
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
  tezos-rust-libs = {
    name = "tezos-rust-libs";
    version = "1.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos-rust-libs/-/archive/v1.1/tezos-rust-libs-v1.1.zip";
      sha512 = "3aaf61288547df2ab6c9b7b092abe507316732da627bc76afda516becd36f02f029ddb96e85470bc58bf5ef703146a633fb0df21b705480dbf4f6f21b08d54eb";
    };
    opam = "${repo}/packages/tezos-rust-libs/tezos-rust-libs.1.1/opam";
    depends = with self; [ conf-rust ];
    depexts = with pkgs; [ unzip ];
  };
}
