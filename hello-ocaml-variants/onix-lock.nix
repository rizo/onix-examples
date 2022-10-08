{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  hello-ocaml-variants = rec {
    name = "hello-ocaml-variants";
    version = "root";
    src = ./.;
    opam = "${src}/hello-ocaml-variants.opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.14.1";
    opam = "${repo}/packages/ocaml/ocaml.4.14.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-option-flambda = {
    name = "ocaml-option-flambda";
    version = "1";
    opam = "${repo}/packages/ocaml-option-flambda/ocaml-option-flambda.1/opam";
  };
  ocaml-variants = {
    name = "ocaml-variants";
    version = "4.14.1+trunk";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.14.tar.gz";
      sha256 = "1cyy2kg7lr0bb886vpsqizydh737h2gjlpgydb6gxrsx797jsw6k";
    };
    opam = "${repo}/packages/ocaml-variants/ocaml-variants.4.14.1+trunk/opam";
    depends = with self; [ (self.ocaml-option-32bit or null)
                           (self.ocaml-option-afl or null)
                           (self.ocaml-option-bytecode-only or null)
                           (self.ocaml-option-default-unsafe-string or null)
                           (self.ocaml-option-flambda or null)
                           (self.ocaml-option-fp or null)
                           (self.ocaml-option-musl or null)
                           (self.ocaml-option-nnp or null)
                           (self.ocaml-option-nnpchecker or null)
                           (self.ocaml-option-no-flat-float-array or null)
                           (self.ocaml-option-static or null) ];
  };
}
