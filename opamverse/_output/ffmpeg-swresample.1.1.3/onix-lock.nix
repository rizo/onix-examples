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
  conf-ffmpeg = {
    name = "conf-ffmpeg";
    version = "1";
    opam = "${repo}/packages/conf-ffmpeg/conf-ffmpeg.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ ffmpeg ];
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
  ffmpeg-avcodec = {
    name = "ffmpeg-avcodec";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ffmpeg/archive/v1.1.3.tar.gz";
      sha512 = "63c1866b4f0be99ed4d571c9276cf4f60d67c0c1e6f9bfe5e746c605e0fa17c602293c3deb44c42acc5c3c5fec6066f6aa4101d05ee5cd71f50a3981456b0e02";
    };
    opam = "${repo}/packages/ffmpeg-avcodec/ffmpeg-avcodec.1.1.3/opam";
    depends = with self; [ dune ffmpeg-avutil ocaml ];
    buildDepends = with self; [ conf-ffmpeg conf-pkg-config dune
                                dune-configurator ocaml ];
  };
  ffmpeg-avutil = {
    name = "ffmpeg-avutil";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ffmpeg/archive/v1.1.3.tar.gz";
      sha512 = "63c1866b4f0be99ed4d571c9276cf4f60d67c0c1e6f9bfe5e746c605e0fa17c602293c3deb44c42acc5c3c5fec6066f6aa4101d05ee5cd71f50a3981456b0e02";
    };
    opam = "${repo}/packages/ffmpeg-avutil/ffmpeg-avutil.1.1.3/opam";
    depends = with self; [ base-threads dune ocaml ];
    buildDepends = with self; [ conf-ffmpeg conf-pkg-config dune
                                dune-configurator ocaml ];
  };
  ffmpeg-swresample = {
    name = "ffmpeg-swresample";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ffmpeg/archive/v1.1.3.tar.gz";
      sha512 = "63c1866b4f0be99ed4d571c9276cf4f60d67c0c1e6f9bfe5e746c605e0fa17c602293c3deb44c42acc5c3c5fec6066f6aa4101d05ee5cd71f50a3981456b0e02";
    };
    opam = "${repo}/packages/ffmpeg-swresample/ffmpeg-swresample.1.1.3/opam";
    depends = with self; [ dune ffmpeg-avcodec ffmpeg-avutil ocaml ];
    buildDepends = with self; [ conf-ffmpeg conf-pkg-config dune
                                dune-configurator ocaml ];
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
}
