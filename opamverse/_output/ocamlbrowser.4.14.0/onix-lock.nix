{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-tcl = {
    name = "conf-tcl";
    version = "1";
    opam = "${repo}/packages/conf-tcl/conf-tcl.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ tcl ];
  };
  conf-tk = {
    name = "conf-tk";
    version = "1";
    opam = "${repo}/packages/conf-tk/conf-tk.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ tk ];
  };
  labltk = {
    name = "labltk";
    version = "8.06.12";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/labltk/archive/refs/tags/8.06.12.tar.gz";
      sha256 = "0w030qarm76nay0flz7gcha5b7vbmv3phc7acwmj3413n5y39q0l";
    };
    opam = "${repo}/packages/labltk/labltk.8.06.12/opam";
    depends = with self; [ conf-tcl conf-tk ocaml ];
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
  ocamlbrowser = {
    name = "ocamlbrowser";
    version = "4.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/garrigue/labltk/archive/refs/tags/8.06.12.tar.gz";
      sha256 = "0w030qarm76nay0flz7gcha5b7vbmv3phc7acwmj3413n5y39q0l";
    };
    opam = "${repo}/packages/ocamlbrowser/ocamlbrowser.4.14.0/opam";
    depends = with self; [ conf-tcl conf-tk labltk ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
