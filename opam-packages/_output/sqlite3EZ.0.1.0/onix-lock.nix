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
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-sqlite3 = {
    name = "conf-sqlite3";
    version = "1";
    opam = "${repo}/packages/conf-sqlite3/conf-sqlite3.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ sqlite ];
  };
  dune = {
    name = "dune";
    version = "1.11.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.11.4/dune-build-info-1.11.4.tbz";
      sha256 = "77cb5f483221b266ded2b85fc84173ae0089a25134a086be922e82c131456ce6";
    };
    opam = "${repo}/packages/dune/dune.1.11.4/opam";
    depends = with self; [ base-threads base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "1.0.0";
    opam = "${repo}/packages/dune-configurator/dune-configurator.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
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
    version = "4.05.0";
    opam = "${repo}/packages/ocaml/ocaml.4.05.0/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.05.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.05.0.tar.gz";
      sha256 = "0gzav1y7636w857p6ywzj80nv5n30v5wzbyqfc25h30257vadn75";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.05.0/opam";
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-twt = {
    name = "ocaml-twt";
    version = "0.94.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mlin/twt/archive/v0.94.0.tar.gz";
      sha256 = "1rc8hih0gpby8cirmf70bwcxjb8swpkd0fxwrs1i5m003wcbfakx";
    };
    opam = "${repo}/packages/ocaml-twt/ocaml-twt.0.94.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  sqlite3 = {
    name = "sqlite3";
    version = "5.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/sqlite3-ocaml/releases/download/5.0.1/sqlite3-5.0.1.tbz";
      sha256 = "56d78a9898af8a2cc97a0f01fa0db0dc49d43c62df35b5c1541c1b9dbf9ed547";
    };
    opam = "${repo}/packages/sqlite3/sqlite3.5.0.1/opam";
    depends = with self; [ dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-sqlite3 dune dune-configurator ocaml ];
  };
  sqlite3EZ = {
    name = "sqlite3EZ";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mlin/ocaml-sqlite3EZ/archive/v0.1.0.tar.gz";
      sha256 = "0j1paqxfxrywiadx9kahp07052mkp2zi3vw9apcwnraaj7awbllf";
    };
    opam = "${repo}/packages/sqlite3EZ/sqlite3EZ.0.1.0/opam";
    depends = with self; [ ocaml ocaml-twt ocamlfind sqlite3
                           (self.beluga or null) (self.ounit or null) ];
    buildDepends = with self; [ oasis ocaml ocamlbuild ocamlfind ];
  };
}
