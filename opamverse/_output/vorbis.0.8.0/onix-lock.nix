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
  conf-libogg = {
    name = "conf-libogg";
    version = "1";
    opam = "${repo}/packages/conf-libogg/conf-libogg.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libogg ];
  };
  conf-libvorbis = {
    name = "conf-libvorbis";
    version = "1";
    opam = "${repo}/packages/conf-libvorbis/conf-libvorbis.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libvorbis ];
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
  ogg = {
    name = "ogg";
    version = "0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ogg/archive/v0.7.1.tar.gz";
      sha512 = "000e4be93c13f6a62dfd1b32d603e61641edae471111393692d5fdfcb7f7610062ad53456e44614c05688179077731e7144337d6efceb855351f1a50c69e3a30";
    };
    opam = "${repo}/packages/ogg/ogg.0.7.1/opam";
    depends = with self; [ conf-libogg conf-pkg-config dune dune-configurator ];
    buildDepends = with self; [ dune ];
  };
  vorbis = {
    name = "vorbis";
    version = "0.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-vorbis/archive/v0.8.0.tar.gz";
      sha512 = "b2d3940492552fdda27785623cc563758aca061fedfdf577ab1ef22fb1958c27af9fe68c1ed7bd5cf323e1a1b7b42cc53ae6d2c09dc6cae7ead37f740d106ba8";
    };
    opam = "${repo}/packages/vorbis/vorbis.0.8.0/opam";
    depends = with self; [ conf-libvorbis conf-pkg-config dune
                           dune-configurator ocaml ogg ];
    buildDepends = with self; [ dune ocaml ];
  };
}
