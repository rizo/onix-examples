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
  catapult = {
    name = "catapult";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/AestheticIntegration/catapult/archive/v0.1.tar.gz";
      sha512 = "49766ea38c57734918debd6218d95c62f11eb12a6fd3ef5f6a2c60344cea7c274436a46fab1e48abbe0d3f125f31705d2005ab7cae9e56d5f41778c1d2943d65";
    };
    opam = "${repo}/packages/catapult/catapult.0.1/opam";
    depends = with self; [ base-threads base-unix dune ocaml
                           (self.mtime or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  catapult-sqlite = {
    name = "catapult-sqlite";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/AestheticIntegration/catapult/archive/v0.1.tar.gz";
      sha512 = "49766ea38c57734918debd6218d95c62f11eb12a6fd3ef5f6a2c60344cea7c274436a46fab1e48abbe0d3f125f31705d2005ab7cae9e56d5f41778c1d2943d65";
    };
    opam = "${repo}/packages/catapult-sqlite/catapult-sqlite.0.1/opam";
    depends = with self; [ catapult directories dune ocaml sqlite3 ];
    buildDepends = with self; [ dune ocaml ];
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
  directories = {
    name = "directories";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/directories/archive/0.5.tar.gz";
      sha256 = "3eb8e0d079fd7c1099e9b92f8569b4edfb313fe58e838443a38266bd47d38c53";
    };
    opam = "${repo}/packages/directories/directories.0.5/opam";
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
  sqlite3 = {
    name = "sqlite3";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/sqlite3-ocaml/releases/download/5.1.0/sqlite3-5.1.0.tbz";
      sha256 = "bb0db711691a8dfa24fe29ec4ecb6912444ad90e0f4c447af89831e6d1dffea5";
    };
    opam = "${repo}/packages/sqlite3/sqlite3.5.1.0/opam";
    depends = with self; [ dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-sqlite3 dune ocaml ];
  };
}
