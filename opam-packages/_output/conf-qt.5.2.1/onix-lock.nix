{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-qt = {
    name = "conf-qt";
    version = "5.2.1";
    opam = "${repo}/packages/conf-qt/conf-qt.5.2.1/opam";
    depexts = with pkgs; [ (pkgs.libqt5-qtbase-common-devel or null)
                           (pkgs.libqt5-qtbase-devel or null)
                           (pkgs.libqt5-qtdeclarative-devel or null)
                           (pkgs.qt-devel or null) (pkgs.qt5 or null)
                           (pkgs.qt5-base or null)
                           (pkgs.qt5-declarative or null)
                           (pkgs.qt5-default or null)
                           (pkgs.qt5-qmake or null)
                           (pkgs.qt5-qtbase-dev or null)
                           (pkgs.qt5-qtbase-devel or null)
                           (pkgs.qt5-qtdeclarative-dev or null)
                           (pkgs.qt5-qtdeclarative-devel or null)
                           (pkgs.qtbase5-dev or null)
                           (pkgs.qtdeclarative5-dev or null) ];
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
