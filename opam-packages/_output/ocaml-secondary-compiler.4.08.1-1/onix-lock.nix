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
  ocaml-secondary-compiler = {
    name = "ocaml-secondary-compiler";
    version = "4.08.1+1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.08.1.tar.gz";
      sha256 = "11fvsm861lr73lk181gl5iczprp8d83fvgc1q6dx8gxqhzad6gmm";
    };
    opam = "${repo}/packages/ocaml-secondary-compiler/ocaml-secondary-compiler.4.08.1-1/opam";
  };
}
