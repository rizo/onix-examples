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
  conf-sdl-ttf = {
    name = "conf-sdl-ttf";
    version = "1";
    opam = "${repo}/packages/conf-sdl-ttf/conf-sdl-ttf.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL_ttf or null)
                           (pkgs.libSDL_ttf-devel or null)
                           (pkgs.libsdl-ttf2.0-dev or null)
                           (pkgs.sdl_ttf or null) ];
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
