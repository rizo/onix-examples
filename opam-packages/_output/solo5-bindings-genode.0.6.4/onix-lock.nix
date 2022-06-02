{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  solo5-bindings-genode = {
    name = "solo5-bindings-genode";
    version = "0.6.4";
    src = pkgs.fetchurl {
      url = "https://github.com/Solo5/solo5/releases/download/v0.6.4/solo5-v0.6.4.tar.gz";
      sha512 = "918f80947f46340c4acd48a7aeac025953971559c8e087194091c1a4d7075dd3b42e39d832faf6bae461683a9a5698903ee8e00d10d61d30419d3158402b14ac";
    };
    opam = "${repo}/packages/solo5-bindings-genode/solo5-bindings-genode.0.6.4/opam";
    depends = with self; [ conf-pkg-config ];
  };
}
