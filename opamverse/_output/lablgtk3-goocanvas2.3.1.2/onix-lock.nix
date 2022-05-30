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
  cairo2 = {
    name = "cairo2";
    version = "0.6.2";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/ocaml-cairo/releases/download/0.6.2/cairo2-0.6.2.tbz";
      sha256 = "6bb3f59225662304fa161b70c6cdbd7df80ee227b1b2e97152873d72726610ae";
    };
    opam = "${repo}/packages/cairo2/cairo2.0.6.2/opam";
    depends = with self; [ base-bigarray conf-cairo dune dune-configurator
                           ocaml (self.conf-freetype or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-cairo = {
    name = "conf-cairo";
    version = "1";
    opam = "${repo}/packages/conf-cairo/conf-cairo.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.cairo or null) (pkgs.cairo-dev or null)
                           (pkgs.cairo-devel or null)
                           (pkgs.graphics/cairo or null)
                           (pkgs.libcairo-devel or null)
                           (pkgs.libcairo2-dev or null) ];
  };
  conf-goocanvas2 = {
    name = "conf-goocanvas2";
    version = "0";
    opam = "${repo}/packages/conf-goocanvas2/conf-goocanvas2.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.epel-release or null)
                           (pkgs.goocanvas or null)
                           (pkgs.goocanvas-devel or null)
                           (pkgs.goocanvas2 or null)
                           (pkgs.goocanvas2-devel or null)
                           (pkgs.libgoocanvas-2.0-dev or null) ];
  };
  conf-gtk3 = {
    name = "conf-gtk3";
    version = "18";
    opam = "${repo}/packages/conf-gtk3/conf-gtk3.18/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.expat or null) (pkgs.gtk+3 or null)
                           (pkgs.gtk+3.0-dev or null) (pkgs.gtk3 or null)
                           (pkgs.gtk3 +quartz or null)
                           (pkgs.gtk3-devel or null)
                           (pkgs.libexpat1-dev or null)
                           (pkgs.libgtk-3-dev or null) ];
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
  lablgtk3 = {
    name = "lablgtk3";
    version = "3.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/lablgtk/archive/3.1.2.tar.gz";
      sha256 = "0s8nbwc5qmc3kw6h3c9x4qkb7k7gw75dik06rjbnawbrby3ifx5d";
    };
    opam = "${repo}/packages/lablgtk3/lablgtk3.3.1.2/opam";
    depends = with self; [ cairo2 dune ocaml ];
    buildDepends = with self; [ conf-gtk3 dune ocaml ];
  };
  lablgtk3-goocanvas2 = {
    name = "lablgtk3-goocanvas2";
    version = "3.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/lablgtk/archive/3.1.2.tar.gz";
      sha256 = "0s8nbwc5qmc3kw6h3c9x4qkb7k7gw75dik06rjbnawbrby3ifx5d";
    };
    opam = "${repo}/packages/lablgtk3-goocanvas2/lablgtk3-goocanvas2.3.1.2/opam";
    depends = with self; [ dune lablgtk3 ocaml ];
    buildDepends = with self; [ conf-goocanvas2 dune ocaml ];
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
