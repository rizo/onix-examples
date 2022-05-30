{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-libogg = {
    name = "conf-libogg";
    version = "1";
    opam = "${repo}/packages/conf-libogg/conf-libogg.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libogg ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  ogg = {
    name = "ogg";
    version = "0.6.1";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ogg/releases/download/v0.6.1/ocaml-ogg-0.6.1.tar.gz";
      sha512 = "e4edb0f8b595d1e7997f2a639dfff0767eb7d0f8df914e421ebbf7ac6fd5dfa607de3e73c3708745749241341735926d3566490134a97179e992f1ad9aa24af2";
    };
    opam = "${repo}/packages/ogg/ogg.0.6.1/opam";
    depends = with self; [ conf-libogg conf-pkg-config ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  schroedinger = {
    name = "schroedinger";
    version = "0.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-schroedinger/releases/download/0.1.1/ocaml-schroedinger-0.1.1.tar.gz";
      sha256 = "1r5snhzsnfhbpwrsz0rgi238z76bsnkkgxfbq184p354f6dblr4b";
    };
    opam = "${repo}/packages/schroedinger/schroedinger.0.1.1/opam";
    depends = with self; [ ocaml ocamlfind ogg ];
    buildDepends = with self; [ ocaml ocamlfind ];
    depexts = with pkgs; [ (pkgs.libschroedinger-dev or null)
                           (pkgs.schroedinger or null) ];
  };
}
