{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  crypt = {
    name = "crypt";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/vbmithr/ocaml-crypt/archive/1.3.tar.gz";
      sha256 = "0y6shvyaaaiq83f2gclipa9f6dvmlbylwi5hfzbq8wadkym4kipn";
    };
    opam = "${repo}/packages/crypt/crypt.1.3/opam";
    depends = with self; [ ocaml ocaml-makefile ocamlfind ];
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
  ocaml-makefile = {
    name = "ocaml-makefile";
    version = "6.39.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/ocaml-makefile/releases/download/6.39.2/ocaml-makefile-6.39.2.tbz";
      sha256 = "1j08yjvik5yacif5i0rc2axqi13qfw2piwxb3rmjd0grs4idd0ni";
    };
    opam = "${repo}/packages/ocaml-makefile/ocaml-makefile.6.39.2/opam";
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
