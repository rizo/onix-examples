{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  camlpdf = {
    name = "camlpdf";
    version = "2.5";
    src = pkgs.fetchurl {
      url = "https://github.com/johnwhitington/camlpdf/archive/v2.5.zip";
      sha256 = "105z70cn5009pv5ly0hwkzg23p069ay59ypmwr6rlahbz7hvv9j9";
    };
    opam = "${repo}/packages/camlpdf/camlpdf.2.5/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ conf-which ocaml ocamlfind ];
    depexts = with pkgs; [ unzip ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  graphicspdf = {
    name = "graphicspdf";
    version = "2.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/johnwhitington/graphicspdf/archive/v2.2.1.zip";
      sha256 = "0z5jd1xgj1zwfr93cy61s7dzjfx9dqw4mfx7920l1s2j0hjx4rbj";
    };
    opam = "${repo}/packages/graphicspdf/graphicspdf.2.2.1/opam";
    depends = with self; [ camlpdf ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
    depexts = with pkgs; [ unzip ];
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
