{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${repo}/packages/base-bigarray/base-bigarray.base/opam";
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
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
  mesh = {
    name = "mesh";
    version = "0.9.5";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/mesh/releases/download/0.9.5/mesh-0.9.5.tbz";
      sha256 = "0akcx5xbh1rvi1640js9f18l9cdd4hz58bxvrpk2plpmzbpnqd8y";
    };
    opam = "${repo}/packages/mesh/mesh.0.9.5/opam";
    depends = with self; [ base-bigarray base-bytes dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mesh-graphics = {
    name = "mesh-graphics";
    version = "0.9.5";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/mesh/releases/download/0.9.5/mesh-0.9.5.tbz";
      sha256 = "0akcx5xbh1rvi1640js9f18l9cdd4hz58bxvrpk2plpmzbpnqd8y";
    };
    opam = "${repo}/packages/mesh-graphics/mesh-graphics.0.9.5/opam";
    depends = with self; [ dune graphics mesh ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
}
