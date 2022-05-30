{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-librsvg2 = {
    name = "conf-librsvg2";
    version = "0";
    opam = "${repo}/packages/conf-librsvg2/conf-librsvg2.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.epel-release or null) (pkgs.librsvg or null)
                           (pkgs.librsvg +quartz or null)
                           (pkgs.librsvg-dev or null)
                           (pkgs.librsvg-devel or null)
                           (pkgs.librsvg2 or null)
                           (pkgs.librsvg2-dev or null)
                           (pkgs.librsvg2-devel or null)
                           (pkgs.libsrvg2 or null) (pkgs.libxml2 or null) ];
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
