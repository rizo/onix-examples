{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  hashset = {
    name = "hashset";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/hashset/archive/v1.0.0.tar.gz";
      sha256 = "09a4kgn9dy5bczmlriqh1yjm431ci7k46ad6hfyc45mpimcp55ry";
    };
    opam = "${repo}/packages/hashset/hashset.1.0.0/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ obuild ocaml ocamlfind ];
  };
  obuild = {
    name = "obuild";
    version = "0.1.10";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-obuild/obuild/archive/obuild-v0.1.10.tar.gz";
      sha256 = "144pv6hyh1mxn4a7ajvd4riaghfv915kw559v40kx5jwmj312gi4";
    };
    opam = "${repo}/packages/obuild/obuild.0.1.10/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
