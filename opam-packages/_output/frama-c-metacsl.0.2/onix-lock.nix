{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  alt-ergo-free = {
    name = "alt-ergo-free";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://alt-ergo.ocamlpro.com/http/alt-ergo-free-2.2.0/alt-ergo-free-2.2.0.tar.gz";
      sha256 = "0j8b49hbjsp2bfich65hzw9mzxpcs50ip41aqvg56caimz3nv01z";
    };
    opam = "${repo}/packages/alt-ergo-free/alt-ergo-free.2.2.0/opam";
    depends = with self; [ camlzip menhir num ocaml ocplib-simplex
                           psmt2-frontend zarith
                           (self.conf-gtksourceview or null)
                           (self.lablgtk or null) ];
    buildDepends = with self; [ conf-autoconf ocaml ];
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
  biniou = {
    name = "biniou";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/biniou/releases/download/1.2.1/biniou-1.2.1.tbz";
      sha256 = "35546c68b1929a8e6d27a3b39ecd17b38303a0d47e65eb9d1480c2061ea84335";
    };
    opam = "${repo}/packages/biniou/biniou.1.2.1/opam";
    depends = with self; [ dune easy-format ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  camlzip = {
    name = "camlzip";
    version = "1.11";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/camlzip/archive/rel111.tar.gz";
      sha256 = "ffbbc5de3e1c13dc0e59272376d232d2ede91b327551063d47fddb74f1d5ed37";
    };
    opam = "${repo}/packages/camlzip/camlzip.1.11/opam";
    depends = with self; [ conf-zlib ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-gnomecanvas = {
    name = "conf-gnomecanvas";
    version = "2";
    opam = "${repo}/packages/conf-gnomecanvas/conf-gnomecanvas.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ gnome2.libgnomecanvas ];
  };
  conf-gtk2 = {
    name = "conf-gtk2";
    version = "1";
    opam = "${repo}/packages/conf-gtk2/conf-gtk2.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ gtk2 ];
  };
  conf-gtksourceview = {
    name = "conf-gtksourceview";
    version = "2";
    opam = "${repo}/packages/conf-gtksourceview/conf-gtksourceview.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ gnome2.gtksourceview gtk2 ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  conf-zlib = {
    name = "conf-zlib";
    version = "1";
    opam = "${repo}/packages/conf-zlib/conf-zlib.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ zlib ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
    depends = with self; [ base-unix dune ocaml ];
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
  easy-format = {
    name = "easy-format";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/easy-format/releases/download/1.3.3/easy-format-1.3.3.tbz";
      sha256 = "eafccae911c26ca23e4ddacee3eaa54654d20f973b8680f84b708cef43adc416";
    };
    opam = "${repo}/packages/easy-format/easy-format.1.3.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  frama-c = {
    name = "frama-c";
    version = "24.0";
    src = pkgs.fetchurl {
      url = "https://frama-c.com/download/frama-c-24.0-Chromium.tar.gz";
      sha256 = "4eeaf1321780a8d88f492fb50a83859a229585e33fa7a5e10dbf49506e7c3d74";
    };
    opam = "${repo}/packages/frama-c/frama-c.24.0/opam";
    depends = with self; [ ocaml ocamlfind ocamlgraph why3 yojson zarith
                           (self.alt-ergo or null)
                           (self.alt-ergo-free or null) (self.apron or null)
                           (self.conf-gnomecanvas or null)
                           (self.conf-gtksourceview or null)
                           (self.conf-gtksourceview3 or null)
                           (self.coq or null) (self.lablgtk or null)
                           (self.lablgtk3-sourceview3 or null)
                           (self.mlgmpidl or null) (self.ocamlgraph or null)
                           (self.ocamlgraph_gtk or null)
                           (self.ppx_deriving or null)
                           (self.ppx_deriving_yojson or null)
                           (self.zmq or null) ];
    buildDepends = with self; [ conf-autoconf ocaml ocamlfind ];
  };
  frama-c-metacsl = {
    name = "frama-c-metacsl";
    version = "0.2";
    src = pkgs.fetchurl {
      url = "https://git.frama-c.com/pub/meta/uploads/dc14a37270cad97e382eb246459839e0/frama-c-metacsl-0.2.tar.gz";
      sha256 = "5fb259f3ffce9c9174d611271bef7af64fb8e354c618e6f3b6e559d26fd15e32";
    };
    opam = "${repo}/packages/frama-c-metacsl/frama-c-metacsl.0.2/opam";
    depends = with self; [ frama-c ocaml why3 (self.conf-swi-prolog or null) ];
    buildDepends = with self; [ ocaml ];
  };
  lablgtk = {
    name = "lablgtk";
    version = "2.18.12";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/lablgtk/archive/2.18.12.tar.gz";
      sha256 = "064vhzk9msck0hlignmiiv5ml2vfbmlnahhcz99a6svddc5n9cj3";
    };
    opam = "${repo}/packages/lablgtk/lablgtk.2.18.12/opam";
    depends = with self; [ ocaml ocamlfind (self.conf-glade or null)
                           (self.conf-gnomecanvas or null)
                           (self.conf-gtksourceview or null)
                           (self.lablgl or null) ];
    buildDepends = with self; [ conf-gtk2 ocaml ocamlfind ];
  };
  menhir = {
    name = "menhir";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhir/menhir.20211128/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20211128/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20211128/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  num = {
    name = "num";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
      sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
    };
    opam = "${repo}/packages/num/num.1.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
  ocamlgraph = {
    name = "ocamlgraph";
    version = "1.8.8";
    src = pkgs.fetchurl {
      url = "http://ocamlgraph.lri.fr/download/ocamlgraph-1.8.8.tar.gz";
      sha256 = "0m9g16wrrr86gw4fz2fazrh8nkqms0n863w7ndcvrmyafgxvxsnr";
    };
    opam = "${repo}/packages/ocamlgraph/ocamlgraph.1.8.8/opam";
    depends = with self; [ ocaml (self.conf-gnomecanvas or null)
                           (self.lablgtk or null) ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ocplib-simplex = {
    name = "ocplib-simplex";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro-Iguernlala/ocplib-simplex/archive/v0.4.tar.gz";
      sha256 = "0y6q4bgly7fisdklriww48aknqf2vg4dphr7wwnd1wh80l4anzg1";
    };
    opam = "${repo}/packages/ocplib-simplex/ocplib-simplex.0.4/opam";
    depends = with self; [ num ocaml ];
    buildDepends = with self; [ conf-autoconf ocaml ocamlfind ];
  };
  psmt2-frontend = {
    name = "psmt2-frontend";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Coquera/psmt2-frontend/archive/0.1.zip";
      sha256 = "0d9zvgszfb8iyg9k2mdwa4xx642jld8cip75wgpijcmjnis544hs";
    };
    opam = "${repo}/packages/psmt2-frontend/psmt2-frontend.0.1/opam";
    depends = with self; [ menhir ocaml ];
    buildDepends = with self; [ conf-autoconf ocaml ocamlfind ];
    depexts = with pkgs; [ unzip ];
  };
  why3 = {
    name = "why3";
    version = "1.4.1";
    src = pkgs.fetchurl {
      url = "https://why3.gitlabpages.inria.fr/releases/why3-1.4.1.tar.gz";
      sha256 = "1rqyypzlvagrn43ykl0c5wxyvnry5fl1ykn3xcvlzgghk96yq3jq";
    };
    opam = "${repo}/packages/why3/why3.1.4.1/opam";
    depends = with self; [ menhir num ocaml (self.camlzip or null)
                           (self.mlmpfr or null) (self.ocamlgraph or null)
                           (self.re or null) (self.sexplib or null)
                           (self.zarith or null) ];
    buildDepends = with self; [ ocaml ocamlfind (self.ppx_deriving or null)
                                (self.ppx_sexp_conv or null) ];
  };
  yojson = {
    name = "yojson";
    version = "1.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/yojson/releases/download/1.7.0/yojson-1.7.0.tbz";
      sha256 = "1iich6323npvvs8r50lkr4pxxqm9mf6w67cnid7jg1j1g5gwcvv5";
    };
    opam = "${repo}/packages/yojson/yojson.1.7.0/opam";
    depends = with self; [ biniou dune easy-format ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  zarith = {
    name = "zarith";
    version = "1.12";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/Zarith/archive/release-1.12.tar.gz";
      sha512 = "8075573ae65579a2606b37dd1b213032a07d220d28c733f9288ae80d36f8a2cc4d91632806df2503c130ea9658dc207ee3a64347c21aa53969050a208f5b2bb4";
    };
    opam = "${repo}/packages/zarith/zarith.1.12/opam";
    depends = with self; [ conf-gmp ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
