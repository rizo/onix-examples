{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  minivpt = {
    name = "minivpt";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/vp-tree/archive/v2.0.0.tar.gz";
      sha256 = "1xy5l9ln2l1gmv25ygax2rf1zxl24spl1qkmzq5bxqzny77y5cl0";
    };
    opam = "${repo}/packages/minivpt/minivpt.2.0.0/opam";
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
