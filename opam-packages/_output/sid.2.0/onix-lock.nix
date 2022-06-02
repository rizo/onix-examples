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
  oasis = {
    name = "oasis";
    version = "0.4.11";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/oasis/oasis/0.4.11/oasis-0.4.11.tar.gz";
      sha256 = "0bn13mzfa98dq3y0jwzzndl55mnywaxv693z6f1rlvpdykp3vdqq";
    };
    opam = "${repo}/packages/oasis/oasis.0.4.11/opam";
    depends = with self; [ base-unix ocaml ocamlbuild
                           (self.benchmark or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ocamlify ocamlmod ];
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
  ocamlify = {
    name = "ocamlify";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlify/ocamlify/0.0.1/ocamlify-0.0.1.tar.gz";
      sha256 = "1j9nb3vjqbdsx3d6jazixgrh776051zkrc06nsc5q5ilp1jhrwkm";
    };
    opam = "${repo}/packages/ocamlify/ocamlify.0.0.1/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocamlmod = {
    name = "ocamlmod";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlmod/ocamlmod/0.0.9/ocamlmod-0.0.9.tar.gz";
      sha256 = "0cgp9qqrq7ayyhddrmqmq1affvfqcn722qiakjq4dkywvp67h4aa";
    };
    opam = "${repo}/packages/ocamlmod/ocamlmod.0.0.9/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  sid = {
    name = "sid";
    version = "2.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/phgsng/ocaml-sid/-/archive/v2.0/ocaml-sid-v2.0.tar.gz";
      sha512 = "8d61e8a157b3d12a12f3f05b80bd356f81bb2819fb940edd68f359e66ea44edc3cb3450950da3bde1814055fdeb4b8c6ec5a9ba080c18316c2034c48fa9ff29d";
    };
    opam = "${repo}/packages/sid/sid.2.0/opam";
    depends = with self; [ cmdliner ocaml stdint ];
    buildDepends = with self; [ oasis ocaml ocamlbuild ocamlfind ];
  };
  stdint = {
    name = "stdint";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andrenth/ocaml-stdint/releases/download/0.7.0/stdint-0.7.0.tbz";
      sha256 = "4fcc66aef58e2b96e7af3bbca9d910aa239e045ba5fb2400aaef67d0041252dc";
    };
    opam = "${repo}/packages/stdint/stdint.0.7.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
