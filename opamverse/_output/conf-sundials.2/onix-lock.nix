{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-sundials = {
    name = "conf-sundials";
    version = "2";
    opam = "${repo}/packages/conf-sundials/conf-sundials.2/opam";
    depexts = with pkgs; [ (pkgs.SuiteSparse_config or null)
                           (pkgs.epel-release or null)
                           (pkgs.lapack-devel or null)
                           (pkgs.libsundials-dev or null)
                           (pkgs.libsundials-serial-dev or null)
                           (pkgs.sci-libs/sundials or null)
                           (pkgs.suitesparse-devel or null)
                           (pkgs.sundials or null)
                           (pkgs.sundials-devel or null) ];
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
