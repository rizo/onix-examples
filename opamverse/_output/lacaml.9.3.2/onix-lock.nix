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
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  conf-blas = {
    name = "conf-blas";
    version = "1";
    opam = "${repo}/packages/conf-blas/conf-blas.1/opam";
    depexts = with pkgs; [ (pkgs.blas or null) (pkgs.blas-devel or null)
                           (pkgs.gcc or null) (pkgs.lapack-dev or null)
                           (pkgs.libblas-dev or null)
                           (pkgs.libblas-devel or null) ];
  };
  conf-lapack = {
    name = "conf-lapack";
    version = "1";
    opam = "${repo}/packages/conf-lapack/conf-lapack.1/opam";
    depexts = with pkgs; [ (pkgs.gcc or null) (pkgs.lapack or null)
                           (pkgs.lapack-dev or null)
                           (pkgs.lapack-devel or null)
                           (pkgs.liblapack-dev or null)
                           (pkgs.liblapack-devel or null) ];
  };
  lacaml = {
    name = "lacaml";
    version = "9.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/lacaml/releases/download/v9.3.2/lacaml-9.3.2.tar.gz";
      sha256 = "111brpil4ymjlgvj3gxlv2a8l81rgkn246jb4q9xy85kc3ril0ha";
    };
    opam = "${repo}/packages/lacaml/lacaml.9.3.2/opam";
    depends = with self; [ base-bigarray base-bytes conf-blas conf-lapack
                           ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
}
