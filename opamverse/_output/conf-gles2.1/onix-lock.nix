{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-gles2 = {
    name = "conf-gles2";
    version = "1";
    opam = "${repo}/packages/conf-gles2/conf-gles2.1/opam";
    depexts = with pkgs; [ (pkgs.Mesa-libGLESv2-devel or null)
                           (pkgs.MesaLib or null)
                           (pkgs.libgles2-mesa-dev or null)
                           (pkgs.mesa or null) (pkgs.mesa-dev or null)
                           (pkgs.mesa-libGLES-devel or null)
                           (pkgs.mesa-libs or null) ];
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
