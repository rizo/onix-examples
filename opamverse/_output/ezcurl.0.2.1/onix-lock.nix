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
  conf-libcurl = {
    name = "conf-libcurl";
    version = "2";
    opam = "${repo}/packages/conf-libcurl/conf-libcurl.2/opam";
    depexts = with pkgs; [ curl ];
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
  ezcurl = {
    name = "ezcurl";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ezcurl/archive/v0.2.1.tar.gz";
      sha512 = "c3429bff46980e684d93c7e6b69ea39dd5f56a6f27e5b811e9f8433632ef312d1ff123759fa69aca8508d54f5597dffdaff41f1ab9ef3cf0a83a9ece100d5763";
    };
    opam = "${repo}/packages/ezcurl/ezcurl.0.2.1/opam";
    depends = with self; [ dune ocaml ocurl ];
    buildDepends = with self; [ dune ocaml ];
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
  ocurl = {
    name = "ocurl";
    version = "0.9.2";
    src = pkgs.fetchurl {
      url = "https://ygrek.org/p/release/ocurl/ocurl-0.9.2.tar.gz";
      sha256 = "e0359718c874dacd55c0b596e5dee1d23b4c394b9b5a604f1a6d618217d67763";
    };
    opam = "${repo}/packages/ocurl/ocurl.0.9.2/opam";
    depends = with self; [ base-unix conf-libcurl ocaml (self.lwt or null)
                           (self.lwt_ppx or null) ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
