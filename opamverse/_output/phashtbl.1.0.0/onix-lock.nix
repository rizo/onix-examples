{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-dbm = {
    name = "conf-dbm";
    version = "1.0.0";
    opam = "${repo}/packages/conf-dbm/conf-dbm.1.0.0/opam";
    depexts = with pkgs; [ gdbm ];
  };
  dbm = {
    name = "dbm";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dbm/archive/camldbm-1.3.tar.gz";
      sha256 = "126fd020be0dd13be7e8854fcd3637392ff039c8b865243bb4dad15a954a0da7";
    };
    opam = "${repo}/packages/dbm/dbm.1.3/opam";
    depends = with self; [ conf-dbm ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  jbuilder = {
    name = "jbuilder";
    version = "1.0+beta20.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.0%2Bbeta20.2/jbuilder-1.0+beta20.2.tbz";
      sha256 = "1516rq0x0481bfg9436k1c74346y8nw45shizsnkwylfdj9p8p65";
    };
    opam = "${repo}/packages/jbuilder/jbuilder.1.0+beta20.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  phashtbl = {
    name = "phashtbl";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/phashtbl/archive/v1.0.0.tar.gz";
      sha256 = "04h8l2nfb3h1p1cng2halpjwnj3fpqrf6z5hjwfv08hh379pay8h";
    };
    opam = "${repo}/packages/phashtbl/phashtbl.1.0.0/opam";
    depends = with self; [ dbm jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
