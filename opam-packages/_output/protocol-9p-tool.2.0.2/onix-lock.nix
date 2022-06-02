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
  base = {
    name = "base";
    version = "v0.14.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base/archive/v0.14.3.tar.gz";
      sha256 = "e34dc0dd052a386c84f5f67e71a90720dff76e0edd01f431604404bee86ebe5a";
    };
    opam = "${repo}/packages/base/base.v0.14.3/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
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
  camomile = {
    name = "camomile";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/yoriyuki/Camomile/releases/download/1.0.2/camomile-1.0.2.tbz";
      sha256 = "f0a419b0affc36500f83b086ffaa36c545560cee5d57e84b729e8f851b3d1632";
    };
    opam = "${repo}/packages/camomile/camomile.1.0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  charInfo_width = {
    name = "charInfo_width";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/charInfo_width/archive/1.1.0.tar.gz";
      sha256 = "0wl1hcwbx2mmgbhwh1wwgjixvppjq0k43nqyq13xm4pvgdxfvci1";
    };
    opam = "${repo}/packages/charInfo_width/charInfo_width.1.1.0/opam";
    depends = with self; [ camomile dune ocaml result ];
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
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.6.1.0/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-sexp = {
    name = "cstruct-sexp";
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${repo}/packages/cstruct-sexp/cstruct-sexp.6.1.0/opam";
    depends = with self; [ cstruct dune ocaml sexplib ];
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
  io-page = {
    name = "io-page";
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/io-page/releases/download/v2.3.0/io-page-v2.3.0.tbz";
      sha256 = "9605a8a03e53bc12682212c371bc477f2a44ed829725ae38cc3005e2f83da2c3";
    };
    opam = "${repo}/packages/io-page/io-page.2.3.0/opam";
    depends = with self; [ bigarray-compat cstruct dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  io-page-unix = {
    name = "io-page-unix";
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/io-page/releases/download/v2.3.0/io-page-v2.3.0.tbz";
      sha256 = "9605a8a03e53bc12682212c371bc477f2a44ed829725ae38cc3005e2f83da2c3";
    };
    opam = "${repo}/packages/io-page-unix/io-page-unix.2.3.0/opam";
    depends = with self; [ cstruct dune io-page ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  lambda-term = {
    name = "lambda-term";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/lambda-term/releases/download/3.2.0/lambda-term-3.2.0.tar.gz";
      sha512 = "46cd46f47c9f34c0a5e096b96e6eec59667b645bf5201140e498e6d4eb9baba8204a2b30b73c4b2f8140e5cf1972a56e3aa485b27bc5ace25b2c368f713ad7c4";
    };
    opam = "${repo}/packages/lambda-term/lambda-term.3.2.0/opam";
    depends = with self; [ camomile dune lwt lwt_log lwt_react mew_vi ocaml
                           react zed ];
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
  lwt_log = {
    name = "lwt_log";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/lwt_log/archive/1.1.1.tar.gz";
      sha256 = "0gszc8nvk2hpfq47plb36qahlnyfq28sa9mhicnf6mg5c7n1kyql";
    };
    opam = "${repo}/packages/lwt_log/lwt_log.1.1.1/opam";
    depends = with self; [ dune lwt ];
    buildDepends = with self; [ dune ];
  };
  lwt_react = {
    name = "lwt_react";
    version = "1.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt_react/lwt_react.1.1.5/opam";
    depends = with self; [ dune lwt ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew = {
    name = "mew";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/mew/archive/0.1.0.tar.gz";
      sha256 = "1rjri9mgfb9gn9fmjn0ax21y9jd9wkvr7mmx2jrlqmzgabmqrlv4";
    };
    opam = "${repo}/packages/mew/mew.0.1.0/opam";
    depends = with self; [ dune ocaml result trie ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew_vi = {
    name = "mew_vi";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/mew_vi/archive/0.5.0.tar.gz";
      sha256 = "1nmg3cysglgw4115n5zpz4azrfbnfxkn2kvw73chzs69viygm4m6";
    };
    opam = "${repo}/packages/mew_vi/mew_vi.0.5.0/opam";
    depends = with self; [ dune mew ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-channel = {
    name = "mirage-channel";
    version = "4.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-channel/releases/download/v4.1.0/mirage-channel-4.1.0.tbz";
      sha256 = "b0176851d4ddf5978d7072b420118178e6030ea50b33b1185fe3f3d9fda72100";
    };
    opam = "${repo}/packages/mirage-channel/mirage-channel.4.1.0/opam";
    depends = with self; [ cstruct dune logs lwt mirage-flow ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-flow = {
    name = "mirage-flow";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-flow/releases/download/v3.0.0/mirage-flow-v3.0.0.tbz";
      sha256 = "d70bda6c85ec2747bed88bc4d95f269d2810503b92913f0807be5291696138fc";
    };
    opam = "${repo}/packages/mirage-flow/mirage-flow.3.0.0/opam";
    depends = with self; [ cstruct dune fmt lwt ocaml ];
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
  num = {
    name = "num";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
      sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
    };
    opam = "${repo}/packages/num/num.1.4/opam";
    depends = with self; [ ocaml ];
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
  parsexp = {
    name = "parsexp";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/parsexp/archive/refs/tags/v0.14.2.tar.gz";
      sha256 = "f6e17e4e08dcdce08a6372485a381dcdb3fda0f71b4506d7be982b87b5a1f230";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.14.2/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
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
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.14.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/v0.14.3.tar.gz";
      sha256 = "0fbnkhsd6yphc49pa21nlmbik99n7qkaz8l9paq96v012ipg9h9g";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.14.3/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
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
  protocol-9p = {
    name = "protocol-9p";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-9p/releases/download/2.0.2/protocol-9p-2.0.2.tbz";
      sha256 = "a4c0585e81f5c57c879560318016aeb022163044f2c7ae086af3dfcbbe1b8164";
    };
    opam = "${repo}/packages/protocol-9p/protocol-9p.2.0.2/opam";
    depends = with self; [ astring base-bytes cstruct cstruct-sexp dune fmt
                           logs lwt mirage-channel mirage-flow ocaml
                           ppx_sexp_conv rresult sexplib win-error ];
    buildDepends = with self; [ dune ocaml ];
  };
  protocol-9p-tool = {
    name = "protocol-9p-tool";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-9p/releases/download/2.0.2/protocol-9p-2.0.2.tbz";
      sha256 = "a4c0585e81f5c57c879560318016aeb022163044f2c7ae086af3dfcbbe1b8164";
    };
    opam = "${repo}/packages/protocol-9p-tool/protocol-9p-tool.2.0.2/opam";
    depends = with self; [ base-bytes cmdliner cstruct dune fmt lambda-term
                           logs ocaml protocol-9p protocol-9p-unix rresult
                           win-error ];
    buildDepends = with self; [ dune ocaml ];
  };
  protocol-9p-unix = {
    name = "protocol-9p-unix";
    version = "2.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-9p/releases/download/2.0.2/protocol-9p-2.0.2.tbz";
      sha256 = "a4c0585e81f5c57c879560318016aeb022163044f2c7ae086af3dfcbbe1b8164";
    };
    opam = "${repo}/packages/protocol-9p-unix/protocol-9p-unix.2.0.2/opam";
    depends = with self; [ astring base-bytes base-unix cstruct cstruct-lwt
                           dune fmt io-page-unix lwt mirage-flow ocaml
                           ppx_sexp_conv prometheus protocol-9p rresult
                           sexplib win-error ];
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
  react = {
    name = "react";
    version = "1.2.2";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/react/releases/react-1.2.2.tbz";
      sha512 = "18cdd544d484222ba02db6bd9351571516532e7a1c107b59bbe39193837298f5c745eab6754f8bc6ff125b387be7018c6d6e6ac99f91925a5e4f53af688522b1";
    };
    opam = "${repo}/packages/react/react.1.2.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  sexplib = {
    name = "sexplib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib-v0.14.0.tar.gz";
      sha256 = "12rlnc6fcrjfdn3gs2agi418sj54ighhs6dfll37zcv7mgywblm2";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.14.0/opam";
    depends = with self; [ dune num ocaml parsexp sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib0-v0.14.0.tar.gz";
      sha256 = "0adrc0r1vvvr41dcpj8jwkzh1dfgqf0mks9xlnnskqfm3a51iavg";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.14.0/opam";
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
  trie = {
    name = "trie";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/trie/archive/1.0.0.tar.gz";
      sha256 = "1slq4kiwnc723dsaw15ms7xxpqz061v8zck1m6iyc5j2li70by62";
    };
    opam = "${repo}/packages/trie/trie.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  win-error = {
    name = "win-error";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-win-error/releases/download/1.0/win-error-1.0.tbz";
      sha256 = "005464i1xp0pf7ya2fqgfvj48smfalijwi5asb16mkdifv3yq2n0";
    };
    opam = "${repo}/packages/win-error/win-error.1.0/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  zed = {
    name = "zed";
    version = "3.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/zed/archive/3.1.0.tar.gz";
      sha256 = "1z95fs49hi00xy078a83m0vfdqwjb5953rwr15lfpirldi4v11y3";
    };
    opam = "${repo}/packages/zed/zed.3.1.0/opam";
    depends = with self; [ base-bytes camomile charInfo_width dune ocaml
                           react ];
    buildDepends = with self; [ dune ocaml ];
  };
}
