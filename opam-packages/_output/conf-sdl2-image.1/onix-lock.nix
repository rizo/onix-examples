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
  conf-sdl2-image = {
    name = "conf-sdl2-image";
    version = "1";
    opam = "${repo}/packages/conf-sdl2-image/conf-sdl2-image.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL2_image-devel or null)
                           (pkgs.epel-release or null)
                           (pkgs.libSDL2_image-devel or null)
                           (pkgs.libsdl2-image-dev or null)
                           (pkgs.libsdl2_image-devel or null)
                           (pkgs.sdl2-image or null)
                           (pkgs.sdl2_image or null)
                           (pkgs.sdl2_image-dev or null) ];
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
