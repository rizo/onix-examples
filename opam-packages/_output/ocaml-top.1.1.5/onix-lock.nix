{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  cmdliner = {
    name = "cmdliner";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
      sha512 = "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
    };
    opam = "${repo}/packages/cmdliner/cmdliner.1.1.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
    version = "1.11.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.11.4/dune-build-info-1.11.4.tbz";
      sha256 = "77cb5f483221b266ded2b85fc84173ae0089a25134a086be922e82c131456ce6";
    };
    opam = "${repo}/packages/dune/dune.1.11.4/opam";
    depends = with self; [ base-threads base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  jbuilder = {
    name = "jbuilder";
    version = "transition";
    opam = "${repo}/packages/jbuilder/jbuilder.transition/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ocaml = {
    name = "ocaml";
    version = "4.10.2";
    opam = "${repo}/packages/ocaml/ocaml.4.10.2/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.10.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.10.2.tar.gz";
      sha256 = "7aa26e0d70f36f0338df92cf5aaeb2704f3443bfe910a3d02a5dca9162f1d866";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.10.2/opam";
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-top = {
    name = "ocaml-top";
    version = "1.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocaml-top/archive/1.1.5.tar.gz";
      sha256 = "1rrlqydwq8gz36fap8j0p88yspklxihfdjdqkgjr197vk7imnjhm";
    };
    opam = "${repo}/packages/ocaml-top/ocaml-top.1.1.5/opam";
    depends = with self; [ conf-gtksourceview jbuilder lablgtk ocaml
                           ocp-indent ocp-index ];
    buildDepends = with self; [ ocaml ocp-pp ];
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
  ocp-indent = {
    name = "ocp-indent";
    version = "1.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-indent/archive/1.8.1.tar.gz";
      sha512 = "565353de333dd44375366fff75e85a6256c3cd9ff52b3db79803141f975e77cda04dfe32f5e0f2d4c82c59be8f04e9c2bf4d066b113b2cdf267f4c3dcfa401da";
    };
    opam = "${repo}/packages/ocp-indent/ocp-indent.1.8.1/opam";
    depends = with self; [ base-bytes cmdliner dune ocaml ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  ocp-index = {
    name = "ocp-index";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-index/archive/refs/tags/1.3.3.tar.gz";
      sha512 = "6360240c951ac64baf9b3736c9a37c41a5ac8c5ddf52e723019fb5ef294e786e245712fd88f408bd8f6881d8741ab152872181062acd81443eec07d1d703e85a";
    };
    opam = "${repo}/packages/ocp-index/ocp-index.1.3.3/opam";
    depends = with self; [ cmdliner dune ocaml ocp-indent re ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  ocp-pp = {
    name = "ocp-pp";
    version = "1.99.19+beta";
    src = pkgs.fetchurl {
      url = "http://github.com/OCamlPro/ocp-build/archive/1.99.20-beta.tar.gz";
      sha256 = "1h236yic5ynhlclnjsdvq5dzdf60x1rwbwbxg376c66s3rllw6xz";
    };
    opam = "${repo}/packages/ocp-pp/ocp-pp.1.99.19-beta/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  re = {
    name = "re";
    version = "1.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-re/releases/download/1.9.0/re-1.9.0.tbz";
      sha256 = "1gas4ky49zgxph3870nffzkr6y41kkpqp4nj38pz1gh49zcf12aj";
    };
    opam = "${repo}/packages/re/re.1.9.0/opam";
    depends = with self; [ dune ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
