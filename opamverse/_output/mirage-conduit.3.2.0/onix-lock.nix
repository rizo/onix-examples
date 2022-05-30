{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  asn1-combinators = {
    name = "asn1-combinators";
    version = "0.2.5";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-asn1-combinators/releases/download/v0.2.5/asn1-combinators-v0.2.5.tbz";
      sha256 = "96f2590a518aa3a57d43f989db83812717399d6467892d43bbce42112a6f6cdd";
    };
    opam = "${repo}/packages/asn1-combinators/asn1-combinators.0.2.5/opam";
    depends = with self; [ bigarray-compat cstruct dune ocaml ptime
                           stdlib-shims zarith ];
    buildDepends = with self; [ dune ocaml ];
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
  conduit = {
    name = "conduit";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/releases/download/v5.1.0/conduit-5.1.0.tbz";
      sha256 = "e51c8c3e879cbbe9e09989b00595093832dc86642088072e03e5a59a2a2391cd";
    };
    opam = "${repo}/packages/conduit/conduit.5.1.0/opam";
    depends = with self; [ astring dune ipaddr ipaddr-sexp logs ocaml
                           ppx_sexp_conv sexplib uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  conduit-lwt = {
    name = "conduit-lwt";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/releases/download/v5.1.0/conduit-5.1.0.tbz";
      sha256 = "e51c8c3e879cbbe9e09989b00595093832dc86642088072e03e5a59a2a2391cd";
    };
    opam = "${repo}/packages/conduit-lwt/conduit-lwt.5.1.0/opam";
    depends = with self; [ base-unix conduit dune lwt ocaml ppx_sexp_conv
                           sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
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
  cpuid = {
    name = "cpuid";
    version = "0.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/cpuid/releases/download/v0.1.2/cpuid-v0.1.2.tbz";
      sha256 = "08ng4mva6qblb5ipkrxbr0my7ndkc4qwcbswkqgbgir864s74m93";
    };
    opam = "${repo}/packages/cpuid/cpuid.0.1.2/opam";
    depends = with self; [ dune ocaml ];
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
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct/cstruct.5.2.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.5.2.0/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-sexp = {
    name = "cstruct-sexp";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct-sexp/cstruct-sexp.5.2.0/opam";
    depends = with self; [ cstruct dune ocaml sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  dns = {
    name = "dns";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v1.1.3/dns-v1.1.3.tbz";
      sha256 = "17a3b507d7c1848f14ba213397bcc5df3967bbb9792ec6c650ea5dd9feb5456a";
    };
    opam = "${repo}/packages/dns/dns.1.1.3/opam";
    depends = with self; [ base64 cstruct domain-name dune hashcons ipaddr
                           ocaml ppx_cstruct re result uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  dns-lwt = {
    name = "dns-lwt";
    version = "1.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v1.1.3/dns-v1.1.3.tbz";
      sha256 = "17a3b507d7c1848f14ba213397bcc5df3967bbb9792ec6c650ea5dd9feb5456a";
    };
    opam = "${repo}/packages/dns-lwt/dns-lwt.1.1.3/opam";
    depends = with self; [ dns dune lwt mirage-profile ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  domain-name = {
    name = "domain-name";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/domain-name/releases/download/v0.4.0/domain-name-0.4.0.tbz";
      sha256 = "a5c06e22845895201973e812fe3019274d1db81c0a7873da6c8007c4ad2108c5";
    };
    opam = "${repo}/packages/domain-name/domain-name.0.4.0/opam";
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
  gmap = {
    name = "gmap";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/gmap/releases/download/0.3.0/gmap-0.3.0.tbz";
      sha256 = "04dd9e6226ac8f8fb4ccb6021048702e34a482fb9c1d240d3852829529507c1c";
    };
    opam = "${repo}/packages/gmap/gmap.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  hashcons = {
    name = "hashcons";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocaml-hashcons/archive/1.3.tar.gz";
      sha256 = "1kkjbm5dnvnf58bh0hqxm0yjvdc0l7n9k46l9mlpr9lfyik2kisr";
    };
    opam = "${repo}/packages/hashcons/hashcons.1.3/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ conf-autoconf conf-which ocaml ocamlfind ];
  };
  io-page = {
    name = "io-page";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/io-page/releases/download/v3.0.0/io-page-3.0.0.tbz";
      sha256 = "0e36ca74d9056ba6108090cb98bb2ebf2af079be3f4cdbea022820723ff786ee";
    };
    opam = "${repo}/packages/io-page/io-page.3.0.0/opam";
    depends = with self; [ cstruct dune ocaml
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  ipaddr = {
    name = "ipaddr";
    version = "5.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.0/ipaddr-5.3.0.tbz";
      sha256 = "36979edf64b464d44055f3504b97d61e22050e7369d983052c4ecc3d2b1ab755";
    };
    opam = "${repo}/packages/ipaddr/ipaddr.5.3.0/opam";
    depends = with self; [ domain-name dune macaddr ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  ipaddr-sexp = {
    name = "ipaddr-sexp";
    version = "5.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.0/ipaddr-5.3.0.tbz";
      sha256 = "36979edf64b464d44055f3504b97d61e22050e7369d983052c4ecc3d2b1ab755";
    };
    opam = "${repo}/packages/ipaddr-sexp/ipaddr-sexp.5.3.0/opam";
    depends = with self; [ dune ipaddr ocaml ppx_sexp_conv sexplib0 ];
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
  macaddr = {
    name = "macaddr";
    version = "5.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.0/ipaddr-5.3.0.tbz";
      sha256 = "36979edf64b464d44055f3504b97d61e22050e7369d983052c4ecc3d2b1ab755";
    };
    opam = "${repo}/packages/macaddr/macaddr.5.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  mirage-conduit = {
    name = "mirage-conduit";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/releases/download/v1.5.0/conduit-v1.5.0.tbz";
      sha256 = "06b6476ba4d8caf4cbfccbf7fd181cb2e5fe459e5e8e4992617fd2d7bebcbfd1";
    };
    opam = "${repo}/packages/mirage-conduit/mirage-conduit.3.2.0/opam";
    depends = with self; [ conduit-lwt cstruct dune ipaddr ipaddr-sexp
                           mirage-dns mirage-flow-lwt mirage-stack-lwt
                           mirage-time-lwt ocaml ppx_sexp_conv sexplib tls
                           vchan xenstore ];
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
  mirage-dns = {
    name = "mirage-dns";
    version = "3.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v1.1.3/dns-v1.1.3.tbz";
      sha256 = "17a3b507d7c1848f14ba213397bcc5df3967bbb9792ec6c650ea5dd9feb5456a";
    };
    opam = "${repo}/packages/mirage-dns/mirage-dns.3.1.3/opam";
    depends = with self; [ dns-lwt dune duration mirage-kv-lwt mirage-profile
                           mirage-stack-lwt mirage-time-lwt ocaml ];
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
  mirage-flow-lwt = {
    name = "mirage-flow-lwt";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-flow/releases/download/v1.6.0/mirage-flow-v1.6.0.tbz";
      sha256 = "d6596e9bd2442023a3b2222db0a36fd6a97318e06853162c9938d9fab8cc63d3";
    };
    opam = "${repo}/packages/mirage-flow-lwt/mirage-flow-lwt.1.6.0/opam";
    depends = with self; [ cstruct dune fmt logs lwt mirage-clock mirage-flow
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-kv = {
    name = "mirage-kv";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-kv/releases/download/v2.0.0/mirage-kv-v2.0.0.tbz";
      sha256 = "0g7mrmhklhakcaq36nf65a2cpf9ag0svsiw310k2iq1kvizyizpj";
    };
    opam = "${repo}/packages/mirage-kv/mirage-kv.2.0.0/opam";
    depends = with self; [ dune fmt mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-kv-lwt = {
    name = "mirage-kv-lwt";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-kv/releases/download/v2.0.0/mirage-kv-v2.0.0.tbz";
      sha256 = "0g7mrmhklhakcaq36nf65a2cpf9ag0svsiw310k2iq1kvizyizpj";
    };
    opam = "${repo}/packages/mirage-kv-lwt/mirage-kv-lwt.2.0.0/opam";
    depends = with self; [ cstruct dune lwt mirage-kv ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-net = {
    name = "mirage-net";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-net/releases/download/v2.0.0/mirage-net-v2.0.0.tbz";
      sha256 = "035lccz7lkzc5dky926qmpj7hpa4q0qd11lw7z4m7brrhqgvg30v";
    };
    opam = "${repo}/packages/mirage-net/mirage-net.2.0.0/opam";
    depends = with self; [ dune fmt mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-no-solo5 = {
    name = "mirage-no-solo5";
    version = "1";
    opam = "${repo}/packages/mirage-no-solo5/mirage-no-solo5.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  mirage-no-xen = {
    name = "mirage-no-xen";
    version = "1";
    opam = "${repo}/packages/mirage-no-xen/mirage-no-xen.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
    version = "3.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-protocols/releases/download/v3.1.0/mirage-protocols-v3.1.0.tbz";
      sha256 = "d4087ca630321a723509c17253e4e88a506cd18fdf8792294a1a6e022c6ac029";
    };
    opam = "${repo}/packages/mirage-protocols/mirage-protocols.3.1.0/opam";
    depends = with self; [ dune duration fmt mirage-device mirage-flow
                           mirage-net ocaml ];
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
  nocrypto = {
    name = "nocrypto";
    version = "0.5.4+2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-nocrypto/releases/download/v0.5.4/nocrypto-0.5.4.tbz";
      sha256 = "0zshi9hlhcz61n5z1k6fx6rsi0pl4xgahsyl2jp0crqkaf3hqwlg";
    };
    opam = "${repo}/packages/nocrypto/nocrypto.0.5.4-2/opam";
    depends = with self; [ cstruct cstruct-lwt lwt ocaml ppx_deriving
                           ppx_sexp_conv sexplib zarith
                           (self.mirage-entropy or null)
                           (self.mirage-no-solo5 or null)
                           (self.mirage-no-xen or null)
                           (self.mirage-solo5 or null)
                           (self.mirage-xen or null)
                           (self.zarith-freestanding or null)
                           (self.zarith-xen or null) ];
    buildDepends = with self; [ cpuid ocaml ocamlbuild ocamlfind ocb-stubblr
                                topkg ];
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
  ocb-stubblr = {
    name = "ocb-stubblr";
    version = "0.1.1+1";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/ocb-stubblr/releases/download/v0.1.1/ocb-stubblr-0.1.1.tbz";
      sha256 = "167b7x1j21mkviq8dbaa0nmk4rps2ilvzwx02igsc2706784z72f";
    };
    opam = "${repo}/packages/ocb-stubblr/ocb-stubblr.0.1.1-1/opam";
    depends = with self; [ astring ocaml ocamlbuild topkg ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
  ppx_cstruct = {
    name = "ppx_cstruct";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.5.2.0/opam";
    depends = with self; [ cstruct dune ocaml ocaml-migrate-parsetree
                           ppx_tools_versioned sexplib stdlib-shims ];
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
    version = "5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/releases/download/v5.1/ppx_deriving-v5.1.tbz";
      sha256 = "b04f3b22b754e65af50812730695863192ae410e802e074b55ebbb8c4f73c4c4";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.5.1/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ocamlfind
                           ppx_derivers ppxlib result ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
  };
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/v0.14.1.tar.gz";
      sha256 = "0lpm5bjxmrb5r21fqj6w9xdyhb22c40mic5h8pal8d5r9kf4gy6c";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_tools = {
    name = "ppx_tools";
    version = "6.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools/releases/download/6.5/ppx_tools-6.5.tar.gz";
      sha512 = "9f24e5feb9d32a5f038e94db33b6a8ba22ef0f83964bf657ac12fd0d39ae2580769612b1ba8988a56a146e4ae5da99e089bda24a4944b18b1df6e146bb75237b";
    };
    opam = "${repo}/packages/ppx_tools/ppx_tools.6.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
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
  ptime = {
    name = "ptime";
    version = "0.8.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/ptime/releases/ptime-0.8.5.tbz";
      sha256 = "1fxq57xy1ajzfdnvv5zfm7ap2nf49znw5f9gbi4kb9vds942ij27";
    };
    opam = "${repo}/packages/ptime/ptime.0.8.5/opam";
    depends = with self; [ ocaml result (self.js_of_ocaml or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  tls = {
    name = "tls";
    version = "0.10.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-tls/releases/download/0.10.4/tls-0.10.4.tbz";
      sha256 = "24d5f7200ceb526bc8d1513c72dbe641a15012d3b0bba3387b85aaee9e052317";
    };
    opam = "${repo}/packages/tls/tls.0.10.4/opam";
    depends = with self; [ cstruct cstruct-sexp domain-name fmt lwt nocrypto
                           ocaml ppx_cstruct ppx_deriving ppx_sexp_conv
                           sexplib x509 (self.mirage-clock or null)
                           (self.mirage-flow-lwt or null)
                           (self.mirage-kv-lwt or null) (self.ptime or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  vchan = {
    name = "vchan";
    version = "4.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-vchan/releases/download/v4.0.3/vchan-v4.0.3.tbz";
      sha256 = "881561336d1b52443512297e156586aa0ae4c8637f273b9316e873a35afabfa7";
    };
    opam = "${repo}/packages/vchan/vchan.4.0.3/opam";
    depends = with self; [ cmdliner cstruct dune io-page lwt mirage-flow-lwt
                           ocaml ppx_cstruct ppx_sexp_conv ppx_tools result
                           sexplib xenstore xenstore_transport ];
    buildDepends = with self; [ dune ocaml ];
  };
  x509 = {
    name = "x509";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-x509/releases/download/v0.8.1/x509-v0.8.1.tbz";
      sha256 = "a586b925fe7e84b1a5833dacf66a920967683cf8aab21d7291a3074630e57880";
    };
    opam = "${repo}/packages/x509/x509.0.8.1/opam";
    depends = with self; [ asn1-combinators cstruct domain-name dune fmt gmap
                           nocrypto ocaml ptime rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  xenstore = {
    name = "xenstore";
    version = "2.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-xenstore/releases/download/2.1.1/xenstore-2.1.1.tbz";
      sha256 = "283814ea21adc345c4d59cfcb17b2f7c1185004ecaecc3871557c961874c84f5";
    };
    opam = "${repo}/packages/xenstore/xenstore.2.1.1/opam";
    depends = with self; [ cstruct dune lwt ocaml ppx_cstruct ];
    buildDepends = with self; [ dune ocaml ];
  };
  xenstore_transport = {
    name = "xenstore_transport";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/xapi-project/ocaml-xenstore-clients/archive/v1.3.0.tar.gz";
      sha256 = "1fa190f9y45w0g6l429wx2y7p1a1a34r9jr8fzjqac2z2wppmcd1";
    };
    opam = "${repo}/packages/xenstore_transport/xenstore_transport.1.3.0/opam";
    depends = with self; [ dune lwt ocaml xenstore ];
    buildDepends = with self; [ dune ocaml ];
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
