{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-nnp = {
    name = "base-nnp";
    version = "base";
    opam = "${repo}/packages/base-nnp/base-nnp.base/opam";
    depends = with self; [ (self.base-domains or null)
                           (self.ocaml-option-nnp or null)
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
  ocaml-option-nnp = {
    name = "ocaml-option-nnp";
    version = "1";
    opam = "${repo}/packages/ocaml-option-nnp/ocaml-option-nnp.1/opam";
  };
}
