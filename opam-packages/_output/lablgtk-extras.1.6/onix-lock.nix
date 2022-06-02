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
  camlp4 = {
    name = "camlp4";
    version = "4.12+1";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp4/camlp4/archive/4.12+1.tar.gz";
      sha256 = "84a53195d916f208b8fd761cbd34cec7882863b94d9df2ce43198d727739cda3";
    };
    opam = "${repo}/packages/camlp4/camlp4.4.12+1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
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
  config-file = {
    name = "config-file";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/MisterDA/config-file/releases/download/release-1.2.1/config-file-release-1.2.1.tbz";
      sha256 = "01d5c5065e5bbd7a8f1ee0659aea1d651a0c81d10117243739b43d7d3084a14b";
    };
    opam = "${repo}/packages/config-file/config-file.1.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ camlp4 cppo dune ocaml ];
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
  lablgtk-extras = {
    name = "lablgtk-extras";
    version = "1.6";
    src = pkgs.fetchurl {
      url = "https://github.com/zoggy/lablgtk-extras/archive/release-1.6.tar.gz";
      sha256 = "1fb400619vmk7z0mgy90zvfknfmnx219km380ckkvcd0bzwzk6if";
    };
    opam = "${repo}/packages/lablgtk-extras/lablgtk-extras.1.6/opam";
    depends = with self; [ conf-gtksourceview config-file lablgtk ocaml
                           ocamlfind xmlm ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.12.1";
    opam = "${repo}/packages/ocaml/ocaml.4.12.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.12.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.12.1.tar.gz";
      sha256 = "f5a48a90557cb47ace7b1590fcab1362a1af38629a218350f69c225c57e96a41";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.12.1/opam";
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
}
