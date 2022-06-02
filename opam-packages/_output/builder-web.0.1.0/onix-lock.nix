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
  arp = {
    name = "arp";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/arp/releases/download/v3.0.0/arp-v3.0.0.tbz";
      sha256 = "f66bc9b03fa5ff66459ce63be0a223573d85160112b8c559e683716fd24674f4";
    };
    opam = "${repo}/packages/arp/arp.3.0.0/opam";
    depends = with self; [ cstruct dune duration ethernet ipaddr logs lwt
                           macaddr mirage-profile mirage-time ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  asn1-combinators = {
    name = "asn1-combinators";
    version = "0.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-asn1-combinators/releases/download/v0.2.6/asn1-combinators-v0.2.6.tbz";
      sha256 = "012ade0d8869ef621063752c1cf8ea026f6bc702fed10df9af56688e291b1a91";
    };
    opam = "${repo}/packages/asn1-combinators/asn1-combinators.0.2.6/opam";
    depends = with self; [ cstruct dune ocaml ptime zarith ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base-v0.15.0.tar.gz";
      sha256 = "8657ae4324a9948457112245c49d97d2da95f157f780f5d97f0b924312a6a53d";
    };
    opam = "${repo}/packages/base/base.v0.15.0/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${repo}/packages/base-bigarray/base-bigarray.base/opam";
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
  bigarray-overlap = {
    name = "bigarray-overlap";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/overlap/releases/download/v0.2.1/bigarray-overlap-0.2.1.tbz";
      sha256 = "2f520ac470054e335883eba9254bf28b6676ddb57753cfb58b22cf84ae1a66e0";
    };
    opam = "${repo}/packages/bigarray-overlap/bigarray-overlap.0.2.1/opam";
    depends = with self; [ dune ocaml (self.js_of_ocaml-compiler or null)
                           (self.mirage-xen-posix or null)
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
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
  builder = {
    name = "builder";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/builder/releases/download/v0.3.0/builder-0.3.0.tbz";
      sha256 = "0e823f6ab0084ab21f4ee44ca2f2aa7d001d3d55970cab58791fbc13022691ea";
    };
    opam = "${repo}/packages/builder/builder.0.3.0/opam";
    depends = with self; [ asn1-combinators base64 bheap bos cmdliner cstruct
                           dune duration fmt fpath http-lwt-client logs lwt
                           ocaml ptime uuidm ];
    buildDepends = with self; [ dune ocaml ];
  };
  builder-web = {
    name = "builder-web";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/builder-web/releases/download/v0.1.0/builder-web-v0.1.0.tbz";
      sha256 = "aaf4964cb2f82bfd260cf501e5dd16629193c8f761b9bc7556bdf1e904dbfa19";
    };
    opam = "${repo}/packages/builder-web/builder-web.0.1.0/opam";
    depends = with self; [ asn1-combinators bos builder caqti
                           caqti-driver-sqlite3 caqti-lwt cmdliner cstruct
                           dream dune duration fmt hex ipaddr logs lwt
                           metrics metrics-influx metrics-lwt metrics-rusage
                           mirage-crypto mirage-crypto-rng ocaml omd
                           opam-core opam-format pbkdf ptime scrypt-kdf tyxml
                           uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  ca-certs = {
    name = "ca-certs";
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ca-certs/releases/download/v0.2.2/ca-certs-v0.2.2.tbz";
      sha256 = "4f1e77cc125e99987738387ff22cda8710e826f5ef3452f2000f0b30cd668652";
    };
    opam = "${repo}/packages/ca-certs/ca-certs.0.2.2/opam";
    depends = with self; [ astring bos dune fpath logs mirage-crypto ocaml
                           ptime x509 ];
    buildDepends = with self; [ dune ocaml ];
    depexts = with pkgs; [ (pkgs.ca_root_nss or null) ];
  };
  caqti = {
    name = "caqti";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.6.0/caqti-v1.6.0.tbz";
      sha256 = "1bf0c0d60547033c10d6148cf5297b25ab66c9a2832b680329df2f3816bc674d";
    };
    opam = "${repo}/packages/caqti/caqti.1.6.0/opam";
    depends = with self; [ dune logs ocaml ptime uri ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  caqti-driver-sqlite3 = {
    name = "caqti-driver-sqlite3";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.6.0/caqti-v1.6.0.tbz";
      sha256 = "1bf0c0d60547033c10d6148cf5297b25ab66c9a2832b680329df2f3816bc674d";
    };
    opam = "${repo}/packages/caqti-driver-sqlite3/caqti-driver-sqlite3.1.6.0/opam";
    depends = with self; [ caqti dune ocaml sqlite3 ];
    buildDepends = with self; [ dune ocaml ];
  };
  caqti-lwt = {
    name = "caqti-lwt";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.6.0/caqti-v1.6.0.tbz";
      sha256 = "1bf0c0d60547033c10d6148cf5297b25ab66c9a2832b680329df2f3816bc674d";
    };
    opam = "${repo}/packages/caqti-lwt/caqti-lwt.1.6.0/opam";
    depends = with self; [ caqti dune logs lwt ocaml ];
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
  conf-gmp-powm-sec = {
    name = "conf-gmp-powm-sec";
    version = "3";
    opam = "${repo}/packages/conf-gmp-powm-sec/conf-gmp-powm-sec.3/opam";
    depends = with self; [ conf-gmp ];
  };
  conf-libev = {
    name = "conf-libev";
    version = "4+12";
    opam = "${repo}/packages/conf-libev/conf-libev.4-12/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ libev ];
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
    version = "6.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.1/cstruct-v6.0.1.tbz";
      sha256 = "4a67bb8f042753453c59eabf0e47865631253ba694091ce6062aac05d47a9bed";
    };
    opam = "${repo}/packages/cstruct/cstruct.6.0.1/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "6.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.1/cstruct-v6.0.1.tbz";
      sha256 = "4a67bb8f042753453c59eabf0e47865631253ba694091ce6062aac05d47a9bed";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.6.0.1/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-sexp = {
    name = "cstruct-sexp";
    version = "6.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.1/cstruct-v6.0.1.tbz";
      sha256 = "4a67bb8f042753453c59eabf0e47865631253ba694091ce6062aac05d47a9bed";
    };
    opam = "${repo}/packages/cstruct-sexp/cstruct-sexp.6.0.1/opam";
    depends = with self; [ cstruct dune ocaml sexplib ];
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
  dns = {
    name = "dns";
    version = "5.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v5.0.1/dns-v5.0.1.tbz";
      sha256 = "72c0a1a91c8e409bd448c8e0ea28d16d13177c326aea403ee1c30ddcb5969adc";
    };
    opam = "${repo}/packages/dns/dns.5.0.1/opam";
    depends = with self; [ astring cstruct domain-name dune duration fmt gmap
                           ipaddr logs lru metrics ocaml ptime rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  dns-client = {
    name = "dns-client";
    version = "5.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v5.0.1/dns-v5.0.1.tbz";
      sha256 = "72c0a1a91c8e409bd448c8e0ea28d16d13177c326aea403ee1c30ddcb5969adc";
    };
    opam = "${repo}/packages/dns-client/dns-client.5.0.1/opam";
    depends = with self; [ cstruct dns domain-name dune fmt ipaddr logs lwt
                           mirage-clock mirage-crypto-rng mirage-random
                           mirage-stack mirage-time mtime ocaml randomconv
                           rresult ];
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
  dream = {
    name = "dream";
    version = "1.0.0+alpha2";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha2/dream-1.0.0-alpha2.tar.gz";
      sha256 = "00dvp593jlandpsyxq5ndyh492ywl7ya3yld1g1irq571lzw26dz";
    };
    opam = "${repo}/packages/dream/dream.1.0.0~alpha2/opam";
    depends = with self; [ angstrom base-unix base64 bigarray-compat
                           bigstringaf caqti caqti-lwt conf-libev cstruct
                           digestif dune faraday faraday-lwt-unix fmt
                           graphql-lwt graphql_parser hmap logs lwt lwt_ppx
                           lwt_ssl magic-mime mirage-crypto mirage-crypto-rng
                           multipart_form ocaml psq result ssl uri yojson ];
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
  ethernet = {
    name = "ethernet";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ethernet/releases/download/v3.0.0/ethernet-v3.0.0.tbz";
      sha256 = "e95974f6363bd21e995a1c72ca03d09674c32ed2fbffada5aa82f096ee460929";
    };
    opam = "${repo}/packages/ethernet/ethernet.3.0.0/opam";
    depends = with self; [ cstruct dune logs lwt macaddr mirage-net
                           mirage-profile ocaml ppx_cstruct ];
    buildDepends = with self; [ dune ocaml ];
  };
  faraday = {
    name = "faraday";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
      sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
    };
    opam = "${repo}/packages/faraday/faraday.0.8.1/opam";
    depends = with self; [ bigstringaf dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  faraday-lwt = {
    name = "faraday-lwt";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
      sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
    };
    opam = "${repo}/packages/faraday-lwt/faraday-lwt.0.8.1/opam";
    depends = with self; [ dune faraday lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  faraday-lwt-unix = {
    name = "faraday-lwt-unix";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
      sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
    };
    opam = "${repo}/packages/faraday-lwt-unix/faraday-lwt-unix.0.8.1/opam";
    depends = with self; [ base-unix dune faraday-lwt lwt ocaml ];
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
  graphql = {
    name = "graphql";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
      sha256 = "0gb5y99ph0nz5y3pc1gxq1py4wji2hyf2ydbp0hv23v00n50hpsm";
    };
    opam = "${repo}/packages/graphql/graphql.0.13.0/opam";
    depends = with self; [ dune graphql_parser ocaml rresult seq yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  graphql-lwt = {
    name = "graphql-lwt";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
      sha256 = "0gb5y99ph0nz5y3pc1gxq1py4wji2hyf2ydbp0hv23v00n50hpsm";
    };
    opam = "${repo}/packages/graphql-lwt/graphql-lwt.0.13.0/opam";
    depends = with self; [ dune graphql lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  graphql_parser = {
    name = "graphql_parser";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
      sha256 = "0gb5y99ph0nz5y3pc1gxq1py4wji2hyf2ydbp0hv23v00n50hpsm";
    };
    opam = "${repo}/packages/graphql_parser/graphql_parser.0.13.0/opam";
    depends = with self; [ dune fmt ocaml re ];
    buildDepends = with self; [ dune menhir ocaml ];
  };
  h2 = {
    name = "h2";
    version = "0.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/anmonteiro/ocaml-h2/releases/download/0.8.0/h2-0.8.0.tbz";
      sha256 = "c6675a092f8ef9f69d04eb830fe3809557a71910cba6275d0a0482efb71f9661";
    };
    opam = "${repo}/packages/h2/h2.0.8.0/opam";
    depends = with self; [ angstrom base64 bigstringaf dune faraday hpack
                           httpaf ocaml psq ];
    buildDepends = with self; [ dune ocaml ];
  };
  happy-eyeballs = {
    name = "happy-eyeballs";
    version = "0.0.7";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/happy-eyeballs/releases/download/v0.0.7/happy-eyeballs-v0.0.7.tbz";
      sha256 = "fd4b0e8d8774b6c15323e74167e0195760c45cc7a5283a77fe46638c6ae0f4f4";
    };
    opam = "${repo}/packages/happy-eyeballs/happy-eyeballs.0.0.7/opam";
    depends = with self; [ domain-name dune duration fmt ipaddr logs ocaml
                           rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  happy-eyeballs-lwt = {
    name = "happy-eyeballs-lwt";
    version = "0.0.7";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/happy-eyeballs/releases/download/v0.0.7/happy-eyeballs-v0.0.7.tbz";
      sha256 = "fd4b0e8d8774b6c15323e74167e0195760c45cc7a5283a77fe46638c6ae0f4f4";
    };
    opam = "${repo}/packages/happy-eyeballs-lwt/happy-eyeballs-lwt.0.0.7/opam";
    depends = with self; [ cmdliner dns-client domain-name dune duration fmt
                           happy-eyeballs ipaddr logs lwt mtime ocaml rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  hex = {
    name = "hex";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-hex/releases/download/v1.5.0/hex-1.5.0.tbz";
      sha256 = "2e67eeca1b03049307a30831b5cd694bcb2d3e7f2a6b4fb597fbdb647351b4dc";
    };
    opam = "${repo}/packages/hex/hex.1.5.0/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  hkdf = {
    name = "hkdf";
    version = "1.0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/ocaml-hkdf/releases/download/v1.0.4/hkdf-v1.0.4.tbz";
      sha256 = "b926d6da4ac45aab999735dd2bbfd1f7511316710d791afa361006b6fe36fd5b";
    };
    opam = "${repo}/packages/hkdf/hkdf.1.0.4/opam";
    depends = with self; [ cstruct dune mirage-crypto ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  hmap = {
    name = "hmap";
    version = "0.8.1";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/hmap/releases/hmap-0.8.1.tbz";
      sha256 = "10xyjy4ab87z7jnghy0wnla9wrmazgyhdwhr4hdmxxdn28dxn03a";
    };
    opam = "${repo}/packages/hmap/hmap.0.8.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  hpack = {
    name = "hpack";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/anmonteiro/ocaml-h2/releases/download/0.2.0/h2-0.2.0.tbz";
      sha256 = "1rkbw1x4sviwccy9f7yymb4ncvamjyl3cl1hp4i43bg96i4zs4l5";
    };
    opam = "${repo}/packages/hpack/hpack.0.2.0/opam";
    depends = with self; [ angstrom dune faraday ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  http-lwt-client = {
    name = "http-lwt-client";
    version = "0.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/http-lwt-client/releases/download/v0.0.5/http-lwt-client-v0.0.5.tbz";
      sha256 = "ba0cf3268c98f57b65e67dbecd262d2af74d8cd17703e56ca17ef51859b0a4b5";
    };
    opam = "${repo}/packages/http-lwt-client/http-lwt-client.0.0.5/opam";
    depends = with self; [ base64 bos ca-certs cmdliner dune faraday-lwt-unix
                           fmt h2 happy-eyeballs-lwt httpaf logs lwt ocaml
                           tls ];
    buildDepends = with self; [ dune ocaml ];
  };
  httpaf = {
    name = "httpaf";
    version = "0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/httpaf/archive/0.7.1.tar.gz";
      sha256 = "19baxlf0kmhc5dnpz9962wp41yxj0gsi6893pqqkkc54wbs9fbpa";
    };
    opam = "${repo}/packages/httpaf/httpaf.0.7.1/opam";
    depends = with self; [ angstrom bigstringaf dune faraday ocaml result ];
    buildDepends = with self; [ dune ocaml ];
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
  ke = {
    name = "ke";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ke/releases/download/v0.6/ke-0.6.tbz";
      sha256 = "61217207e2200b04b17759736610ff9208269a647f854cb5ae72cdac0d672305";
    };
    opam = "${repo}/packages/ke/ke.0.6/opam";
    depends = with self; [ dune fmt ocaml ];
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
  lwt_ppx = {
    name = "lwt_ppx";
    version = "2.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt_ppx/lwt_ppx.2.0.3/opam";
    depends = with self; [ dune lwt ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
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
  macaddr-cstruct = {
    name = "macaddr-cstruct";
    version = "5.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.0/ipaddr-5.3.0.tbz";
      sha256 = "36979edf64b464d44055f3504b97d61e22050e7369d983052c4ecc3d2b1ab755";
    };
    opam = "${repo}/packages/macaddr-cstruct/macaddr-cstruct.5.3.0/opam";
    depends = with self; [ cstruct dune macaddr ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  magic-mime = {
    name = "magic-mime";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-magic-mime/releases/download/v1.2.0/magic-mime-v1.2.0.tbz";
      sha256 = "f121b67500f8dd97e2fc9fd5d01c7325e4c84bc5c0237442779fbd6fa20694f5";
    };
    opam = "${repo}/packages/magic-mime/magic-mime.1.2.0/opam";
    depends = with self; [ dune ocaml ];
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
  metrics-influx = {
    name = "metrics-influx";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/metrics/releases/download/v0.4.0/metrics-0.4.0.tbz";
      sha256 = "91b8755a4b5090371713c3b55919bebed6a055f4aa97c4b982bd1b5e7fe389af";
    };
    opam = "${repo}/packages/metrics-influx/metrics-influx.0.4.0/opam";
    depends = with self; [ dune duration fmt lwt metrics ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  metrics-lwt = {
    name = "metrics-lwt";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/metrics/releases/download/v0.4.0/metrics-0.4.0.tbz";
      sha256 = "91b8755a4b5090371713c3b55919bebed6a055f4aa97c4b982bd1b5e7fe389af";
    };
    opam = "${repo}/packages/metrics-lwt/metrics-lwt.0.4.0/opam";
    depends = with self; [ dune logs lwt metrics ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  metrics-rusage = {
    name = "metrics-rusage";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/metrics/releases/download/v0.4.0/metrics-0.4.0.tbz";
      sha256 = "91b8755a4b5090371713c3b55919bebed6a055f4aa97c4b982bd1b5e7fe389af";
    };
    opam = "${repo}/packages/metrics-rusage/metrics-rusage.0.4.0/opam";
    depends = with self; [ dune fmt logs metrics ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-clock = {
    name = "mirage-clock";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-clock/releases/download/v4.2.0/mirage-clock-4.2.0.tbz";
      sha256 = "fa17d15d5be23c79ba741f5f7cb88ed7112de16a4410cea81c71b98086889847";
    };
    opam = "${repo}/packages/mirage-clock/mirage-clock.4.2.0/opam";
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
  mirage-crypto-ec = {
    name = "mirage-crypto-ec";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.6/mirage-crypto-0.10.6.tbz";
      sha256 = "01d6477a4edcad007b56983955d327f0e61c3f36494822f3755017d26e8f9410";
    };
    opam = "${repo}/packages/mirage-crypto-ec/mirage-crypto-ec.0.10.6/opam";
    depends = with self; [ cstruct dune dune-configurator eqaf mirage-crypto
                           mirage-crypto-rng ocaml
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  mirage-crypto-pk = {
    name = "mirage-crypto-pk";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.6/mirage-crypto-0.10.6.tbz";
      sha256 = "01d6477a4edcad007b56983955d327f0e61c3f36494822f3755017d26e8f9410";
    };
    opam = "${repo}/packages/mirage-crypto-pk/mirage-crypto-pk.0.10.6/opam";
    depends = with self; [ cstruct dune eqaf mirage-crypto mirage-crypto-rng
                           ocaml sexplib0 zarith
                           (self.mirage-no-solo5 or null)
                           (self.mirage-no-xen or null)
                           (self.mirage-runtime or null)
                           (self.zarith-freestanding or null) ];
    buildDepends = with self; [ conf-gmp-powm-sec dune ocaml ];
  };
  mirage-crypto-rng = {
    name = "mirage-crypto-rng";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.6/mirage-crypto-0.10.6.tbz";
      sha256 = "01d6477a4edcad007b56983955d327f0e61c3f36494822f3755017d26e8f9410";
    };
    opam = "${repo}/packages/mirage-crypto-rng/mirage-crypto-rng.0.10.6/opam";
    depends = with self; [ cstruct dune dune-configurator duration logs lwt
                           mirage-crypto mtime ocaml ];
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
  mirage-net = {
    name = "mirage-net";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-net/releases/download/v4.0.0/mirage-net-v4.0.0.tbz";
      sha256 = "668effd187b81a0ab32450870c15dbb89ff911397ff338a8951807e250e194ce";
    };
    opam = "${repo}/packages/mirage-net/mirage-net.4.0.0/opam";
    depends = with self; [ cstruct dune fmt lwt macaddr ocaml ];
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
  mirage-random = {
    name = "mirage-random";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-random/releases/download/v3.0.0/mirage-random-v3.0.0.tbz";
      sha256 = "49fe3f281d6430cc1723ecabe47fc9b8e9b29d83cd5f0964f5d000fa014066cf";
    };
    opam = "${repo}/packages/mirage-random/mirage-random.3.0.0/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-stack = {
    name = "mirage-stack";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-stack/releases/download/v4.0.0/mirage-stack-v4.0.0.tbz";
      sha256 = "abbd33190bd3e4a4eabcbdfb6d98d20fc4aed0fef628251eb327d625c23cccfc";
    };
    opam = "${repo}/packages/mirage-stack/mirage-stack.4.0.0/opam";
    depends = with self; [ dune ocaml tcpip ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage-time = {
    name = "mirage-time";
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-time/releases/download/v3.0.0/mirage-time-v3.0.0.tbz";
      sha256 = "0d40949b58e2c7e8b762ccc8ce066345046233c8c95d0e3d17a242ff289cbd7c";
    };
    opam = "${repo}/packages/mirage-time/mirage-time.3.0.0/opam";
    depends = with self; [ dune lwt ocaml ];
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
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/mtime/releases/mtime-1.4.0.tbz";
      sha512 = "0492fa5f5187b909fe2b0550363c7dcb8cffef963d51072272ef3d876b51e1ddf8de4c4e221cffb0144658fccf6a0dc584a5c8094a4b2208156e43bad5b269d4";
    };
    opam = "${repo}/packages/mtime/mtime.1.4.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  multipart_form = {
    name = "multipart_form";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/multipart_form/releases/download/v0.3.0/multipart_form-v0.3.0.tbz";
      sha256 = "f4cd9e300b9cf5d9f2425f091ef89fdf0ffa17ba0c45e7ab3de6f98d9dd08b15";
    };
    opam = "${repo}/packages/multipart_form/multipart_form.0.3.0/opam";
    depends = with self; [ angstrom base64 bigarray-compat bigstringaf dune
                           fmt ke logs lwt ocaml pecu prettym result rresult
                           stdlib-shims unstrctrd uutf ];
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
  omd = {
    name = "omd";
    version = "2.0.0+alpha2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/omd/releases/download/2.0.0.alpha2/omd-2.0.0.alpha2.tbz";
      sha256 = "bee39a6fbb5e32efbbc7eb81574f6472d568f2cb37ba93f2de188d4b68fc7396";
    };
    opam = "${repo}/packages/omd/omd.2.0.0~alpha2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  opam-core = {
    name = "opam-core";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 = "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${repo}/packages/opam-core/opam-core.2.1.2/opam";
    depends = with self; [ base-bigarray base-unix dune ocaml ocamlgraph re ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  opam-file-format = {
    name = "opam-file-format";
    version = "2.1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-file-format/archive/refs/tags/2.1.4.tar.gz";
      sha512 = "fb5e584080d65c5b5d04c7d2ac397b69a3fd077af3f51eb22967131be22583fea507390eb0d7e6f5c92035372a9e753adbfbc8bfd056d8fd4697c6f95dd8e0ad";
    };
    opam = "${repo}/packages/opam-file-format/opam-file-format.2.1.4/opam";
    depends = with self; [ ocaml (self.dune or null) ];
    buildDepends = with self; [ ocaml (self.dune or null) ];
  };
  opam-format = {
    name = "opam-format";
    version = "2.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam/archive/2.1.2.tar.gz";
      sha512 = "bea6f75728a6ef25bcae4f8903dde7a297df7186208dccacb3f58bd6a0caec551c11b79e8544f0983feac038971dbe49481fc405a5962973a5f56ec811abe396";
    };
    opam = "${repo}/packages/opam-format/opam-format.2.1.2/opam";
    depends = with self; [ dune ocaml opam-core opam-file-format re ];
    buildDepends = with self; [ dune ocaml ];
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
  pbkdf = {
    name = "pbkdf";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/abeaumont/ocaml-pbkdf/archive/1.2.0.tar.gz";
      sha512 = "d6f7d5efd761b87dd420ddcf97c2f9d4402dcc81d65cd1f4d81039b70c4d8c1e803bbaf4251482de8de7076da9f40b48c7eb1684e31e7a316deb5036c192bd3c";
    };
    opam = "${repo}/packages/pbkdf/pbkdf.1.2.0/opam";
    depends = with self; [ cstruct dune mirage-crypto ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  pecu = {
    name = "pecu";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/pecu/releases/download/v0.6/pecu-v0.6.tbz";
      sha256 = "a9d2b7da444c83b20f879f6c3b7fc911d08ac1e6245ad7105437504f9394e5c7";
    };
    opam = "${repo}/packages/pecu/pecu.0.6/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cstruct = {
    name = "ppx_cstruct";
    version = "6.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.0.1/cstruct-v6.0.1.tbz";
      sha256 = "4a67bb8f042753453c59eabf0e47865631253ba694091ce6062aac05d47a9bed";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.6.0.1/opam";
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
  prettym = {
    name = "prettym";
    version = "0.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/prettym/releases/download/0.0.3/prettym-0.0.3.tbz";
      sha256 = "9170f1a11ade7f4d98a584a5be52bb6b91415f971c6e75894331b46b18b98f09";
    };
    opam = "${repo}/packages/prettym/prettym.0.0.3/opam";
    depends = with self; [ bigarray-overlap bigstringaf dune fmt ke ocaml ];
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
  ptime = {
    name = "ptime";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/ptime/releases/ptime-1.0.0.tbz";
      sha512 = "df2410d9cc25a33083fe968a584b8fb4d68ad5c077f3356da0a20427e6cd8756a5b946b921e5cf8ed4097f2c506e93345d9dca63b113be644d5a7cc0753d1534";
    };
    opam = "${repo}/packages/ptime/ptime.1.0.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  salsa20-core = {
    name = "salsa20-core";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/abeaumont/ocaml-salsa20-core/archive/1.1.0.tar.gz";
      sha512 = "c10b673774d4379600bb09860827820bce1fd6efd4f33bfaa9184e5b623640ab37ad717e2330c5a7f418fb1ac89a8a3bc3650e95f1d0469acac593b6e3e378d1";
    };
    opam = "${repo}/packages/salsa20-core/salsa20-core.1.1.0/opam";
    depends = with self; [ cstruct dune ocaml (self.mirage-xen-posix or null)
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  scrypt-kdf = {
    name = "scrypt-kdf";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/abeaumont/ocaml-scrypt-kdf/archive/1.2.0.tar.gz";
      sha512 = "9d4f4ba1153b6c92abc2194da93e98d7f18c539ddf405e6619f0a9336790aee80b6dabb52ffa046138bdfe8a41b2b9c4361962011b37bcb9b8ab54d509b58d68";
    };
    opam = "${repo}/packages/scrypt-kdf/scrypt-kdf.1.2.0/opam";
    depends = with self; [ cstruct dune mirage-crypto ocaml pbkdf
                           salsa20-core ];
    buildDepends = with self; [ dune ocaml ];
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
  tcpip = {
    name = "tcpip";
    version = "7.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-tcpip/releases/download/v7.1.0/tcpip-7.1.0.tbz";
      sha256 = "e2777639565ae30db62386e08259d2f25acd7e34e4e343cbe67e8e87a9fea2cc";
    };
    opam = "${repo}/packages/tcpip/tcpip.7.1.0/opam";
    depends = with self; [ arp cstruct cstruct-lwt dune duration ethernet fmt
                           ipaddr logs lru lwt lwt-dllist macaddr
                           macaddr-cstruct metrics mirage-clock mirage-flow
                           mirage-net mirage-profile mirage-random
                           mirage-time ocaml ppx_cstruct randomconv
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  tls = {
    name = "tls";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-tls/releases/download/v0.14.1/tls-v0.14.1.tbz";
      sha256 = "58cf2d517d6eac5b1ccc5eeb656da690aef2125a19c1eca3fbececd858046216";
    };
    opam = "${repo}/packages/tls/tls.0.14.1/opam";
    depends = with self; [ cstruct cstruct-sexp domain-name dune fmt hkdf
                           logs lwt mirage-crypto mirage-crypto-ec
                           mirage-crypto-pk mirage-crypto-rng ocaml
                           ppx_cstruct ppx_sexp_conv ptime rresult sexplib
                           x509 ];
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
  tyxml = {
    name = "tyxml";
    version = "4.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/tyxml/releases/download/4.5.0/tyxml-4.5.0.tbz";
      sha256 = "c69accef5df4dd89d38f6aa0baad01e8fda4e9e98bb7dad61bec1452c5716068";
    };
    opam = "${repo}/packages/tyxml/tyxml.4.5.0/opam";
    depends = with self; [ dune ocaml re seq uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  unstrctrd = {
    name = "unstrctrd";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/unstrctrd/releases/download/v0.3/unstrctrd-v0.3.tbz";
      sha256 = "7355b1e9a6b977608641c88f9f136fff309ef64e174818c7ccadc8a2a78ded5b";
    };
    opam = "${repo}/packages/unstrctrd/unstrctrd.0.3/opam";
    depends = with self; [ angstrom dune ocaml uutf ];
    buildDepends = with self; [ dune ocaml ];
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
  x509 = {
    name = "x509";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-x509/releases/download/v0.14.1/x509-v0.14.1.tbz";
      sha256 = "d91eb4f2790f9d098713c71cc4b5d12706aedb1795666b5e6d667fe5c262f9c3";
    };
    opam = "${repo}/packages/x509/x509.0.14.1/opam";
    depends = with self; [ asn1-combinators base64 cstruct domain-name dune
                           fmt gmap logs mirage-crypto mirage-crypto-ec
                           mirage-crypto-pk mirage-crypto-rng ocaml pbkdf
                           ptime rresult ];
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
