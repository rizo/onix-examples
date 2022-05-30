{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${repo}/packages/base-unix/base-unix.base/opam";
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
  opam-depext = {
    name = "opam-depext";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-opam/opam-depext/releases/download/v1.2.1/opam-depext-full-1.2.1.tbz";
      sha512 = "a031289ac4e2d4d28bf02b892313b2a0ee724c94f0b7a131b3d9bccc5fbaf2292834d53dd6a0b7134f43bab06ee70bd2c98562fb3a6a03f1a526981290cbf501";
    };
    opam = "${repo}/packages/opam-depext/opam-depext.1.2.1/opam";
    depends = with self; [ base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
