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
  dune = {
    name = "dune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune/dune.3.2.0/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  junit = {
    name = "junit";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/Khady/ocaml-junit/releases/download/2.0.2/junit-2.0.2.tbz";
      sha256 = "fda941b653613a4a5731f9b3557364b12baa341daa13c01676c9eb8d64e96b01";
    };
    opam = "${repo}/packages/junit/junit.2.0.2/opam";
    depends = with self; [ dune ptime tyxml ];
    buildDepends = with self; [ dune ];
  };
  junit_ounit = {
    name = "junit_ounit";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/Khady/ocaml-junit/releases/download/2.0.2/junit-2.0.2.tbz";
      sha256 = "fda941b653613a4a5731f9b3557364b12baa341daa13c01676c9eb8d64e96b01";
    };
    opam = "${repo}/packages/junit_ounit/junit_ounit.2.0.2/opam";
    depends = with self; [ dune junit ounit ];
    buildDepends = with self; [ dune ];
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
  ounit = {
    name = "ounit";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit/ounit.2.2.6/opam";
    depends = with self; [ ounit2 ];
    buildDepends = with self; [ ocamlfind ];
  };
  ounit2 = {
    name = "ounit2";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit2/ounit2.2.2.6/opam";
    depends = with self; [ base-bytes base-unix dune ocaml seq stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  ptime = {
    name = "ptime";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/ptime/releases/ptime-1.0.0.tbz";
      sha512 = "df2410d9cc25a33083fe968a584b8fb4d68ad5c077f3356da0a20427e6cd8756a5b946b921e5cf8ed4097f2c506e93345d9dca63b113be644d5a7cc0753d1534";
    };
    opam = "${repo}/packages/ptime/ptime.1.0.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  re = {
    name = "re";
    version = "1.10.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-re/releases/download/1.10.4/re-1.10.4.tbz";
      sha256 = "83eb3e4300aa9b1dc7820749010f4362ea83524742130524d78c20ce99ca747c";
    };
    opam = "${repo}/packages/re/re.1.10.4/opam";
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
  stdlib-shims = {
    name = "stdlib-shims";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
      sha256 = "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
    };
    opam = "${repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  tyxml = {
    name = "tyxml";
    version = "4.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/tyxml/releases/download/4.5.0/tyxml-4.5.0.tbz";
      sha256 = "c69accef5df4dd89d38f6aa0baad01e8fda4e9e98bb7dad61bec1452c5716068";
    };
    opam = "${repo}/packages/tyxml/tyxml.4.5.0/opam";
    depends = with self; [ dune ocaml re seq uutf ];
    buildDepends = with self; [ dune ocaml ];
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
