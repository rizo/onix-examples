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
  catapult-daemon = {
    name = "catapult-daemon";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/AestheticIntegration/catapult/archive/v0.1.tar.gz";
      sha512 = "49766ea38c57734918debd6218d95c62f11eb12a6fd3ef5f6a2c60344cea7c274436a46fab1e48abbe0d3f125f31705d2005ab7cae9e56d5f41778c1d2943d65";
    };
    opam = "${repo}/packages/catapult-daemon/catapult-daemon.0.1/opam";
    depends = with self; [ catapult catapult-sqlite dune logs zmq ];
    buildDepends = with self; [ dune ];
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
  conf-zmq = {
    name = "conf-zmq";
    version = "0.1";
    opam = "${repo}/packages/conf-zmq/conf-zmq.0.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.epel-release or null)
                           (pkgs.libzmq3-dev or null) (pkgs.libzmq4 or null)
                           (pkgs.zeromq or null) (pkgs.zeromq-dev or null)
                           (pkgs.zeromq-devel or null) (pkgs.zmq or null) ];
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
  logs = {
    name = "logs";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/logs/releases/logs-0.7.0.tbz";
      sha256 = "1jnmd675wmsmdwyb5mx5b0ac66g4c6gpv5s4mrx2j6pb0wla1x46";
    };
    opam = "${repo}/packages/logs/logs.0.7.0/opam";
    depends = with self; [ ocaml (self.base-threads or null)
                           (self.cmdliner or null) (self.fmt or null)
                           (self.js_of_ocaml or null) (self.lwt or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  zmq = {
    name = "zmq";
    version = "5.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/issuu/ocaml-zmq/releases/download/5.1.5/zmq-lwt-5.1.5.tbz";
      sha256 = "9947d13dab4b3c5792cd60f0088a0569597ce5592f0dc8788baa4e9f72a67b56";
    };
    opam = "${repo}/packages/zmq/zmq.5.1.5/opam";
    depends = with self; [ conf-zmq dune dune-configurator ocaml stdint ];
    buildDepends = with self; [ dune ocaml ];
  };
}
