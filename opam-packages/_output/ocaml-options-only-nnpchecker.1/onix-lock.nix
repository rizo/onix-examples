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
  ocaml-option-nnpchecker = {
    name = "ocaml-option-nnpchecker";
    version = "1";
    opam = "${repo}/packages/ocaml-option-nnpchecker/ocaml-option-nnpchecker.1/opam";
  };
  ocaml-options-only-nnpchecker = {
    name = "ocaml-options-only-nnpchecker";
    version = "1";
    opam = "${repo}/packages/ocaml-options-only-nnpchecker/ocaml-options-only-nnpchecker.1/opam";
    depends = with self; [ ocaml-option-nnpchecker ];
  };
}
