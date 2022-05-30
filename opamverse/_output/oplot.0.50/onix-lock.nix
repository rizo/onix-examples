{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-threads = {
    name = "base-threads";
    version = "base";
    opam = "${repo}/packages/base-threads/base-threads.base/opam";
  };
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${repo}/packages/base-unix/base-unix.base/opam";
  };
  conf-libX11 = {
    name = "conf-libX11";
    version = "1";
    opam = "${repo}/packages/conf-libX11/conf-libX11.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libX11-dev or null)
                           (pkgs.libX11-devel or null) (pkgs.libx11 or null)
                           (pkgs.libx11-dev or null)
                           (pkgs.xorg-libX11 or null) (pkgs.xquartz or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-sdl-image = {
    name = "conf-sdl-image";
    version = "1";
    opam = "${repo}/packages/conf-sdl-image/conf-sdl-image.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL_image or null)
                           (pkgs.libSDL_image-devel or null)
                           (pkgs.libsdl-image1.2-dev or null)
                           (pkgs.sdl_image or null)
                           (pkgs.sdl_image-dev or null) ];
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
  csexp = {
    name = "csexp";
    version = "1.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-dune/csexp/releases/download/1.5.1/csexp-1.5.1.tbz";
      sha256 = "d605e4065fa90a58800440ef2f33a2d931398bf2c22061a8acb7df845c0aac02";
    };
    opam = "${repo}/packages/csexp/csexp.1.5.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune/dune.3.2.0/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.3.2.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  graphics = {
    name = "graphics";
    version = "5.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/graphics/releases/download/5.1.2/graphics-5.1.2.tbz";
      sha256 = "400fd81d23f1cb4146b96979342c247971dd54f5879ffd2f80ec7cd0212e32d4";
    };
    opam = "${repo}/packages/graphics/graphics.5.1.2/opam";
    depends = with self; [ conf-libX11 conf-pkg-config dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  lablgl = {
    name = "lablgl";
    version = "1.06";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/lablgl/archive/v1.06.tar.gz";
      sha256 = "0yka560f9nzmh9sp3rb1wh6q2g031781i8ih5fi182nlvg5m466i";
    };
    opam = "${repo}/packages/lablgl/lablgl.1.06/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ (pkgs.freeglut-dev or null)
                           (pkgs.freeglut-devel or null)
                           (pkgs.freeglut3-dev or null)
                           (pkgs.libglu1-mesa-dev or null)
                           (pkgs.mesa-common-dev or null) ];
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
  ocamlsdl = {
    name = "ocamlsdl";
    version = "0.9.1";
    src = pkgs.fetchurl {
      url = "http://downloads.sourceforge.net/project/ocamlsdl/OCamlSDL/ocamlsdl-0.9.1/ocamlsdl-0.9.1.tar.gz";
      sha256 = "13sgkr87zzp4jdq7g5miqa6dyilblahqxn7xzybixh9x4rdjkyxb";
    };
    opam = "${repo}/packages/ocamlsdl/ocamlsdl.0.9.1/opam";
    depends = with self; [ ocaml ocamlfind (self.conf-sdl-gfx or null)
                           (self.conf-sdl-image or null)
                           (self.conf-sdl-mixer or null)
                           (self.conf-sdl-ttf or null) (self.lablgl or null) ];
    buildDepends = with self; [ ocaml ocamlfind ];
    depexts = with pkgs; [ (pkgs.libsdl1.2-dev or null) (pkgs.sdl or null) ];
  };
  oplot = {
    name = "oplot";
    version = "0.50";
    src = pkgs.fetchurl {
      url = "https://github.com/sanette/oplot/archive/0.50.tar.gz";
      sha512 = "3be56096f79f71ddf91bee0c64ef78b167305ec5c7eacc9cca44b8ac827fbc9c653c5a830ce38b414f68564fed5e7643b4fc6eeb39e5f323cdb2704359736733";
    };
    opam = "${repo}/packages/oplot/oplot.0.50/opam";
    depends = with self; [ conf-sdl-image conf-sdl-ttf dune graphics lablgl
                           ocaml ocamlsdl ];
    buildDepends = with self; [ dune ocaml ];
  };
}
