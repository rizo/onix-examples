{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  atd = {
    name = "atd";
    version = "2.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ahrefs/atd/releases/download/2.7.0/atdts-2.7.0.tbz";
      sha256 = "c46313e54e75dd97f1c4dfd6250ccdd42ab37cc998408f38524e5984dacce868";
    };
    opam = "${repo}/packages/atd/atd.2.7.0/opam";
    depends = with self; [ dune easy-format menhir ocaml re yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  atdgen = {
    name = "atdgen";
    version = "2.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ahrefs/atd/releases/download/2.7.0/atdts-2.7.0.tbz";
      sha256 = "c46313e54e75dd97f1c4dfd6250ccdd42ab37cc998408f38524e5984dacce868";
    };
    opam = "${repo}/packages/atdgen/atdgen.2.7.0/opam";
    depends = with self; [ atd atdgen-runtime biniou dune ocaml re yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  atdgen-runtime = {
    name = "atdgen-runtime";
    version = "2.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ahrefs/atd/releases/download/2.7.0/atdts-2.7.0.tbz";
      sha256 = "c46313e54e75dd97f1c4dfd6250ccdd42ab37cc998408f38524e5984dacce868";
    };
    opam = "${repo}/packages/atdgen-runtime/atdgen-runtime.2.7.0/opam";
    depends = with self; [ biniou camlp-streams dune ocaml yojson ];
    buildDepends = with self; [ dune ocaml ];
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
  calculon = {
    name = "calculon";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/calculon/archive/v0.6.tar.gz";
      sha512 = "c460994c0ffabf0d756cdbb0cdd77b99d3b4844f597c894bb2c8ed22d1038b44f1be4d76721a956a76cc953d915fb76324f0fdb385e6a2e531da7fd4cc832836";
    };
    opam = "${repo}/packages/calculon/calculon.0.6/opam";
    depends = with self; [ base-unix containers dune ISO8601 irc-client
                           irc-client-lwt irc-client-lwt-ssl logs lwt ocaml
                           re stringext yojson (self.iter or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  calculon-redis-lib = {
    name = "calculon-redis-lib";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/calculon/archive/v0.6.tar.gz";
      sha512 = "c460994c0ffabf0d756cdbb0cdd77b99d3b4844f597c894bb2c8ed22d1038b44f1be4d76721a956a76cc953d915fb76324f0fdb385e6a2e531da7fd4cc832836";
    };
    opam = "${repo}/packages/calculon-redis-lib/calculon-redis-lib.0.6/opam";
    depends = with self; [ atdgen calculon dune redis redis-lwt yojson ];
    buildDepends = with self; [ dune ];
  };
  camlp-streams = {
    name = "camlp-streams";
    version = "5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/camlp-streams/archive/refs/tags/v5.0.tar.gz";
      sha512 = "f42e2f5e5ca353b3d647cd7e97a278c167c2d1abd185a634f155965cec29e35d9be7ce940b4c205b0577d7e9b6f714580bfd2e2fd79f1b1b461bc3fb96d26d36";
    };
    opam = "${repo}/packages/camlp-streams/camlp-streams.5.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-libssl = {
    name = "conf-libssl";
    version = "4";
    opam = "${repo}/packages/conf-libssl/conf-libssl.4/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ openssl ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  containers = {
    name = "containers";
    version = "2.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-containers/archive/v2.8.1.tar.gz";
      sha512 = "8b832f4ada6035e80d81be0cfb7bdffb695ec67d465ed6097a144019e2b8a8f909095e78019c3da2d8181cc3cd730cd48f7519e87d3162442562103b7f36aabb";
    };
    opam = "${repo}/packages/containers/containers.2.8.1/opam";
    depends = with self; [ dune dune-configurator ocaml seq
                           (self.base-threads or null)
                           (self.base-unix or null) ];
    buildDepends = with self; [ dune ocaml ];
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
  ISO8601 = {
    name = "ISO8601";
    version = "0.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/ISO8601.ml/archive/0.2.6.tar.gz";
      sha512 = "82b5cbbb636346e8d010ee569c0fad2f00bef31c3177cfee80fc02a081c5fcfb7880bf2670fe4f46423e3ae99370626c7efffc9d332cae5cbd6377c975517b3f";
    };
    opam = "${repo}/packages/ISO8601/ISO8601.0.2.6/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  irc-client = {
    name = "irc-client";
    version = "0.6.2";
    src = pkgs.fetchurl {
      url = "https://github.com/johnelse/ocaml-irc-client/archive/irc-client.0.6.2.tar.gz";
      sha256 = "0c5xkzny6n5hayraxbr8pb3yy8jngqh324g6jfszaqcilkw0lqqx";
    };
    opam = "${repo}/packages/irc-client/irc-client.0.6.2/opam";
    depends = with self; [ base-bytes dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  irc-client-lwt = {
    name = "irc-client-lwt";
    version = "0.6.2";
    src = pkgs.fetchurl {
      url = "https://github.com/johnelse/ocaml-irc-client/archive/irc-client.0.6.2.tar.gz";
      sha256 = "0c5xkzny6n5hayraxbr8pb3yy8jngqh324g6jfszaqcilkw0lqqx";
    };
    opam = "${repo}/packages/irc-client-lwt/irc-client-lwt.0.6.2/opam";
    depends = with self; [ dune irc-client lwt ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  irc-client-lwt-ssl = {
    name = "irc-client-lwt-ssl";
    version = "0.6.2";
    src = pkgs.fetchurl {
      url = "https://github.com/johnelse/ocaml-irc-client/archive/irc-client.0.6.2.tar.gz";
      sha256 = "0c5xkzny6n5hayraxbr8pb3yy8jngqh324g6jfszaqcilkw0lqqx";
    };
    opam = "${repo}/packages/irc-client-lwt-ssl/irc-client-lwt-ssl.0.6.2/opam";
    depends = with self; [ dune irc-client lwt lwt_ssl ocaml ssl ];
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
  lwt_ssl = {
    name = "lwt_ssl";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt_ssl/archive/1.1.3.tar.gz";
      sha256 = "0dxxkif4a667ndk14sn8ka4x4gck0gvw4sc12jb84rcq5k15jlkp";
    };
    opam = "${repo}/packages/lwt_ssl/lwt_ssl.1.1.3/opam";
    depends = with self; [ base-unix dune lwt ocaml ssl ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhir = {
    name = "menhir";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhir/menhir.20220210/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  redis = {
    name = "redis";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/0xffea/ocaml-redis/archive/0.5.tar.gz";
      sha512 = "46c34a751a93197ea7ca71cf797b1e5c3f9f74dacbe5d4cd064d20a008cbfe078bc331627bf5b5fcdbab5aab939a3c9042c260d10981bd81ecc4932345dd0e47";
    };
    opam = "${repo}/packages/redis/redis.0.5/opam";
    depends = with self; [ base-unix dune ocaml re uuidm ];
    buildDepends = with self; [ dune ocaml ];
  };
  redis-lwt = {
    name = "redis-lwt";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/0xffea/ocaml-redis/archive/0.5.tar.gz";
      sha512 = "46c34a751a93197ea7ca71cf797b1e5c3f9f74dacbe5d4cd064d20a008cbfe078bc331627bf5b5fcdbab5aab939a3c9042c260d10981bd81ecc4932345dd0e47";
    };
    opam = "${repo}/packages/redis-lwt/redis-lwt.0.5/opam";
    depends = with self; [ dune lwt ocaml redis ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  ssl = {
    name = "ssl";
    version = "0.5.10";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ssl/archive/v0.5.10.tar.gz";
      sha512 = "f2d0acc8dcdb0a36c8ad236f60c6e9d7f8f76ea25183017218953dbe3432a19de5b0be8214714add71b88b211ac78318f09429d4df7ecba1e19dc94d4414f0e1";
    };
    opam = "${repo}/packages/ssl/ssl.0.5.10/opam";
    depends = with self; [ base-unix conf-libssl dune dune-configurator ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  stringext = {
    name = "stringext";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/rgrinberg/stringext/releases/download/1.6.0/stringext-1.6.0.tbz";
      sha256 = "db41f5d52e9eab17615f110b899dfeb27dd7e7f89cd35ae43827c5119db206ea";
    };
    opam = "${repo}/packages/stringext/stringext.1.6.0/opam";
    depends = with self; [ base-bytes dune ocaml ];
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
  uuidm = {
    name = "uuidm";
    version = "0.9.8";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uuidm/releases/uuidm-0.9.8.tbz";
      sha512 = "d5073ae49c402ab3ea6dc8f86bc5b8cc14129437e23e47da4d91431648fcb31c4dce6308f9c936c58df9a2c6afda61d77105a3022e369cca4e4c140320e803b5";
    };
    opam = "${repo}/packages/uuidm/uuidm.0.9.8/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
