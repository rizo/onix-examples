{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  astring = {
    name = "astring";
    version = "0.8.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
      sha256 = "1ykhg9gd3iy7zsgyiy2p9b1wkpqg9irw5pvcqs3sphq71iir4ml6";
    };
    opam = "${repo}/packages/astring/astring.0.8.5/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  notty = {
    name = "notty";
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/notty/releases/download/v0.2.2/notty-0.2.2.tbz";
      sha256 = "1y3hx8zjri3x50nyiqal5gak1sw54gw3xssrqbj7srinvkdmrz1q";
    };
    opam = "${repo}/packages/notty/notty.0.2.2/opam";
    depends = with self; [ ocaml uchar uucp uuseg uutf (self.lwt or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ocb-stubblr topkg ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.13.1";
    opam = "${repo}/packages/ocaml/ocaml.4.13.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.13.1.tar.gz";
      sha256 = "194c7988cc1fd1c64f53f32f2f7551e5309e44d914d6efc7e2e4d002296aeac4";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.13.1/opam";
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
  ocb-stubblr = {
    name = "ocb-stubblr";
    version = "0.1.1+1";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/ocb-stubblr/releases/download/v0.1.1/ocb-stubblr-0.1.1.tbz";
      sha256 = "167b7x1j21mkviq8dbaa0nmk4rps2ilvzwx02igsc2706784z72f";
    };
    opam = "${repo}/packages/ocb-stubblr/ocb-stubblr.0.1.1-1/opam";
    depends = with self; [ astring ocaml ocamlbuild topkg ];
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
  uchar = {
    name = "uchar";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/uchar/releases/download/v0.0.2/uchar-0.0.2.tbz";
      sha256 = "1w2saw7zanf9m9ffvz2lvcxvlm118pws2x1wym526xmydhqpyfa7";
    };
    opam = "${repo}/packages/uchar/uchar.0.0.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  uucp = {
    name = "uucp";
    version = "14.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uucp/releases/uucp-14.0.0.tbz";
      sha512 = "2d0224aed5d5accbb121624898f08598e8c74a2415942f159a54221c0cdac62ed64fc70a039c833e50110cefce77754ada9ac2d58f79a6fc9331135326fe6899";
    };
    opam = "${repo}/packages/uucp/uucp.14.0.0/opam";
    depends = with self; [ ocaml (self.cmdliner or null) (self.uunf or null)
                           (self.uutf or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  uuseg = {
    name = "uuseg";
    version = "14.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uuseg/releases/uuseg-14.0.0.tbz";
      sha512 = "3f089baf95f010663a0c2f060b2911395d9b396f478efb10fd979815f527c9e61e0a70b3192f2e921f59287bfde0da6e25109d4a1825554e2e4a50c0535e97aa";
    };
    opam = "${repo}/packages/uuseg/uuseg.14.0.0/opam";
    depends = with self; [ ocaml uucp (self.cmdliner or null)
                           (self.uutf or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  uutf = {
    name = "uutf";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uutf/releases/uutf-1.0.3.tbz";
      sha512 = "50cc4486021da46fb08156e9daec0d57b4ca469b07309c508d5a9a41e9dbcf1f32dec2ed7be027326544453dcaf9c2534919395fd826dc7768efc6cc4bfcc9f8";
    };
    opam = "${repo}/packages/uutf/uutf.1.0.3/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
}
