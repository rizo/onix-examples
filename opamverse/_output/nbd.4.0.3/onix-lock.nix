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
  base = {
    name = "base";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base-v0.15.0.tar.gz";
      sha256 = "8657ae4324a9948457112245c49d97d2da95f157f780f5d97f0b924312a6a53d";
    };
    opam = "${repo}/packages/base/base.v0.15.0/opam";
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
    version = "6.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.0/cstruct-v6.0.0.tbz";
      sha256 = "78a16d2f258cf308e9600374d8fe4ec21cf09e618acf86337663805f90642676";
    };
    opam = "${repo}/packages/cstruct/cstruct.6.0.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "6.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.0/cstruct-v6.0.0.tbz";
      sha256 = "78a16d2f258cf308e9600374d8fe4ec21cf09e618acf86337663805f90642676";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.6.0.0/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
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
  mirage-block = {
    name = "mirage-block";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-block/releases/download/v1.2.0/mirage-block-v1.2.0.tbz";
      sha256 = "0n15gagqak5m034w4i8n5vx4fb1wxvhq3fk0d129kr3pbqqc8wrk";
    };
    opam = "${repo}/packages/mirage-block/mirage-block.1.2.0/opam";
    depends = with self; [ dune mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-block-lwt = {
    name = "mirage-block-lwt";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-block/releases/download/v1.2.0/mirage-block-v1.2.0.tbz";
      sha256 = "0n15gagqak5m034w4i8n5vx4fb1wxvhq3fk0d129kr3pbqqc8wrk";
    };
    opam = "${repo}/packages/mirage-block-lwt/mirage-block-lwt.1.2.0/opam";
    depends = with self; [ cstruct dune io-page logs lwt mirage-block ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-channel = {
    name = "mirage-channel";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-channel/releases/download/v3.2.0/mirage-channel-v3.2.0.tbz";
      sha256 = "073wgkxn0nmrjpz74ic2nj5vp71097bij7ri7rvm9nk5rcbcx368";
    };
    opam = "${repo}/packages/mirage-channel/mirage-channel.3.2.0/opam";
    depends = with self; [ dune mirage-flow ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-channel-lwt = {
    name = "mirage-channel-lwt";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-channel/releases/download/v3.2.0/mirage-channel-v3.2.0.tbz";
      sha256 = "073wgkxn0nmrjpz74ic2nj5vp71097bij7ri7rvm9nk5rcbcx368";
    };
    opam = "${repo}/packages/mirage-channel-lwt/mirage-channel-lwt.3.2.0/opam";
    depends = with self; [ cstruct dune io-page logs lwt mirage-channel
                           mirage-flow-lwt ocaml ];
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
  mirage-console = {
    name = "mirage-console";
    version = "2.4.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-console/releases/download/v2.4.3/mirage-console-v2.4.3.tbz";
      sha256 = "9677d51f4075567b488b45ce7f9ee6512fb4f03e72209bb761cc7bd64570cc5b";
    };
    opam = "${repo}/packages/mirage-console/mirage-console.2.4.3/opam";
    depends = with self; [ dune mirage-device mirage-flow ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-console-lwt = {
    name = "mirage-console-lwt";
    version = "2.4.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-console/releases/download/v2.4.3/mirage-console-v2.4.3.tbz";
      sha256 = "9677d51f4075567b488b45ce7f9ee6512fb4f03e72209bb761cc7bd64570cc5b";
    };
    opam = "${repo}/packages/mirage-console-lwt/mirage-console-lwt.2.4.3/opam";
    depends = with self; [ cstruct dune lwt mirage-console ocaml ];
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
  mirage-fs = {
    name = "mirage-fs";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-fs/releases/download/v2.0.0/mirage-fs-v2.0.0.tbz";
      sha256 = "09brryp5qwghfsyvjlcjz9593nsqkkaz221yhlxpbmlpqp7w18h9";
    };
    opam = "${repo}/packages/mirage-fs/mirage-fs.2.0.0/opam";
    depends = with self; [ dune fmt mirage-device ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-fs-lwt = {
    name = "mirage-fs-lwt";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-fs/releases/download/v2.0.0/mirage-fs-v2.0.0.tbz";
      sha256 = "09brryp5qwghfsyvjlcjz9593nsqkkaz221yhlxpbmlpqp7w18h9";
    };
    opam = "${repo}/packages/mirage-fs-lwt/mirage-fs-lwt.2.0.0/opam";
    depends = with self; [ cstruct cstruct-lwt dune lwt mirage-fs
                           mirage-kv-lwt ocaml ];
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
  mirage-net-lwt = {
    name = "mirage-net-lwt";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-net/releases/download/v2.0.0/mirage-net-v2.0.0.tbz";
      sha256 = "035lccz7lkzc5dky926qmpj7hpa4q0qd11lw7z4m7brrhqgvg30v";
    };
    opam = "${repo}/packages/mirage-net-lwt/mirage-net-lwt.2.0.0/opam";
    depends = with self; [ cstruct dune lwt macaddr mirage-net ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  mirage-protocols-lwt = {
    name = "mirage-protocols-lwt";
    version = "3.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-protocols/releases/download/v3.1.0/mirage-protocols-v3.1.0.tbz";
      sha256 = "d4087ca630321a723509c17253e4e88a506cd18fdf8792294a1a6e022c6ac029";
    };
    opam = "${repo}/packages/mirage-protocols-lwt/mirage-protocols-lwt.3.1.0/opam";
    depends = with self; [ cstruct dune ipaddr lwt macaddr mirage-protocols
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  mirage-types = {
    name = "mirage-types";
    version = "3.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v3.6.0/mirage-v3.6.0.tbz";
      sha256 = "0ab6ee37fa44c05cc93ecf2456dabdbbe80935f11e82179d75ee64913cffc3d1";
    };
    opam = "${repo}/packages/mirage-types/mirage-types.3.6.0/opam";
    depends = with self; [ dune mirage-block mirage-channel mirage-clock
                           mirage-console mirage-device mirage-flow mirage-fs
                           mirage-kv mirage-net mirage-protocols
                           mirage-random mirage-stack mirage-time ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-types-lwt = {
    name = "mirage-types-lwt";
    version = "3.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v3.6.0/mirage-v3.6.0.tbz";
      sha256 = "0ab6ee37fa44c05cc93ecf2456dabdbbe80935f11e82179d75ee64913cffc3d1";
    };
    opam = "${repo}/packages/mirage-types-lwt/mirage-types-lwt.3.6.0/opam";
    depends = with self; [ cstruct dune ipaddr lwt mirage-block-lwt
                           mirage-channel-lwt mirage-clock-lwt
                           mirage-console-lwt mirage-flow-lwt mirage-fs-lwt
                           mirage-kv-lwt mirage-net-lwt mirage-protocols-lwt
                           mirage-random mirage-stack-lwt mirage-time-lwt
                           mirage-types ocaml ];
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
  nbd = {
    name = "nbd";
    version = "4.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/xapi-project/nbd/archive/v4.0.3.tar.gz";
      sha256 = "a86533562fc4fd2d284cb525318141f1d673cd9fcc5ad3d1707622e54cb55287";
    };
    opam = "${repo}/packages/nbd/nbd.4.0.3/opam";
    depends = with self; [ cstruct dune io-page lwt lwt_log mirage-block-lwt
                           mirage-types-lwt ocaml ppx_cstruct ppx_sexp_conv
                           result rresult sexplib uri ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/parsexp-v0.15.0.tar.gz";
      sha256 = "d1ee902b12ac7c0c888863025990d06845530fb75328454814e5ce5b6d43d193";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.15.0/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cstruct = {
    name = "ppx_cstruct";
    version = "6.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.0/cstruct-v6.0.0.tbz";
      sha256 = "78a16d2f258cf308e9600374d8fe4ec21cf09e618acf86337663805f90642676";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.6.0.0/opam";
    depends = with self; [ cstruct dune ocaml ppxlib sexplib stdlib-shims ];
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
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/refs/tags/v0.15.1.tar.gz";
      sha256 = "e34647850c58992a463f29b11b863f9b1322adc0a98d3b16028012507e0c2e9d";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.15.1/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexplib-v0.15.0.tar.gz";
      sha256 = "a562348f2cc150224c31e424e0fb4cb11b5980ddc1effbb3b34c431f822b45f7";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.15.0/opam";
    depends = with self; [ dune num ocaml parsexp sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
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
}
