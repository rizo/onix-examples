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
  coin = {
    name = "coin";
    version = "0.1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/coin/releases/download/v0.1.4/coin-0.1.4.tbz";
      sha256 = "93a97199da5ca20fba02db6a47d70c8362f06fd8019736bc2a3386c635c6c900";
    };
    opam = "${repo}/packages/coin/coin.0.1.4/opam";
    depends = with self; [ dune ocaml re ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
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
  rosetta = {
    name = "rosetta";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/rosetta/releases/download/v0.3.0/rosetta-v0.3.0.tbz";
      sha256 = "dffb638f78af6b03f23b285137538bb2575f67ecddbecab3ee7248b4de284564";
    };
    opam = "${repo}/packages/rosetta/rosetta.0.3.0/opam";
    depends = with self; [ coin dune ocaml uuuu yuscii ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  uuuu = {
    name = "uuuu";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/uuuu/releases/download/v0.3.0/uuuu-0.3.0.tbz";
      sha256 = "6b7ee8f3e343813b0c6ac8ddb7f6720b2ccd27b4208313d3bcff5d7d984fc3a6";
    };
    opam = "${repo}/packages/uuuu/uuuu.0.3.0/opam";
    depends = with self; [ dune ocaml ocamlfind re ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  yuscii = {
    name = "yuscii";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/yuscii/releases/download/v0.3.0/yuscii-v0.3.0.tbz";
      sha256 = "ef8d87ed575d14547326887930f9d8c0a638d35c40889d5aacec79c45d5074b1";
    };
    opam = "${repo}/packages/yuscii/yuscii.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
