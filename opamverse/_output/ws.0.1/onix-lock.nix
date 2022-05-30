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
  base64 = {
    name = "base64";
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-base64/releases/download/v2.3.0/base64-v2.3.0.tbz";
      sha256 = "17dy2mgd8qbjlf0mzxbf0cg2gwy7w2lfxanvpg1s17jxssy1ghks";
    };
    opam = "${repo}/packages/base64/base64.2.3.0/opam";
    depends = with self; [ base-bytes dune ];
    buildDepends = with self; [ dune ];
  };
  bitstring = {
    name = "bitstring";
    version = "3.1.1";
    src = pkgs.fetchurl {
      url = "https://bitbucket.org/thanatonauts/bitstring/get/v3.1.1.tar.gz";
      sha256 = "0bxjf730mij0vvw8kvf4lbxlkv6dqbsdql5vb6nahk3q0akrjwl6";
    };
    opam = "${repo}/packages/bitstring/bitstring.3.1.1/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree stdlib-shims ];
    buildDepends = with self; [ dune ocaml ppx_tools_versioned ];
  };
  containers = {
    name = "containers";
    version = "3.7";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-containers/archive/v3.7.tar.gz";
      sha512 = "70f99a062f7696d4ed7a6336532261c93c49a9858a84a12f7f3d60190a5c664198e70be6281dc7c7932c07325dc9c579ff521367e4c7e083566910ba0f9ea760";
    };
    opam = "${repo}/packages/containers/containers.3.7/opam";
    depends = with self; [ dune dune-configurator either ocaml seq
                           (self.base-threads or null)
                           (self.base-unix or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  either = {
    name = "either";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
      sha256 = "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
    };
    opam = "${repo}/packages/either/either.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
  };
  interface-prime = {
    name = "interface-prime";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dozzman/interface-prime/archive/0.1.tar.gz";
      sha512 = "d4a118fb947baf2b99e9815b34252132d6e5bd3c9f30cb27c58438dd173460bda9815f98e795655e27c50b177dab4cbcf88eae1d07fda25a96767c6b5feb703e";
    };
    opam = "${repo}/packages/interface-prime/interface-prime.0.1/opam";
    depends = with self; [ dune ocaml ];
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
  ppx_deriving = {
    name = "ppx_deriving";
    version = "4.5+1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/archive/v4.5.tar.gz";
      sha512 = "f79153c5231ba1e03a3491fde95ca82ecb62fe05b60a649a374d2fbc5ea5dd9242126de7dfbe917c22fd7077c026c940e18c6b36c5ce0ec4bb6e07f11d2b710b";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.4.5-1/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ppx_derivers
                           ppx_tools result ];
    buildDepends = with self; [ cppo dune ocaml ppxfind ];
  };
  ppx_tools = {
    name = "ppx_tools";
    version = "6.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools/releases/download/6.5/ppx_tools-6.5.tar.gz";
      sha512 = "9f24e5feb9d32a5f038e94db33b6a8ba22ef0f83964bf657ac12fd0d39ae2580769612b1ba8988a56a146e4ae5da99e089bda24a4944b18b1df6e146bb75237b";
    };
    opam = "${repo}/packages/ppx_tools/ppx_tools.6.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
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
  ppxfind = {
    name = "ppxfind";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/jeremiedimino/ppxfind/releases/download/1.4/ppxfind-1.4.tbz";
      sha256 = "98291c69f04f7f7b7cdad1b5d786c70fc595559d4663cc04cb711ac132db4971";
    };
    opam = "${repo}/packages/ppxfind/ppxfind.1.4/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  sha = {
    name = "sha";
    version = "1.15.2";
    src = pkgs.fetchurl {
      url = "https://github.com/djs55/ocaml-sha/releases/download/1.15.2/sha-1.15.2.tbz";
      sha256 = "3fbd57b39a7c40068eb41ae1eccba140938beb5e3806a4cbbd79593b2183ffb7";
    };
    opam = "${repo}/packages/sha/sha.1.15.2/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
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
  ws = {
    name = "ws";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dozzman/ws/archive/0.1.tar.gz";
      sha512 = "729267d7227084cc3214d36b4cb4d61f150586e61349ceba3bce3dd5cfff2f990ecbd153c07a7fa031f0a3cdca6121a2cb5b1e9be143a04c93dec257f5b78229";
    };
    opam = "${repo}/packages/ws/ws.0.1/opam";
    depends = with self; [ base64 bitstring containers dune interface-prime
                           ocaml ppx_deriving sha ];
    buildDepends = with self; [ dune ocaml ];
  };
}
