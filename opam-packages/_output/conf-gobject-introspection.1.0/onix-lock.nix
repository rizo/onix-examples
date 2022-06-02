{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-gobject-introspection = {
    name = "conf-gobject-introspection";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/cedlemo/conf-gobject-introspection/archive/1.0.tar.gz";
      sha512 = "532ffac7e3c62695ff97db675fbbcb435285003e30863f1028987b07128d075f692d8353f6c74da23a2e4f104454d34518a79211daedf3248a4f074ffdfa0caf";
    };
    opam = "${repo}/packages/conf-gobject-introspection/conf-gobject-introspection.1.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.gobject-introspection or null)
                           (pkgs.gobject-introspection-dev or null)
                           (pkgs.gobject-introspection-devel or null)
                           (pkgs.libgirepository1.0-dev or null) ];
  };
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
}
