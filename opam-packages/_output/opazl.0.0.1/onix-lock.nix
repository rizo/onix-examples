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
  bisect_ppx = {
    name = "bisect_ppx";
    version = "2.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/bisect_ppx/archive/2.5.0.tar.gz";
      sha256 = "0z6lylrjprb1vyf8fkdng09yjg763hnddh4n54zgnqi05gbgslxf";
    };
    opam = "${repo}/packages/bisect_ppx/bisect_ppx.2.5.0/opam";
    depends = with self; [ base-unix cmdliner dune ocaml
                           ocaml-migrate-parsetree ppx_tools_versioned ];
    buildDepends = with self; [ dune ocaml ];
  };
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
  csexp = {
    name = "csexp";
    version = "1.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-dune/csexp/releases/download/1.5.1/csexp-1.5.1.tbz";
      sha256 = "d605e4065fa90a58800440ef2f33a2d931398bf2c22061a8acb7df845c0aac02";
    };
    opam = "${repo}/packages/csexp/csexp.1.5.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  dune-configurator = {
    name = "dune-configurator";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.3.2.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  gen = {
    name = "gen";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/gen/archive/v1.0.tar.gz";
      sha512 = "fb4ec2ab35a1aba0dcc8439b11f14a0a785d939f661f505aec88a6f2ca6ca87e14ddfda860d9c180b215190b76690de87040c144582f069224f7e58d37ef48a0";
    };
    opam = "${repo}/packages/gen/gen.1.0/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.12.1";
    opam = "${repo}/packages/ocaml/ocaml.4.12.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.12.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.12.1.tar.gz";
      sha256 = "f5a48a90557cb47ace7b1590fcab1362a1af38629a218350f69c225c57e96a41";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.12.1/opam";
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-migrate-parsetree = {
    name = "ocaml-migrate-parsetree";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-migrate-parsetree/releases/download/v1.8.0/ocaml-migrate-parsetree-v1.8.0.tbz";
      sha256 = "b1c2d176ff1444041f2775786ba605be796e46dfd2acb06c96f35d2bb88b8fb5";
    };
    opam = "${repo}/packages/ocaml-migrate-parsetree/ocaml-migrate-parsetree.1.8.0/opam";
    depends = with self; [ dune ocaml ppx_derivers result ];
    buildDepends = with self; [ dune ocaml ];
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
  opazl = {
    name = "opazl";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://fs.zapashcanon.fr/archive/opazl/opazl-0.0.1.tbz";
      sha256 = "04aef74af0a6fc999996fda0a687821ae4d33d20765ab89a3f5361cb620ca398";
    };
    opam = "${repo}/packages/opazl/opazl.0.0.1/opam";
    depends = with self; [ bisect_ppx dune ocaml sedlex ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_derivers = {
    name = "ppx_derivers";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
      sha256 = "159vqy616ni18mn0dlv8c2y4h7mb4hahwjn53yrr59yyhzhmwndn";
    };
    opam = "${repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_tools_versioned = {
    name = "ppx_tools_versioned";
    version = "5.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools_versioned/archive/5.4.0.tar.gz";
      sha256 = "0sw2676vgbsj133lgs3sl8494fhfldafzvgw4j4dnb1wqwha6pxy";
    };
    opam = "${repo}/packages/ppx_tools_versioned/ppx_tools_versioned.5.4.0/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ];
    buildDepends = with self; [ dune ocaml ];
  };
  result = {
    name = "result";
    version = "1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
      sha256 = "0cpfp35fdwnv3p30a06wd0py3805qxmq3jmcynjc3x2qhlimwfkw";
    };
    opam = "${repo}/packages/result/result.1.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  sedlex = {
    name = "sedlex";
    version = "2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/sedlex/archive/v2.2.tar.gz";
      sha512 = "c38940654d8d2a4b8f627bc9109b0fd983c520d8db05bf4b514ddc05cf50946c086d3558dfced64cc8f2b4eaabc6155426eb44ee6d903e3520ebb65daadf990a";
    };
    opam = "${repo}/packages/sedlex/sedlex.2.2/opam";
    depends = with self; [ dune gen ocaml ocaml-migrate-parsetree
                           ppx_tools_versioned uchar ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
}
