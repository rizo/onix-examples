{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${repo}/packages/base-unix/base-unix.base/opam";
  };
  broken = {
    name = "broken";
    version = "0.4.2";
    src = pkgs.fetchurl {
      url = "https://github.com/michipili/broken/releases/download/v0.4.2/broken-0.4.2.tar.xz";
      sha256 = "0s2kbjzj87kdjcyp27pcfm6bl7sa8rqzdxajrwbgp7gb2bp80vi6";
    };
    opam = "${repo}/packages/broken/broken.0.4.2/opam";
    depends = with self; [ base-unix bsdowl conf-bmake conf-cpio ocaml
                           ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  bsdowl = {
    name = "bsdowl";
    version = "3.0.0+20150830";
    src = pkgs.fetchurl {
      url = "https://github.com/michipili/bsdowl/releases/download/v3.0.0-20150830/bsdowl-3.0.0-20150830.tar.gz";
      sha256 = "17z0bzwyqx1np610bl138hlkw44lg2ww1a8xsp3n7csm10d85xpg";
    };
    opam = "${repo}/packages/bsdowl/bsdowl.3.0.0-20150830/opam";
    depends = with self; [ conf-bmake ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  conf-bmake = {
    name = "conf-bmake";
    version = "1.0";
    opam = "${repo}/packages/conf-bmake/conf-bmake.1.0/opam";
    depexts = with pkgs; [ bmake ];
  };
  conf-cpio = {
    name = "conf-cpio";
    version = "1";
    opam = "${repo}/packages/conf-cpio/conf-cpio.1/opam";
    depexts = with pkgs; [ (pkgs.cpio or null) ];
  };
  configuration = {
    name = "configuration";
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/michipili/configuration/releases/download/v0.4.1/configuration-0.4.1.tar.xz";
      sha256 = "1rj9djgl742qf5shw926pcq94zj7ihq72gp502gk4qjyc0i3gvyb";
    };
    opam = "${repo}/packages/configuration/configuration.0.4.1/opam";
    depends = with self; [ broken bsdowl conf-bmake ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
