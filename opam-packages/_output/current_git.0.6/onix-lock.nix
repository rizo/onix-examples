{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  asetmap = {
    name = "asetmap";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/asetmap/releases/asetmap-0.8.1.tbz";
      sha256 = "1zjk3xn9167wgsvnwdawhz1das71akxy3ica7vkmag0ycxa1q8a3";
    };
    opam = "${repo}/packages/asetmap/asetmap.0.8.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  astring = {
    name = "astring";
    version = "0.8.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
      sha256 = "1ykhg9gd3iy7zsgyiy2p9b1wkpqg9irw5pvcqs3sphq71iir4ml6";
    };
    opam = "${repo}/packages/astring/astring.0.8.5/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
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
  bigarray-compat = {
    name = "bigarray-compat";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/bigarray-compat/releases/download/v1.1.0/bigarray-compat-1.1.0.tbz";
      sha256 = "434469a48d5c84e80d621b13d95eb067f8138c1650a1fd5ae6009a19b93718d5";
    };
    opam = "${repo}/packages/bigarray-compat/bigarray-compat.1.1.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  biniou = {
    name = "biniou";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/biniou/releases/download/1.2.1/biniou-1.2.1.tbz";
      sha256 = "35546c68b1929a8e6d27a3b39ecd17b38303a0d47e65eb9d1480c2061ea84335";
    };
    opam = "${repo}/packages/biniou/biniou.1.2.1/opam";
    depends = with self; [ dune easy-format ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bos = {
    name = "bos";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/bos/releases/bos-0.2.1.tbz";
      sha512 = "8daeb8a4c2dd1f2460f6274ada19f4f1b6ebe875ff83a938c93418ce0e6bdb74b8afc5c9a7d410c1c9df2dad030e4fa276b6ed2da580639484e8b5bc92610b1d";
    };
    opam = "${repo}/packages/bos/bos.0.2.1/opam";
    depends = with self; [ astring base-unix fmt fpath logs ocaml rresult ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  cf = {
    name = "cf";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cf/releases/download/0.5.0/cf-lwt-0.5.0.tbz";
      sha256 = "d307832538a493023be3c7aceb5e9594e509d49e16f1e90dff1dc22ef46b9564";
    };
    opam = "${repo}/packages/cf/cf.0.5.0/opam";
    depends = with self; [ base-bytes ctypes ctypes-foreign dune ];
    buildDepends = with self; [ dune ];
  };
  cf-lwt = {
    name = "cf-lwt";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cf/releases/download/0.5.0/cf-lwt-0.5.0.tbz";
      sha256 = "d307832538a493023be3c7aceb5e9594e509d49e16f1e90dff1dc22ef46b9564";
    };
    opam = "${repo}/packages/cf-lwt/cf-lwt.0.5.0/opam";
    depends = with self; [ cf dune lwt ];
    buildDepends = with self; [ dune ];
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
  conf-git = {
    name = "conf-git";
    version = "1.1";
    opam = "${repo}/packages/conf-git/conf-git.1.1/opam";
    depexts = with pkgs; [ git ];
  };
  conf-libev = {
    name = "conf-libev";
    version = "4+12";
    opam = "${repo}/packages/conf-libev/conf-libev.4-12/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ libev ];
  };
  conf-libffi = {
    name = "conf-libffi";
    version = "2.0.0";
    opam = "${repo}/packages/conf-libffi/conf-libffi.2.0.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libffi ];
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
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  cstruct = {
    name = "cstruct";
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${repo}/packages/cstruct/cstruct.6.1.0/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ctypes = {
    name = "ctypes";
    version = "0.20.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-ctypes/archive/0.20.1.tar.gz";
      sha256 = "1iwf4yv29zp7sg78qw7jcsiyyk1xbjvjxrsjliay98jjq75imgvq";
    };
    opam = "${repo}/packages/ctypes/ctypes.0.20.1/opam";
    depends = with self; [ bigarray-compat integers ocaml
                           (self.ctypes-foreign or null)
                           (self.mirage-xen or null) ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ctypes-foreign = {
    name = "ctypes-foreign";
    version = "0.18.0";
    opam = "${repo}/packages/ctypes-foreign/ctypes-foreign.0.18.0/opam";
    depends = with self; [ conf-libffi ];
    buildDepends = with self; [ conf-pkg-config ];
  };
  current = {
    name = "current";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/ocurrent/ocurrent/releases/download/v0.6/current-0.6.tbz";
      sha256 = "8e57b3f602a2e18cc520b76b9252bda1ef2c6c9f21508f145870165a3abd69b4";
    };
    opam = "${repo}/packages/current/current.0.6/opam";
    depends = with self; [ astring bos cmdliner conf-libev current_incr dune
                           duration fmt fpath logs lwt lwt-dllist ocaml
                           ppx_deriving prometheus re result sqlite3 ];
    buildDepends = with self; [ dune ocaml ];
  };
  current_git = {
    name = "current_git";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/ocurrent/ocurrent/releases/download/v0.6/current-0.6.tbz";
      sha256 = "8e57b3f602a2e18cc520b76b9252bda1ef2c6c9f21508f145870165a3abd69b4";
    };
    opam = "${repo}/packages/current_git/current_git.0.6/opam";
    depends = with self; [ astring bos conf-git cstruct current dune fmt
                           fpath irmin-watcher logs lwt mirage-crypto ocaml
                           ppx_deriving ppx_deriving_yojson result yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  current_incr = {
    name = "current_incr";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocurrent/current_incr/releases/download/0.6.0/current_incr-0.6.0.tbz";
      sha256 = "bf762d7fd3df75a85d12858ae58f0a02e7ef0c9106d46cf40559bb23e97aa62e";
    };
    opam = "${repo}/packages/current_incr/current_incr.0.6.0/opam";
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
  duration = {
    name = "duration";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/duration/releases/download/0.2.0/duration-0.2.0.tbz";
      sha256 = "ad14fb75a5a6f73fff7ef1721178925ee555cf0f23b23e3ab329184bc0c1ce69";
    };
    opam = "${repo}/packages/duration/duration.0.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  easy-format = {
    name = "easy-format";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/easy-format/releases/download/1.3.3/easy-format-1.3.3.tbz";
      sha256 = "eafccae911c26ca23e4ddacee3eaa54654d20f973b8680f84b708cef43adc416";
    };
    opam = "${repo}/packages/easy-format/easy-format.1.3.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  eqaf = {
    name = "eqaf";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/eqaf/releases/download/v0.8/eqaf-v0.8.tbz";
      sha256 = "1145a160107437d7943e02e486df6bd233d3937ec1a597d7fa39edb9471cf875";
    };
    opam = "${repo}/packages/eqaf/eqaf.0.8/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fmt = {
    name = "fmt";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
      sha512 = "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
    };
    opam = "${repo}/packages/fmt/fmt.0.9.0/opam";
    depends = with self; [ ocaml (self.base-unix or null)
                           (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  fpath = {
    name = "fpath";
    version = "0.7.3";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fpath/releases/fpath-0.7.3.tbz";
      sha256 = "03z7mj0sqdz465rc4drj1gr88l9q3nfs374yssvdjdyhjbqqzc0j";
    };
    opam = "${repo}/packages/fpath/fpath.0.7.3/opam";
    depends = with self; [ astring ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  fsevents = {
    name = "fsevents";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-fsevents/releases/download/0.3.0/fsevents-lwt-0.3.0.tbz";
      sha256 = "0bbfea93c14e99c1dbb2bf9de2ef8c93e4f1043490df73c00f9c0a969f472b7a";
    };
    opam = "${repo}/packages/fsevents/fsevents.0.3.0/opam";
    depends = with self; [ base-bytes cf ctypes dune ];
    buildDepends = with self; [ dune ];
  };
  fsevents-lwt = {
    name = "fsevents-lwt";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-fsevents/releases/download/0.3.0/fsevents-lwt-0.3.0.tbz";
      sha256 = "0bbfea93c14e99c1dbb2bf9de2ef8c93e4f1043490df73c00f9c0a969f472b7a";
    };
    opam = "${repo}/packages/fsevents-lwt/fsevents-lwt.0.3.0/opam";
    depends = with self; [ cf-lwt cmdliner dune fsevents lwt ];
    buildDepends = with self; [ dune ];
  };
  integers = {
    name = "integers";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-integers/archive/0.7.0.tar.gz";
      sha256 = "11f67v9bijhkbnia7vrdp6sfpyw92kp39kn4p1p2860qkbx1gdcb";
    };
    opam = "${repo}/packages/integers/integers.0.7.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-watcher = {
    name = "irmin-watcher";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin-watcher/releases/download/0.5.0/irmin-watcher-0.5.0.tbz";
      sha256 = "beae24c1acf84141bdc747c611b40c02e0c68e54f7ffa966f318974d4a899993";
    };
    opam = "${repo}/packages/irmin-watcher/irmin-watcher.0.5.0/opam";
    depends = with self; [ astring cf-lwt dune fmt fsevents-lwt logs lwt
                           ocaml ];
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
  lwt = {
    name = "lwt";
    version = "5.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt/lwt.5.5.0/opam";
    depends = with self; [ dune dune-configurator mmap ocaml ocplib-endian
                           result seq (self.base-threads or null)
                           (self.base-unix or null) (self.conf-libev or null)
                           (self.ocaml or null)
                           (self.ocaml-syntax-shims or null) ];
    buildDepends = with self; [ cppo dune ocaml (self.ocaml or null) ];
  };
  lwt-dllist = {
    name = "lwt-dllist";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/lwt-dllist/releases/download/v1.0.1/lwt-dllist-v1.0.1.tbz";
      sha256 = "e86ce75e40f00d51514cf8b2e71e5184c4cb5dae96136be24613406cfc0dba6e";
    };
    opam = "${repo}/packages/lwt-dllist/lwt-dllist.1.0.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-crypto = {
    name = "mirage-crypto";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.6/mirage-crypto-0.10.6.tbz";
      sha256 = "01d6477a4edcad007b56983955d327f0e61c3f36494822f3755017d26e8f9410";
    };
    opam = "${repo}/packages/mirage-crypto/mirage-crypto.0.10.6/opam";
    depends = with self; [ cstruct dune dune-configurator eqaf ocaml
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  mmap = {
    name = "mmap";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mmap/releases/download/v1.2.0/mmap-1.2.0.tbz";
      sha256 = "1602a8abc8e232fa94771a52e540e5780b40c2f2762eee6afbd9286502116ddb";
    };
    opam = "${repo}/packages/mmap/mmap.1.2.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
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
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.12.4";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.4/ocaml-compiler-libs-v0.12.4.tbz";
      sha256 = "4ec9c9ec35cc45c18c7a143761154ef1d7663036a29297f80381f47981a07760";
    };
    opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.4/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ocplib-endian = {
    name = "ocplib-endian";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocplib-endian/archive/refs/tags/1.2.tar.gz";
      sha512 = "2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85";
    };
    opam = "${repo}/packages/ocplib-endian/ocplib-endian.1.2/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  ppx_derivers = {
    name = "ppx_derivers";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
      sha256 = "159vqy616ni18mn0dlv8c2y4h7mb4hahwjn53yrr59yyhzhmwndn";
    };
    opam = "${repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_deriving = {
    name = "ppx_deriving";
    version = "5.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/releases/download/v5.2.1/ppx_deriving-v5.2.1.tbz";
      sha256 = "e96b5fb25b7632570e4b329e22e097fcd4b8e8680d1e43ef003a8fbd742b0786";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.5.2.1/opam";
    depends = with self; [ dune ocaml ocamlfind ppx_derivers ppxlib result ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
  };
  ppx_deriving_yojson = {
    name = "ppx_deriving_yojson";
    version = "3.6.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving_yojson/releases/download/v3.6.1/ppx_deriving_yojson-v3.6.1.tbz";
      sha256 = "712ee9207c70dd144e72cd689bee2d2beb120b804e77c74ec6f7b843a88944e6";
    };
    opam = "${repo}/packages/ppx_deriving_yojson/ppx_deriving_yojson.3.6.1/opam";
    depends = with self; [ dune ocaml ppx_deriving ppxlib result yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.25.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.25.0/ppxlib-0.25.0.tbz";
      sha256 = "2d2f150e7715845dc578d254f705a67600be71c986b7e67e81befda612870bd5";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.25.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs ppx_derivers
                           sexplib0 stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  prometheus = {
    name = "prometheus";
    version = "1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/prometheus/releases/download/v1.1/prometheus-v1.1.tbz";
      sha256 = "fbcf8bb28c02bfe4f61d2494bc2b70fdedd62f2b41fd1343e6f73d583bf599e4";
    };
    opam = "${repo}/packages/prometheus/prometheus.1.1/opam";
    depends = with self; [ asetmap astring dune fmt lwt ocaml re ];
    buildDepends = with self; [ dune ocaml ];
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
  result = {
    name = "result";
    version = "1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
      sha256 = "0cpfp35fdwnv3p30a06wd0py3805qxmq3jmcynjc3x2qhlimwfkw";
    };
    opam = "${repo}/packages/result/result.1.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  rresult = {
    name = "rresult";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/rresult/releases/rresult-0.7.0.tbz";
      sha512 = "f1bb631c986996388e9686d49d5ae4d8aaf14034f6865c62a88fb58c48ce19ad2eb785327d69ca27c032f835984e0bd2efd969b415438628a31f3e84ec4551d3";
    };
    opam = "${repo}/packages/rresult/rresult.0.7.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexplib0-v0.15.0.tar.gz";
      sha256 = "94462c00416403d2778493ac01ced5439bc388a68ac4097208159d62434aefba";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  stdlib-shims = {
    name = "stdlib-shims";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
      sha256 = "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
    };
    opam = "${repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
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
  yojson = {
    name = "yojson";
    version = "1.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/yojson/releases/download/1.7.0/yojson-1.7.0.tbz";
      sha256 = "1iich6323npvvs8r50lkr4pxxqm9mf6w67cnid7jg1j1g5gwcvv5";
    };
    opam = "${repo}/packages/yojson/yojson.1.7.0/opam";
    depends = with self; [ biniou dune easy-format ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
}
