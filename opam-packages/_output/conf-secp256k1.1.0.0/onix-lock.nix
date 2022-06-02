{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-secp256k1 = {
    name = "conf-secp256k1";
    version = "1.0.0";
    opam = "${repo}/packages/conf-secp256k1/conf-secp256k1.1.0.0/opam";
    depexts = with pkgs; [ (pkgs.dev-libs/libsecp256k1 or null)
                           (pkgs.domt4/crypto/secp256k1 or null)
                           (pkgs.libsecp256k1 or null)
                           (pkgs.libsecp256k1-0 or null)
                           (pkgs.libsecp256k1-dev or null)
                           (pkgs.libsecp256k1-devel or null)
                           (pkgs.libsecp256k1-git or null) ];
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
}
