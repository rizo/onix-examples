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
  conf-gtksourceview3 = {
    name = "conf-gtksourceview3";
    version = "0+2";
    opam = "${repo}/packages/conf-gtksourceview3/conf-gtksourceview3.0+2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.epel-release or null)
                           (pkgs.gtksourceview-dev or null)
                           (pkgs.gtksourceview-devel or null)
                           (pkgs.gtksourceview3 or null)
                           (pkgs.gtksourceview3 +quartz or null)
                           (pkgs.gtksourceview3-devel or null)
                           (pkgs.gtksourceview3.0 or null)
                           (pkgs.libgtksourceview-3.0-dev or null)
                           (pkgs.libxml2 or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  lablgtk3-extras = {
    name = "lablgtk3-extras";
    version = "3.0.1";
    src = pkgs.fetchurl {
      url = "https://framagit.org/zoggy/lablgtk-extras/-/archive/3.0.1/lablgtk-extras-3.0.1.tar.bz2";
      sha512 = "a14faba4a0bd679311ad7c00fd80bb768727e70c84591af51e880a928a545e51c020d5fb3d51752162aff1525a6cd1606a25199e18c0c368b8d112d253bd7320";
    };
    opam = "${repo}/packages/lablgtk3-extras/lablgtk3-extras.3.0.1/opam";
    depends = with self; [ dune lablgtk3 lablgtk3-sourceview3 ocaml ocf xmlm
                           yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  lablgtk3-sourceview3 = {
    name = "lablgtk3-sourceview3";
    version = "3.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/lablgtk/archive/3.1.2.tar.gz";
      sha256 = "0s8nbwc5qmc3kw6h3c9x4qkb7k7gw75dik06rjbnawbrby3ifx5d";
    };
    opam = "${repo}/packages/lablgtk3-sourceview3/lablgtk3-sourceview3.3.1.2/opam";
    depends = with self; [ dune lablgtk3 ocaml ];
    buildDepends = with self; [ conf-gtksourceview3 dune ocaml ];
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
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  ocf = {
    name = "ocf";
    version = "0.8.0";
    src = pkgs.fetchurl {
      url = "https://framagit.org/zoggy/ocf/-/archive/0.8.0/ocf-0.8.0.tar.gz";
      sha512 = "b9b1ce82ff370222b74429b28748c99b5b78c657e8c8b273d404ba9c17df2cd48274aad4d16b4748ecdbd1402cb8fad4136122cdf617b8ca1d6256a09efe2161";
    };
    opam = "${repo}/packages/ocf/ocf.0.8.0/opam";
    depends = with self; [ dune ocaml yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  xmlm = {
    name = "xmlm";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/xmlm/releases/xmlm-1.4.0.tbz";
      sha512 = "69f6112e6466952256d670fe1751fe4ae79e20d50f018ece1709eb2240cb1b00968ac7cee110771e0617a38ebc1cdb43e9d146471ce66ac1b176e4a1660531eb";
    };
    opam = "${repo}/packages/xmlm/xmlm.1.4.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
}
