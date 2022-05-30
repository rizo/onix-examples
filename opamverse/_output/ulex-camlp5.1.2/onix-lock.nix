{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  camlp5 = {
    name = "camlp5";
    version = "7.14";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/camlp5/archive/rel714.tar.gz";
      sha512 = "1b39949c532ca622b01a8e800aa1dcad34f1c944ffe580003642bd742dedc158f3ee54602f3b05f89c0e259525d7feed101b971ebd589449b6d56046389a5bf6";
    };
    opam = "${repo}/packages/camlp5/camlp5.7.14/opam";
    depends = with self; [ conf-perl ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
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
  ulex-camlp5 = {
    name = "ulex-camlp5";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/sacerdot/ulex/archive/v1.2-camlp5.tar.gz";
      sha512 = "38a45fbb75341b957518447f0cbcd4e36933ba69ce8bf7e314b18cf5af1b809744727a97e6f383eb1d18ad6567de378d1308773ccb1adb6bed0b934c8aa7f1be";
    };
    opam = "${repo}/packages/ulex-camlp5/ulex-camlp5.1.2/opam";
    depends = with self; [ camlp5 ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
}
