{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  ppx_deriving_madcast = {
    name = "ppx_deriving_madcast";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Niols/ppx_deriving_madcast/archive/v0.1.tar.gz";
      sha256 = "1wji21j8dpc0hyp4a79561crfpvaphj6wg9ap86n2xp7j8z443jj";
    };
    opam = "${repo}/packages/ppx_deriving_madcast/ppx_deriving_madcast.0.1/opam";
    depends = with self; [ jbuilder ocaml ppx_deriving ppx_tools ];
    buildDepends = with self; [ ocaml ppxfind ];
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
}
