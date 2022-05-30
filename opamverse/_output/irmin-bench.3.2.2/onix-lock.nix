{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  alcotest = {
    name = "alcotest";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/alcotest/releases/download/1.5.0/alcotest-js-1.5.0.tbz";
      sha256 = "54281907e02d78995df246dc2e10ed182828294ad2059347a1e3a13354848f6c";
    };
    opam = "${repo}/packages/alcotest/alcotest.1.5.0/opam";
    depends = with self; [ astring cmdliner dune fmt ocaml ocaml-syntax-shims
                           re stdlib-shims uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  angstrom = {
    name = "angstrom";
    version = "0.15.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/angstrom/archive/0.15.0.tar.gz";
      sha256 = "01cjjal8vjsm225v9y0q6ixam8k5f821rcr6yix6i9nzs84aq6gi";
    };
    opam = "${repo}/packages/angstrom/angstrom.0.15.0/opam";
    depends = with self; [ bigstringaf dune ocaml result ];
    buildDepends = with self; [ dune ocaml ocaml-syntax-shims ];
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
  bentov = {
    name = "bentov";
    version = "1";
    src = pkgs.fetchurl {
      url = "https://github.com/barko/bentov/releases/download/1/bentov-1.tbz";
      sha256 = "9dd08f88b554ee5d8127f683cd4530773763091d692c86b7ddd4794a0fbad8e3";
    };
    opam = "${repo}/packages/bentov/bentov.1/opam";
    depends = with self; [ cmdliner dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bheap = {
    name = "bheap";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/bheap/releases/download/2.0.0/bheap-2.0.0.tbz";
      sha256 = "5f43d7b237bc87b07097f60eae2b32de64e644158308da338bf1512014bdf636";
    };
    opam = "${repo}/packages/bheap/bheap.2.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  bigstringaf = {
    name = "bigstringaf";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/bigstringaf/archive/0.9.0.tar.gz";
      sha256 = "0v0h09r0690b6b27ww443zxvj1dwhxcy86fbjaf2wm56kb3qccsl";
    };
    opam = "${repo}/packages/bigstringaf/bigstringaf.0.9.0/opam";
    depends = with self; [ dune ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
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
  cmdliner = {
    name = "cmdliner";
    version = "1.0.4";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/cmdliner/releases/cmdliner-1.0.4.tbz";
      sha256 = "1h04q0zkasd0mw64ggh4y58lgzkhg6yhzy60lab8k8zq9ba96ajw";
    };
    opam = "${repo}/packages/cmdliner/cmdliner.1.0.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
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
  digestif = {
    name = "digestif";
    version = "1.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/digestif/releases/download/v1.1.2/digestif-1.1.2.tbz";
      sha256 = "79d34ce513b114857e380aabdf6f1473218f1b05dd7e51d03890779ed01b4666";
    };
    opam = "${repo}/packages/digestif/digestif.1.1.2/opam";
    depends = with self; [ dune eqaf ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
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
  either = {
    name = "either";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
      sha256 = "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
    };
    opam = "${repo}/packages/either/either.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
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
  index = {
    name = "index";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/index/releases/download/1.6.0/index-1.6.0.tbz";
      sha256 = "5e0c1f6cbd6e485cbbf2344c8f76de8a7869155355ae6edd5550c88da0661594";
    };
    opam = "${repo}/packages/index/index.1.6.0/opam";
    depends = with self; [ cmdliner dune fmt jsonm logs lru mtime ocaml
                           optint ppx_repr progress repr semaphore-compat
                           stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin = {
    name = "irmin";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin/irmin.3.2.2/opam";
    depends = with self; [ astring bheap bigstringaf digestif dune fmt jsonm
                           logs lwt mtime ocaml ocamlgraph ppx_irmin repr uri
                           uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-bench = {
    name = "irmin-bench";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-bench/irmin-bench.3.2.2/opam";
    depends = with self; [ bentov cmdliner dune fmt irmin-pack irmin-test
                           irmin-tezos logs lwt memtrace mtime ppx_deriving
                           ppx_repr printbox printbox-text progress re repr
                           rusage uucp uuidm uutf ];
    buildDepends = with self; [ dune ];
  };
  irmin-pack = {
    name = "irmin-pack";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-pack/irmin-pack.3.2.2/opam";
    depends = with self; [ cmdliner dune fmt index irmin logs lwt mtime ocaml
                           optint ppx_irmin ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-test = {
    name = "irmin-test";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-test/irmin-test.3.2.2/opam";
    depends = with self; [ alcotest astring cmdliner dune fmt irmin jsonm
                           logs lwt metrics metrics-unix mtime ocaml
                           ocaml-syntax-shims ppx_irmin ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-tezos = {
    name = "irmin-tezos";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-tezos/irmin-tezos.3.2.2/opam";
    depends = with self; [ cmdliner digestif dune fmt irmin irmin-pack
                           ppx_irmin tezos-base58 yojson ];
    buildDepends = with self; [ dune ];
  };
  jsonm = {
    name = "jsonm";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/jsonm/releases/jsonm-1.0.1.tbz";
      sha256 = "1176dcmxb11fnw49b7yysvkjh0kpzx4s48lmdn5psq9vshp5c29w";
    };
    opam = "${repo}/packages/jsonm/jsonm.1.0.1/opam";
    depends = with self; [ ocaml uchar uutf ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  lru = {
    name = "lru";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/lru/releases/download/v0.3.0/lru-v0.3.0.tbz";
      sha256 = "1ab9rd7cq15ml8x0wjl44wy99h5z7x4g9vkkz4i2d7n84ghy7vw4";
    };
    opam = "${repo}/packages/lru/lru.0.3.0/opam";
    depends = with self; [ dune ocaml psq ];
    buildDepends = with self; [ dune ocaml ];
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
  memtrace = {
    name = "memtrace";
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/memtrace/releases/download/v0.2.2/memtrace-0.2.2.tbz";
      sha256 = "9500666006b235a0bd0a7efa4ffa1329556d59572c3eb4d19b387cbf13c4c48f";
    };
    opam = "${repo}/packages/memtrace/memtrace.0.2.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  metrics = {
    name = "metrics";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/metrics/releases/download/v0.4.0/metrics-0.4.0.tbz";
      sha256 = "91b8755a4b5090371713c3b55919bebed6a055f4aa97c4b982bd1b5e7fe389af";
    };
    opam = "${repo}/packages/metrics/metrics.0.4.0/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  metrics-unix = {
    name = "metrics-unix";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/metrics/releases/download/v0.4.0/metrics-0.4.0.tbz";
      sha256 = "91b8755a4b5090371713c3b55919bebed6a055f4aa97c4b982bd1b5e7fe389af";
    };
    opam = "${repo}/packages/metrics-unix/metrics-unix.0.4.0/opam";
    depends = with self; [ conf-gnuplot dune fmt lwt metrics mtime ocaml
                           uuidm ];
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
  mtime = {
    name = "mtime";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/mtime/releases/mtime-1.3.0.tbz";
      sha512 = "5b998ef803020de4771525adaa448623d348fa079800e72ba2ba78ff2d76a7d89da6200fe8bbc435d1355ad2c571c029398150d618912e58b5765fcf2210a5d0";
    };
    opam = "${repo}/packages/mtime/mtime.1.3.0/opam";
    depends = with self; [ ocaml (self.js_of_ocaml or null) ];
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
  ocaml-syntax-shims = {
    name = "ocaml-syntax-shims";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-syntax-shims/releases/download/1.0.0/ocaml-syntax-shims-1.0.0.tbz";
      sha256 = "89b2e193e90a0c168b6ec5ddf6fef09033681bdcb64e11913c97440a2722e8c8";
    };
    opam = "${repo}/packages/ocaml-syntax-shims/ocaml-syntax-shims.1.0.0/opam";
    depends = with self; [ dune ocaml ];
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
  ocamlgraph = {
    name = "ocamlgraph";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
      sha256 = "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
    };
    opam = "${repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
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
  optint = {
    name = "optint";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/optint/releases/download/v0.2.0/optint-0.2.0.tbz";
      sha256 = "1dcbe0b6b6031f77db33028c87138fdb3bf90f92915e3b6629ddeb30a0d3000b";
    };
    opam = "${repo}/packages/optint/optint.0.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ppx_irmin = {
    name = "ppx_irmin";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/ppx_irmin/ppx_irmin.3.2.2/opam";
    depends = with self; [ dune logs ocaml ppx_repr ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_repr = {
    name = "ppx_repr";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
      sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
    };
    opam = "${repo}/packages/ppx_repr/ppx_repr.0.6.0/opam";
    depends = with self; [ dune fmt ppx_deriving ppxlib repr ];
    buildDepends = with self; [ dune ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.26.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.26.0/ppxlib-0.26.0.tbz";
      sha256 = "63117b67ea5863935455fe921f88fe333c0530f0483f730313303a93af817efd";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.26.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs ppx_derivers
                           sexplib0 stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  printbox = {
    name = "printbox";
    version = "0.6.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/printbox/archive/v0.6.1.tar.gz";
      sha512 = "7c0882333d2b297c235ee73f09e8b95cdd6013909db0f1b7e07a1b90153e6a3e68249715c90030e033ced6ab3a40aab41d4470d686164676acb544ccbe6ba715";
    };
    opam = "${repo}/packages/printbox/printbox.0.6.1/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  printbox-text = {
    name = "printbox-text";
    version = "0.6.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/printbox/archive/v0.6.1.tar.gz";
      sha512 = "7c0882333d2b297c235ee73f09e8b95cdd6013909db0f1b7e07a1b90153e6a3e68249715c90030e033ced6ab3a40aab41d4470d686164676acb544ccbe6ba715";
    };
    opam = "${repo}/packages/printbox-text/printbox-text.0.6.1/opam";
    depends = with self; [ base-bytes dune ocaml printbox uucp uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  progress = {
    name = "progress";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/CraigFe/progress/releases/download/0.2.1/terminal-0.2.1.tbz";
      sha256 = "7ae7f5c5a2db88107d0b3fd37d5344f066921270a3e74d56dd13457feb9e586e";
    };
    opam = "${repo}/packages/progress/progress.0.2.1/opam";
    depends = with self; [ dune fmt logs mtime ocaml optint terminal uucp
                           uutf vector ];
    buildDepends = with self; [ dune ocaml ];
  };
  psq = {
    name = "psq";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/psq/releases/download/v0.2.0/psq-v0.2.0.tbz";
      sha256 = "1j4lqkq17rskhgcrpgr4n1m1a2b1x35mlxj6f9g05rhpmgvgvknk";
    };
    opam = "${repo}/packages/psq/psq.0.2.0/opam";
    depends = with self; [ dune ocaml seq ];
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
  repr = {
    name = "repr";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
      sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
    };
    opam = "${repo}/packages/repr/repr.0.6.0/opam";
    depends = with self; [ base64 dune either fmt jsonm ocaml optint uutf ];
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
  rusage = {
    name = "rusage";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/CraigFe/ocaml-rusage/releases/download/1.0.0/rusage-1.0.0.tbz";
      sha256 = "3a0600d857b5828aa868e4b8e59e8504934d60dfeeabe290a14c06f0a4a8e859";
    };
    opam = "${repo}/packages/rusage/rusage.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
  };
  semaphore-compat = {
    name = "semaphore-compat";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/semaphore-compat/releases/download/1.0.1/semaphore-compat-1.0.1.tbz";
      sha256 = "2b771ff5bdcc658404ab6029415b0f7404817287bb7bcf990caf91db7a2e2c8d";
    };
    opam = "${repo}/packages/semaphore-compat/semaphore-compat.1.0.1/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
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
  terminal = {
    name = "terminal";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/CraigFe/progress/releases/download/0.2.1/terminal-0.2.1.tbz";
      sha256 = "7ae7f5c5a2db88107d0b3fd37d5344f066921270a3e74d56dd13457feb9e586e";
    };
    opam = "${repo}/packages/terminal/terminal.0.2.1/opam";
    depends = with self; [ dune ocaml stdlib-shims uucp uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-base58 = {
    name = "tezos-base58";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/tarides/tezos-base58/releases/download/1.0.0/tezos-base58-1.0.0.tbz";
      sha256 = "aa99e1c25e3394cc8b01daeba54369f376348553fd2254beedd5f8569cbb8293";
    };
    opam = "${repo}/packages/tezos-base58/tezos-base58.1.0.0/opam";
    depends = with self; [ digestif dune fmt zarith ];
    buildDepends = with self; [ dune ];
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
  uchar = {
    name = "uchar";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/uchar/releases/download/v0.0.2/uchar-0.0.2.tbz";
      sha256 = "1w2saw7zanf9m9ffvz2lvcxvlm118pws2x1wym526xmydhqpyfa7";
    };
    opam = "${repo}/packages/uchar/uchar.0.0.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  uri = {
    name = "uri";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
      sha256 = "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
    };
    opam = "${repo}/packages/uri/uri.4.2.0/opam";
    depends = with self; [ angstrom dune ocaml stringext ];
    buildDepends = with self; [ dune ocaml ];
  };
  uucp = {
    name = "uucp";
    version = "14.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uucp/releases/uucp-14.0.0.tbz";
      sha512 = "2d0224aed5d5accbb121624898f08598e8c74a2415942f159a54221c0cdac62ed64fc70a039c833e50110cefce77754ada9ac2d58f79a6fc9331135326fe6899";
    };
    opam = "${repo}/packages/uucp/uucp.14.0.0/opam";
    depends = with self; [ ocaml (self.cmdliner or null) (self.uunf or null)
                           (self.uutf or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  uuidm = {
    name = "uuidm";
    version = "0.9.7";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uuidm/releases/uuidm-0.9.7.tbz";
      sha256 = "1ivxb3hxn9bk62rmixx6px4fvn52s4yr1bpla7rgkcn8981v45r8";
    };
    opam = "${repo}/packages/uuidm/uuidm.0.9.7/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  uutf = {
    name = "uutf";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uutf/releases/uutf-1.0.3.tbz";
      sha512 = "50cc4486021da46fb08156e9daec0d57b4ca469b07309c508d5a9a41e9dbcf1f32dec2ed7be027326544453dcaf9c2534919395fd826dc7768efc6cc4bfcc9f8";
    };
    opam = "${repo}/packages/uutf/uutf.1.0.3/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  vector = {
    name = "vector";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/vector/releases/download/1.0.0/vector-1.0.0.tbz";
      sha256 = "f212d1d693ce37deb0da2550aab8d550ad5ea457c5757dc02f8ca8a66ebe6641";
    };
    opam = "${repo}/packages/vector/vector.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  zarith = {
    name = "zarith";
    version = "1.12";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/Zarith/archive/release-1.12.tar.gz";
      sha512 = "8075573ae65579a2606b37dd1b213032a07d220d28c733f9288ae80d36f8a2cc4d91632806df2503c130ea9658dc207ee3a64347c21aa53969050a208f5b2bb4";
    };
    opam = "${repo}/packages/zarith/zarith.1.12/opam";
    depends = with self; [ conf-gmp ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
