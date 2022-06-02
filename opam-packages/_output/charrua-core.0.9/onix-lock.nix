{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base = {
    name = "base";
    version = "v0.13.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base/archive/v0.13.2.tar.gz";
      sha256 = "0nndylkdwkndg4b6bb7g5iix2cbjxaiwnybpr4c88cpc8qd7cpgw";
    };
    opam = "${repo}/packages/base/base.v0.13.2/opam";
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
  charrua-core = {
    name = "charrua-core";
    version = "0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/charrua-core/releases/download/v0.9/charrua-core-0.9.tbz";
      sha256 = "0m6l4zjipar4n1p6ap4hp7rrmqg0mxfbp9b49h6fn55wcvkr6fy7";
    };
    opam = "${repo}/packages/charrua-core/charrua-core.0.9/opam";
    depends = with self; [ cstruct ipaddr jbuilder ocaml ppx_cstruct
                           ppx_sexp_conv rresult sexplib tcpip ];
    buildDepends = with self; [ menhir ocaml ];
  };
  configurator = {
    name = "configurator";
    version = "v0.11.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.11/files/configurator-v0.11.0.tar.gz";
      sha256 = "0kwgi3sh92v4n242dk5hgpwd85zzgnczgbkqi0q0kr6m93zgbf7p";
    };
    opam = "${repo}/packages/configurator/configurator.v0.11.0/opam";
    depends = with self; [ base jbuilder ocaml stdio ];
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
  cstruct = {
    name = "cstruct";
    version = "3.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v3.7.0/cstruct-v3.7.0.tbz";
      sha256 = "0c6kw3dqx7skrc2v883f2slq1javbcmw173vlmsbygkk4y3m0d2c";
    };
    opam = "${repo}/packages/cstruct/cstruct.3.7.0/opam";
    depends = with self; [ dune ocaml sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "3.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v3.7.0/cstruct-v3.7.0.tbz";
      sha256 = "0c6kw3dqx7skrc2v883f2slq1javbcmw173vlmsbygkk4y3m0d2c";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.3.7.0/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ipaddr = {
    name = "ipaddr";
    version = "2.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/2.9.0/ipaddr-2.9.0.tbz";
      sha256 = "1jamvfark2dvgpljlcm92gjhiwjj8h17k0f7b337r4djn2i9yph4";
    };
    opam = "${repo}/packages/ipaddr/ipaddr.2.9.0/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ppx_sexp_conv
                           sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  jbuilder = {
    name = "jbuilder";
    version = "transition";
    opam = "${repo}/packages/jbuilder/jbuilder.transition/opam";
    depends = with self; [ dune ocaml ];
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
    version = "4.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/4.5.0.tar.gz";
      sha256 = "11k1g118wq093zc5a93dnvdzmp09xvg0k7ayjwnq01div1f88zg0";
    };
    opam = "${repo}/packages/lwt/lwt.4.5.0/opam";
    depends = with self; [ dune dune-configurator mmap ocaml ocplib-endian
                           result seq (self.base-threads or null)
                           (self.base-unix or null) (self.conf-libev or null) ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  menhir = {
    name = "menhir";
    version = "20190924";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20190924/archive.tar.gz";
      sha512 = "ea8a9a6d773529cf6ac05e4c6c4532770fbb8e574c9b646efcefe90d9f24544741e3e8cfd94c8afea0447e34059a8c79c2829b46764ce3a3d6dcb3e7f75980fc";
    };
    opam = "${repo}/packages/menhir/menhir.20190924/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  mirage-clock = {
    name = "mirage-clock";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-clock/releases/download/v2.0.0/mirage-clock-v2.0.0.tbz";
      sha256 = "15yim4gy9wbzhz45fbixi1ncqiaks72f019n66l1zkkb3fafjddf";
    };
    opam = "${repo}/packages/mirage-clock/mirage-clock.2.0.0/opam";
    depends = with self; [ dune dune-configurator mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-clock-lwt = {
    name = "mirage-clock-lwt";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-clock/releases/download/v2.0.0/mirage-clock-v2.0.0.tbz";
      sha256 = "15yim4gy9wbzhz45fbixi1ncqiaks72f019n66l1zkkb3fafjddf";
    };
    opam = "${repo}/packages/mirage-clock-lwt/mirage-clock-lwt.2.0.0/opam";
    depends = with self; [ dune dune-configurator lwt mirage-clock ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-device = {
    name = "mirage-device";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-device/releases/download/v1.2.0/mirage-device-v1.2.0.tbz";
      sha256 = "0qqi5nqsi4ldnn0j47vh37ipyjfw0w0igixp38yj3nx0gpb1wk2g";
    };
    opam = "${repo}/packages/mirage-device/mirage-device.1.2.0/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-flow = {
    name = "mirage-flow";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-flow/releases/download/v1.6.0/mirage-flow-v1.6.0.tbz";
      sha256 = "d6596e9bd2442023a3b2222db0a36fd6a97318e06853162c9938d9fab8cc63d3";
    };
    opam = "${repo}/packages/mirage-flow/mirage-flow.1.6.0/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-net = {
    name = "mirage-net";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-net/releases/download/v1.2.0/mirage-net-1.2.0.tbz";
      sha256 = "1bk4ns955hrs4clp7lzsk19svq2dbn0njfla41jl2a60991ajxay";
    };
    opam = "${repo}/packages/mirage-net/mirage-net.1.2.0/opam";
    depends = with self; [ fmt jbuilder mirage-device ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  mirage-net-lwt = {
    name = "mirage-net-lwt";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-net/releases/download/v1.1.0/mirage-net-1.1.0.tbz";
      sha256 = "1w2z65laz1p1mk9hmmwi7rs6ankcsiffwjn8qyx0m08irxsvxdy4";
    };
    opam = "${repo}/packages/mirage-net-lwt/mirage-net-lwt.1.1.0/opam";
    depends = with self; [ cstruct io-page ipaddr jbuilder lwt mirage-net
                           ocaml result ];
    buildDepends = with self; [ ocaml topkg ];
  };
  mirage-profile = {
    name = "mirage-profile";
    version = "0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-profile/releases/download/v0.9.1/mirage-profile-v0.9.1.tbz";
      sha256 = "2bb6cf03c73c6f45dedc34365c9131b8bdda62390b04d26eb76793a6422a0352";
    };
    opam = "${repo}/packages/mirage-profile/mirage-profile.0.9.1/opam";
    depends = with self; [ cstruct dune lwt ocaml ocplib-endian ];
    buildDepends = with self; [ dune ocaml ppx_cstruct ];
  };
  mirage-protocols = {
    name = "mirage-protocols";
    version = "1.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-protocols/releases/download/v1.4.1/mirage-protocols-1.4.1.tbz";
      sha256 = "1fvinjrp0r73g8wq1yrra83g1glpna99mzj2djlbj0wphhg45w9w";
    };
    opam = "${repo}/packages/mirage-protocols/mirage-protocols.1.4.1/opam";
    depends = with self; [ duration fmt jbuilder mirage-device mirage-flow
                           ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  mirage-protocols-lwt = {
    name = "mirage-protocols-lwt";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-protocols/releases/download/v1.4.0/mirage-protocols-1.4.0.tbz";
      sha256 = "1g7w2d7f8xynp5xkinx5fx7kcy86shlnv752j6d5izc986vsqsmv";
    };
    opam = "${repo}/packages/mirage-protocols-lwt/mirage-protocols-lwt.1.4.0/opam";
    depends = with self; [ cstruct ipaddr jbuilder lwt mirage-protocols ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  mirage-random = {
    name = "mirage-random";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-random/releases/download/v1.2.0/mirage-random-v1.2.0.tbz";
      sha256 = "0c1z8arda4lg18fd2srvy0fh86clbqf5ppsznrbdppmm3kwgj5l0";
    };
    opam = "${repo}/packages/mirage-random/mirage-random.1.2.0/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-stack = {
    name = "mirage-stack";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-stack/releases/download/v1.4.0/mirage-stack-v1.4.0.tbz";
      sha256 = "062djy9rma6j23x5h8cj65pi0wj4g6ikm2r4p9imcvnbhran3s58";
    };
    opam = "${repo}/packages/mirage-stack/mirage-stack.1.4.0/opam";
    depends = with self; [ dune fmt mirage-device mirage-protocols ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-stack-lwt = {
    name = "mirage-stack-lwt";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-stack/releases/download/v1.4.0/mirage-stack-v1.4.0.tbz";
      sha256 = "062djy9rma6j23x5h8cj65pi0wj4g6ikm2r4p9imcvnbhran3s58";
    };
    opam = "${repo}/packages/mirage-stack-lwt/mirage-stack-lwt.1.4.0/opam";
    depends = with self; [ cstruct dune ipaddr lwt mirage-stack ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-time = {
    name = "mirage-time";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-time/releases/download/v1.3.0/mirage-time-v1.3.0.tbz";
      sha256 = "8e50db9fa71526468da45790da996589a6331a8f090ed2ba3d5d3607ad67773a";
    };
    opam = "${repo}/packages/mirage-time/mirage-time.1.3.0/opam";
    depends = with self; [ dune mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-time-lwt = {
    name = "mirage-time-lwt";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-time/releases/download/v1.3.0/mirage-time-v1.3.0.tbz";
      sha256 = "8e50db9fa71526468da45790da996589a6331a8f090ed2ba3d5d3607ad67773a";
    };
    opam = "${repo}/packages/mirage-time-lwt/mirage-time-lwt.1.3.0/opam";
    depends = with self; [ dune lwt mirage-time ocaml ];
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
    version = "4.10.2";
    opam = "${repo}/packages/ocaml/ocaml.4.10.2/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.10.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.10.2.tar.gz";
      sha256 = "7aa26e0d70f36f0338df92cf5aaeb2704f3443bfe910a3d02a5dca9162f1d866";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.10.2/opam";
  };
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.12.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.3/ocaml-compiler-libs-v0.12.3.tbz";
      sha256 = "a8403531439c14bbda2d504ef93610fd29a8e9520fc700f21889d893a513e3c9";
    };
    opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-migrate-parsetree = {
    name = "ocaml-migrate-parsetree";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-migrate-parsetree/releases/download/v1.8.0/ocaml-migrate-parsetree-v1.8.0.tbz";
      sha256 = "b1c2d176ff1444041f2775786ba605be796e46dfd2acb06c96f35d2bb88b8fb5";
    };
    opam = "${repo}/packages/ocaml-migrate-parsetree/ocaml-migrate-parsetree.1.8.0/opam";
    depends = with self; [ dune ocaml ppx_derivers result ];
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
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/parsexp-v0.13.0.tar.gz";
      sha256 = "0m144jj63nmw4j88gbmrmkfr3f5bciln00gz1n13h61s6rzz01nq";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.13.0/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cstruct = {
    name = "ppx_cstruct";
    version = "3.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v3.7.0/cstruct-v3.7.0.tbz";
      sha256 = "0c6kw3dqx7skrc2v883f2slq1javbcmw173vlmsbygkk4y3m0d2c";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.3.7.0/opam";
    depends = with self; [ cstruct dune ocaml ocaml-migrate-parsetree
                           ppx_tools_versioned ];
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
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_sexp_conv-v0.13.0.tar.gz";
      sha256 = "0yppy47zjn8nb73lnk4d3lhpmcia1rr8bka56n32sla4yz1y148n";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_tools_versioned = {
    name = "ppx_tools_versioned";
    version = "5.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools_versioned/archive/5.4.0.tar.gz";
      sha256 = "0sw2676vgbsj133lgs3sl8494fhfldafzvgw4j4dnb1wqwha6pxy";
    };
    opam = "${repo}/packages/ppx_tools_versioned/ppx_tools_versioned.5.4.0/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.15.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.15.0/ppxlib-0.15.0.tbz";
      sha256 = "0b630d7f8d74a899a55cc27188b5ce03e735a93f07ea0c2de56532d8fd93b330";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.15.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs
                           ocaml-migrate-parsetree ppx_derivers sexplib0
                           stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  randomconv = {
    name = "randomconv";
    version = "0.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/randomconv/releases/download/v0.1.3/randomconv-v0.1.3.tbz";
      sha256 = "9b286aaac68fe3e5f69ed34115153ce74c613270a534b04642bae35934c863c7";
    };
    opam = "${repo}/packages/randomconv/randomconv.0.1.3/opam";
    depends = with self; [ cstruct dune ocaml ];
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
  sexplib = {
    name = "sexplib";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/sexplib-v0.13.0.tar.gz";
      sha256 = "0sfn9i7wydphkqg3156ck0wlibj9mm8w3j52jrgh2qgqgwq3h13v";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.13.0/opam";
    depends = with self; [ dune num ocaml parsexp sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/sexplib0-v0.13.0.tar.gz";
      sha256 = "08g0w2gnn682c6a82d22b4yv70j7i2vgk0z5imca6nly3ddgdhj3";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.13.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/stdio-v0.13.0.tar.gz";
      sha256 = "0bb60kb027nfdh5ah76nwy0q3zcdsqydglly61kx7a12yjlcgvwm";
    };
    opam = "${repo}/packages/stdio/stdio.v0.13.0/opam";
    depends = with self; [ base dune ocaml ];
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
  tcpip = {
    name = "tcpip";
    version = "3.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-tcpip/releases/download/v3.5.1/tcpip-v3.5.1.tbz";
      sha256 = "17f3gpy3l97hyklh7c0dfkh294p31755fznjncrrcjmgh47zkxk4";
    };
    opam = "${repo}/packages/tcpip/tcpip.3.5.1/opam";
    depends = with self; [ cstruct cstruct-lwt duration fmt io-page-unix
                           ipaddr jbuilder logs lwt mirage-clock
                           mirage-clock-lwt mirage-net mirage-net-lwt
                           mirage-profile mirage-protocols
                           mirage-protocols-lwt mirage-random
                           mirage-stack-lwt mirage-time-lwt ocaml
                           ocaml-migrate-parsetree randomconv rresult
                           (self.mirage-xen-ocaml or null) ];
    buildDepends = with self; [ configurator ocaml ];
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
}
