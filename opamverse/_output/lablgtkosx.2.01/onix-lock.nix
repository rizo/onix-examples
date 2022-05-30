{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-gtk2 = {
    name = "conf-gtk2";
    version = "1";
    opam = "${repo}/packages/conf-gtk2/conf-gtk2.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ gtk2 ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  lablgtkosx = {
    name = "lablgtkosx";
    version = "2.01";
    src = pkgs.fetchurl {
      url = "https://github.com/pirbo/lablGtkOSXApplication/releases/download/v2.01/lablgtkosx-2.01.tar.bz2";
      sha256 = "0v01k44jf1jkzslv3nh2kb6bd63rad275kfq5qkq13zsxx3a2kqg";
    };
    opam = "${repo}/packages/lablgtkosx/lablgtkosx.2.01/opam";
    depends = with self; [ lablgtk ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ (pkgs.gtk-mac-integration or null) ];
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
