{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-libjpeg = {
    name = "conf-libjpeg";
    version = "1";
    opam = "${repo}/packages/conf-libjpeg/conf-libjpeg.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.jpeg or null) (pkgs.libjpeg-dev or null)
                           (pkgs.libjpeg-devel or null)
                           (pkgs.libjpeg-turbo or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  glMLite = {
    name = "glMLite";
    version = "0.03.53";
    src = pkgs.fetchurl {
      url = "https://github.com/fccm/glMLite/archive/v0.03.53.tar.gz";
      sha256 = "1zgvvra6z9534x9dqm76bn4m5152h03j6mn5wjzl7npff5iczbyb";
    };
    opam = "${repo}/packages/glMLite/glMLite.0.03.53/opam";
    depends = with self; [ conf-libjpeg ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
    depexts = with pkgs; [ (pkgs.freeglut3-dev or null)
                           (pkgs.homebrew/x11/freeglut or null)
                           (pkgs.libfreeglut-devel or null) ];
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
