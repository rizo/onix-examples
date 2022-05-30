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
  conf-sdl2 = {
    name = "conf-sdl2";
    version = "1";
    opam = "${repo}/packages/conf-sdl2/conf-sdl2.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL2-devel or null)
                           (pkgs.epel-release or null)
                           (pkgs.libSDL2-devel or null)
                           (pkgs.libsdl2-dev or null)
                           (pkgs.libsdl2-devel or null) (pkgs.sdl2 or null)
                           (pkgs.sdl2-dev or null) ];
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
  ocamlfind = {
    name = "ocamlfind";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
      sha512 = "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
    };
    opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
    buildDepends = with self; [ ocaml ];
  };
  ocamlsdl2 = {
    name = "ocamlsdl2";
    version = "0.04";
    src = pkgs.fetchurl {
      url = "https://github.com/fccm/OCamlSDL2/archive/v0.04.tar.gz";
      sha256 = "a48d64d1e53619519e8a16260b06536a59159337561f048281fd9c71b4d113e3";
    };
    opam = "${repo}/packages/ocamlsdl2/ocamlsdl2.0.04/opam";
    depends = with self; [ conf-sdl2 ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ocamlsdl2-image = {
    name = "ocamlsdl2-image";
    version = "0.01";
    src = pkgs.fetchurl {
      url = "https://github.com/fccm/OCamlSDL2_Image/archive/v0.01.tar.gz";
      sha256 = "301b77ba0f413f4a57b5d7470861e29e80bf2cf1fedaf9ce1cd085a6c6c2309e";
    };
    opam = "${repo}/packages/ocamlsdl2-image/ocamlsdl2-image.0.01/opam";
    depends = with self; [ conf-sdl2-image ocaml ocamlsdl2 ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
