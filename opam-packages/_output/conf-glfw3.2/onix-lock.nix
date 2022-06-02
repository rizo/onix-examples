{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-glfw3 = {
    name = "conf-glfw3";
    version = "2";
    opam = "${repo}/packages/conf-glfw3/conf-glfw3.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.Mesa-libGL-devel or null)
                           (pkgs.epel-release or null) (pkgs.glfw or null)
                           (pkgs.glfw-dev or null) (pkgs.glfw-devel or null)
                           (pkgs.glfw-x11 or null)
                           (pkgs.libglfw-devel or null)
                           (pkgs.libglfw3-dev or null)
                           (pkgs.mesa-libGL-devel or null)
                           (pkgs.mesagl-devel or null) ];
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
