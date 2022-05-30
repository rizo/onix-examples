{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  base64 = {
    name = "base64";
    version = "3.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-base64/releases/download/v3.5.0/base64-v3.5.0.tbz";
      sha256 = "589de9c00578ebfe784198ac9818d3586c474b2316b6cd3e1c46ccb1f62ae3a4";
    };
    opam = "${repo}/packages/base64/base64.3.5.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  benchpress = {
    name = "benchpress";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/sneeuwballen/benchpress/archive/0.1.tar.gz";
      sha512 = "79173afcebe9dbdeabf8e8d6cf31b757bff1021c20d3f29b618081b3601289a939f032773dd3fc939dd005596f3cebc4407c542624ec1fcb2ff6f595b9914834";
    };
    opam = "${repo}/packages/benchpress/benchpress.0.1/opam";
    depends = with self; [ base-unix base64 cmdliner containers csv decoders
                           dune gnuplot iter logs ocaml ocaml-protoc printbox
                           re sqlite3 sqlite3_utils uuidm ];
    buildDepends = with self; [ dune ocaml ];
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
  conf-gnuplot = {
    name = "conf-gnuplot";
    version = "0.1";
    opam = "${repo}/packages/conf-gnuplot/conf-gnuplot.0.1/opam";
    depexts = with pkgs; [ (pkgs.gnuplot or null) (pkgs.gnuplot-x11 or null) ];
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
  csv = {
    name = "csv";
    version = "2.4";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/ocaml-csv/releases/download/2.4/csv-2.4.tbz";
      sha256 = "13fec48177f2658c4c62edf04f5edd055962fbf2abb4c3e372d268dd2ab2a98e";
    };
    opam = "${repo}/packages/csv/csv.2.4/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  decoders = {
    name = "decoders";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mattjbray/ocaml-decoders/releases/download/v0.3.0/decoders-v0.3.0.tbz";
      sha256 = "a50e613cfd18a584e765d8368ad0afe920482bf1e6745caf13f2b6a7d3634d9d";
    };
    opam = "${repo}/packages/decoders/decoders.0.3.0/opam";
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
  gnuplot = {
    name = "gnuplot";
    version = "0.7";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-gnuplot/archive/v0.7.tar.gz";
      sha512 = "38f2076f2d9365b8a7206981d4a08d21c2dded9dbec4357ad87349c0d74779fce35de885770e01d237bd9ca407287b0d321b3325968e93cb571ad714036939fa";
    };
    opam = "${repo}/packages/gnuplot/gnuplot.0.7/opam";
    depends = with self; [ base-unix conf-gnuplot dune ISO8601 ocaml ];
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
  iter = {
    name = "iter";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/sequence/archive/v1.4.tar.gz";
      sha512 = "8bcb6ddaab69aa18a8489a2287313227d59062fd554f70373a10bdbe1d1eabe4b199860223709fe7baa917d0d47aedeed895ed6d610a989ca540e00fe9cd135b";
    };
    opam = "${repo}/packages/iter/iter.1.4/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml result
                           (self.base-bigarray or null) ];
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
  ocaml-protoc = {
    name = "ocaml-protoc";
    version = "2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mransan/ocaml-protoc/archive/2.2.0.tar.gz";
      sha512 = "ee368b2be9ddb40dc3ef15eea7e96af9595c93fc8d92b1ad7f50e018cbda6ed6fc613bf41fcf4729974b2ce9dfbcd78ccbcb8a38d59d17bf4ceb24f581392303";
    };
    opam = "${repo}/packages/ocaml-protoc/ocaml-protoc.2.2/opam";
    depends = with self; [ dune ocaml pbrt stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
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
  pbrt = {
    name = "pbrt";
    version = "2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mransan/ocaml-protoc/archive/2.2.0.tar.gz";
      sha512 = "ee368b2be9ddb40dc3ef15eea7e96af9595c93fc8d92b1ad7f50e018cbda6ed6fc613bf41fcf4729974b2ce9dfbcd78ccbcb8a38d59d17bf4ceb24f581392303";
    };
    opam = "${repo}/packages/pbrt/pbrt.2.2/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  printbox = {
    name = "printbox";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/printbox/archive/0.5.tar.gz";
      sha512 = "6aefd975403751288de02104f0bf21d455e37c057fd9237d38af42dd8e01643514acc3a9ab96d42b0c1f5064c3a330833352ac09cd6198275f1c165db2bace7f";
    };
    opam = "${repo}/packages/printbox/printbox.0.5/opam";
    depends = with self; [ base-bytes dune ocaml (self.tyxml or null)
                           (self.uucp or null) (self.uutf or null) ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
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
  sqlite3_utils = {
    name = "sqlite3_utils";
    version = "0.3.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/sqlite3_utils/archive/0.3.1.tar.gz";
      sha512 = "a871efa303664dec4606d6ebd701b795fe825fd27e1e9bd9ee32e4baa7ca364b7dd8835dc8e75e07ddf0b8e970a62a19094af449f0f0e05280764ef382335331";
    };
    opam = "${repo}/packages/sqlite3_utils/sqlite3_utils.0.3.1/opam";
    depends = with self; [ dune ocaml seq sqlite3 ];
    buildDepends = with self; [ dune ocaml ];
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
}
