{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${repo}/packages/base-bigarray/base-bigarray.base/opam";
  };
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
  ocamlfind = {
    name = "ocamlfind";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
      sha512 = "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
    };
    opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
    buildDepends = with self; [ ocaml ];
  };
  sundialsml = {
    name = "sundialsml";
    version = "6.1.1p1";
    src = pkgs.fetchurl {
      url = "https://github.com/inria-parkas/sundialsml/archive/refs/tags/v6.1.1p1.tar.gz";
      sha256 = "1wynv37qzn9jz1cfw84knkrrag2qi1c8ak14a1kqivsnxbqvkqkc";
    };
    opam = "${repo}/packages/sundialsml/sundialsml.6.1.1p1/opam";
    depends = with self; [ base-bigarray ocaml (self.mpi or null) ];
    buildDepends = with self; [ conf-sundials ocaml ocamlfind ];
  };
}
