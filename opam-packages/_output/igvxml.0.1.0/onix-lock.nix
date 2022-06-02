{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  igvxml = {
    name = "igvxml";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hammerlab/igvxml/archive/0.1.0.tar.gz";
      sha256 = "08rnx99sh4r1xy227412bw5hxr400vyhw42y3rfbggpah4zzwpd3";
    };
    opam = "${repo}/packages/igvxml/igvxml.0.1.0/opam";
    depends = with self; [ cmdliner nonstd ocaml sosa xmlm ];
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
  nonstd = {
    name = "nonstd";
    version = "0.0.3";
    src = pkgs.fetchurl {
      url = "https://bitbucket.org/smondet/nonstd/get/nonstd.0.0.3.tar.gz";
      sha256 = "1gn9pawdqlnnc8qsna17ypik7f686gr86zipiw4srmzb7c293b26";
    };
    opam = "${repo}/packages/nonstd/nonstd.0.0.3/opam";
    depends = with self; [ jbuilder ocaml ocamlfind ];
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
  sosa = {
    name = "sosa";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hammerlab/sosa/archive/sosa.0.3.0.tar.gz";
      sha256 = "0ld377wwqlrkbj9vkpnmms22sa7wqknv2vzgswfy4yr1qpwq6s2p";
    };
    opam = "${repo}/packages/sosa/sosa.0.3.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
