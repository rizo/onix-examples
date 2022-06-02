{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  ott = {
    name = "ott";
    version = "0.32";
    src = pkgs.fetchurl {
      url = "https://github.com/ott-lang/ott/archive/0.32.tar.gz";
      sha512 = "f38e12c079426c5a460a9ab24e58f098410ceb5ae0284c1719c50f6d7cd88f6b9c4da6beb5425c03f2dc056c7a9cb597f9bf2983abb525e3c003e45858496ad3";
    };
    opam = "${repo}/packages/ott/ott.0.32/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
