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
  awa = {
    name = "awa";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/awa-ssh/releases/download/v0.1.0/awa-0.1.0.tbz";
      sha256 = "68f9c50e9e76a18547affe7a945c3482d549d0abc76b0c8ce451ada473ce558f";
    };
    opam = "${repo}/packages/awa/awa.0.1.0/opam";
    depends = with self; [ base64 cmdliner cstruct cstruct-sexp cstruct-unix
                           dune eqaf fmt logs mirage-crypto mirage-crypto-ec
                           mirage-crypto-pk mirage-crypto-rng mtime ocaml
                           ppx_cstruct ppx_sexp_conv sexplib x509 zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  awa-mirage = {
    name = "awa-mirage";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/awa-ssh/releases/download/v0.1.0/awa-0.1.0.tbz";
      sha256 = "68f9c50e9e76a18547affe7a945c3482d549d0abc76b0c8ce451ada473ce558f";
    };
    opam = "${repo}/packages/awa-mirage/awa-mirage.0.1.0/opam";
    depends = with self; [ awa cstruct dune duration logs lwt mirage-clock
                           mirage-flow mirage-time mtime ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ca-certs-nss = {
    name = "ca-certs-nss";
    version = "3.77";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ca-certs-nss/releases/download/v3.77/ca-certs-nss-3.77.tbz";
      sha256 = "133a2cf40d8040ea38dd1f5a9156c9e65f9eb930ed82eccc7c7eb7617a3d86f7";
    };
    opam = "${repo}/packages/ca-certs-nss/ca-certs-nss.3.77/opam";
    depends = with self; [ dune mirage-clock mirage-crypto ocaml x509 ];
    buildDepends = with self; [ astring bos cmdliner dune fmt logs ocaml ];
  };
  carton = {
    name = "carton";
    version = "0.4.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/carton-v0.4.4/git-carton-v0.4.4.tbz";
      sha256 = "ee680282ef3b0a7e17863121a27973f658604f0d02bb9867c4d275c17afe421c";
    };
    opam = "${repo}/packages/carton/carton.0.4.4/opam";
    depends = with self; [ bigstringaf bos checkseum cmdliner cstruct
                           decompress digestif duff dune fmt fpath hxd ke
                           logs ocaml optint psq result rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  carton-git = {
    name = "carton-git";
    version = "0.4.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/carton-v0.4.4/git-carton-v0.4.4.tbz";
      sha256 = "ee680282ef3b0a7e17863121a27973f658604f0d02bb9867c4d275c17afe421c";
    };
    opam = "${repo}/packages/carton-git/carton-git.0.4.4/opam";
    depends = with self; [ astring base-unix bigstringaf carton carton-lwt
                           decompress dune fmt fpath logs lwt ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  carton-lwt = {
    name = "carton-lwt";
    version = "0.4.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/carton-v0.4.4/git-carton-v0.4.4.tbz";
      sha256 = "ee680282ef3b0a7e17863121a27973f658604f0d02bb9867c4d275c17afe421c";
    };
    opam = "${repo}/packages/carton-lwt/carton-lwt.0.4.4/opam";
    depends = with self; [ bigstringaf carton decompress dune lwt ocaml
                           optint ];
    buildDepends = with self; [ dune ocaml ];
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
  checkseum = {
    name = "checkseum";
    version = "0.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/checkseum/releases/download/v0.3.3/checkseum-0.3.3.tbz";
      sha256 = "c2ac7f7332dc86bdaf67ff78e7fd6bc4016f5fa556b083516db9d0c40eae8811";
    };
    opam = "${repo}/packages/checkseum/checkseum.0.3.3/opam";
    depends = with self; [ dune dune-configurator ocaml optint
                           (self.ocaml-freestanding or null) ];
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
  cohttp = {
    name = "cohttp";
    version = "5.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/releases/download/v5.0.0/cohttp-5.0.0.tbz";
      sha256 = "fd6ff4b86c818355d61b3a08628596dbf517d6a7da6e8edec481bb0653ca5a05";
    };
    opam = "${repo}/packages/cohttp/cohttp.5.0.0/opam";
    depends = with self; [ base64 dune ocaml ppx_sexp_conv re sexplib0
                           stringext uri uri-sexp ];
    buildDepends = with self; [ dune jsonm ocaml ];
  };
  cohttp-lwt = {
    name = "cohttp-lwt";
    version = "5.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/releases/download/v5.0.0/cohttp-5.0.0.tbz";
      sha256 = "fd6ff4b86c818355d61b3a08628596dbf517d6a7da6e8edec481bb0653ca5a05";
    };
    opam = "${repo}/packages/cohttp-lwt/cohttp-lwt.5.0.0/opam";
    depends = with self; [ cohttp dune logs lwt ocaml ppx_sexp_conv sexplib0
                           uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  cohttp-lwt-unix = {
    name = "cohttp-lwt-unix";
    version = "5.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/releases/download/v5.0.0/cohttp-5.0.0.tbz";
      sha256 = "fd6ff4b86c818355d61b3a08628596dbf517d6a7da6e8edec481bb0653ca5a05";
    };
    opam = "${repo}/packages/cohttp-lwt-unix/cohttp-lwt-unix.5.0.0/opam";
    depends = with self; [ base-unix cmdliner cohttp-lwt conduit-lwt
                           conduit-lwt-unix dune fmt logs lwt magic-mime
                           ocaml ppx_sexp_conv ];
    buildDepends = with self; [ dune ocaml ];
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
  conduit-lwt-unix = {
    name = "conduit-lwt-unix";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/releases/download/v5.1.0/conduit-5.1.0.tbz";
      sha256 = "e51c8c3e879cbbe9e09989b00595093832dc86642088072e03e5a59a2a2391cd";
    };
    opam = "${repo}/packages/conduit-lwt-unix/conduit-lwt-unix.5.1.0/opam";
    depends = with self; [ base-unix ca-certs conduit-lwt dune ipaddr
                           ipaddr-sexp logs lwt ocaml ppx_sexp_conv uri
                           (self.launchd or null) (self.lwt_ssl or null)
                           (self.tls or null) ];
    buildDepends = with self; [ dune ocaml ];
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
  crunch = {
    name = "crunch";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-crunch/releases/download/v3.2.0/crunch-v3.2.0.tbz";
      sha256 = "0a1a4ebb86ab643dd193b5c0046e4d168c6e1cb41e6e5e5b6fbd3b7492e8c6de";
    };
    opam = "${repo}/packages/crunch/crunch.3.2.0/opam";
    depends = with self; [ cmdliner dune ocaml ptime ];
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
  cstruct-unix = {
    name = "cstruct-unix";
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${repo}/packages/cstruct-unix/cstruct-unix.6.1.0/opam";
    depends = with self; [ base-unix cstruct dune ocaml ];
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
  decompress = {
    name = "decompress";
    version = "1.4.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/decompress/releases/download/v1.4.3/decompress-1.4.3.tbz";
      sha256 = "b22254ae5eb7747452267fc976a3a0ba408c5afdae0896cac4068b4d79ed5a3d";
    };
    opam = "${repo}/packages/decompress/decompress.1.4.3/opam";
    depends = with self; [ checkseum cmdliner dune ocaml optint ];
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
  dispatch = {
    name = "dispatch";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/ocaml-dispatch/archive/0.5.0.tar.gz";
      sha256 = "0hyj4gm3xlzwwnsk47yrxmgf85xid6ri5wm7j1nm8gahkkw9a6h2";
    };
    opam = "${repo}/packages/dispatch/dispatch.0.5.0/opam";
    depends = with self; [ dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  dns = {
    name = "dns";
    version = "6.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v6.2.2/dns-6.2.2.tbz";
      sha256 = "53842446afacb85251a1a4643fa74e185671d0f8eaf3bc0080e85f3aacc9c27f";
    };
    opam = "${repo}/packages/dns/dns.6.2.2/opam";
    depends = with self; [ base64 cstruct domain-name dune duration fmt gmap
                           ipaddr logs lru metrics ocaml ptime ];
    buildDepends = with self; [ dune ocaml ];
  };
  dns-client = {
    name = "dns-client";
    version = "6.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-dns/releases/download/v6.2.2/dns-6.2.2.tbz";
      sha256 = "53842446afacb85251a1a4643fa74e185671d0f8eaf3bc0080e85f3aacc9c27f";
    };
    opam = "${repo}/packages/dns-client/dns-client.6.2.2/opam";
    depends = with self; [ ca-certs ca-certs-nss cstruct dns domain-name dune
                           fmt happy-eyeballs ipaddr logs lwt mirage-clock
                           mirage-crypto-rng mirage-random mirage-time mtime
                           ocaml randomconv tcpip tls tls-mirage x509 ];
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
  duff = {
    name = "duff";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/duff/releases/download/v0.5/duff-0.5.tbz";
      sha256 = "d1eaa97cf58d38762391c8d74676544d4145d3f2fd13e4cda0ea8a0844cde612";
    };
    opam = "${repo}/packages/duff/duff.0.5/opam";
    depends = with self; [ dune fmt ocaml ];
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
  emile = {
    name = "emile";
    version = "1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/emile/releases/download/v1.1/emile-v1.1.tbz";
      sha256 = "1759253996b53b84ff1a2b76ff30c3614bc61cb02ff8a500480be4a96a202164";
    };
    opam = "${repo}/packages/emile/emile.1.1/opam";
    depends = with self; [ angstrom base64 bigstringaf dune ipaddr ocaml pecu
                           uutf (self.cmdliner or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  encore = {
    name = "encore";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/encore/releases/download/v0.8/encore-v0.8.tbz";
      sha256 = "a406bc9863b04bb424692045939d6c170a2bb65a98521ae5608d25b0559344f6";
    };
    opam = "${repo}/packages/encore/encore.0.8/opam";
    depends = with self; [ angstrom bigstringaf dune fmt ocaml ];
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
  functoria-runtime = {
    name = "functoria-runtime";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${repo}/packages/functoria-runtime/functoria-runtime.4.1.1/opam";
    depends = with self; [ cmdliner dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  git = {
    name = "git";
    version = "3.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/3.9.1/git-3.9.1.tbz";
      sha256 = "3b278c5b982cab87cc1164668733eadaa6ab74566d323a1093a98c2b3e7e0ece";
    };
    opam = "${repo}/packages/git/git.3.9.1/opam";
    depends = with self; [ angstrom astring base64 bigstringaf carton
                           carton-git carton-lwt checkseum cstruct decompress
                           digestif domain-name dune emile encore fmt fpath
                           hxd ipaddr ke logs lwt mimic mirage-flow ocaml
                           ocamlgraph optint psq result rresult uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  git-mirage = {
    name = "git-mirage";
    version = "3.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/3.9.1/git-3.9.1.tbz";
      sha256 = "3b278c5b982cab87cc1164668733eadaa6ab74566d323a1093a98c2b3e7e0ece";
    };
    opam = "${repo}/packages/git-mirage/git-mirage.3.9.1/opam";
    depends = with self; [ awa awa-mirage base64 ca-certs-nss cstruct dns
                           dns-client domain-name dune fmt git git-paf
                           happy-eyeballs happy-eyeballs-mirage hex ipaddr
                           lwt mimic mimic-happy-eyeballs mirage-clock
                           mirage-crypto mirage-flow mirage-random
                           mirage-time ocaml ptime result rresult tcpip tls
                           tls-mirage uri x509 ];
    buildDepends = with self; [ dune ocaml ];
  };
  git-paf = {
    name = "git-paf";
    version = "3.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/3.9.1/git-3.9.1.tbz";
      sha256 = "3b278c5b982cab87cc1164668733eadaa6ab74566d323a1093a98c2b3e7e0ece";
    };
    opam = "${repo}/packages/git-paf/git-paf.3.9.1/opam";
    depends = with self; [ bigstringaf ca-certs-nss domain-name dune fmt git
                           httpaf ipaddr logs lwt mimic mirage-clock
                           mirage-flow mirage-time ocaml paf result rresult
                           tcpip tls tls-mirage uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  git-unix = {
    name = "git-unix";
    version = "3.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-git/releases/download/3.9.1/git-3.9.1.tbz";
      sha256 = "3b278c5b982cab87cc1164668733eadaa6ab74566d323a1093a98c2b3e7e0ece";
    };
    opam = "${repo}/packages/git-unix/git-unix.3.9.1/opam";
    depends = with self; [ astring awa awa-mirage base-unix bigstringaf bos
                           ca-certs-nss cmdliner cstruct decompress digestif
                           domain-name dune fmt fpath git git-mirage
                           happy-eyeballs-lwt ipaddr logs lwt mimic
                           mirage-clock mirage-clock-unix mirage-flow
                           mirage-time mirage-unix mtime ocaml ocamlfind
                           ptime result rresult tcpip tls tls-mirage ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
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
  graphql-cohttp = {
    name = "graphql-cohttp";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
      sha256 = "0gb5y99ph0nz5y3pc1gxq1py4wji2hyf2ydbp0hv23v00n50hpsm";
    };
    opam = "${repo}/packages/graphql-cohttp/graphql-cohttp.0.13.0/opam";
    depends = with self; [ astring base64 cohttp crunch digestif dune graphql
                           ocaml ocplib-endian yojson ];
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
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/happy-eyeballs/releases/download/v0.3.0/happy-eyeballs-0.3.0.tbz";
      sha256 = "a60ea0a1ef7d160a6fd62d63991b9e84e35ca5a9c07e5c7fa035e0fd428bb69e";
    };
    opam = "${repo}/packages/happy-eyeballs/happy-eyeballs.0.3.0/opam";
    depends = with self; [ domain-name dune duration fmt ipaddr logs ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  happy-eyeballs-lwt = {
    name = "happy-eyeballs-lwt";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/happy-eyeballs/releases/download/v0.3.0/happy-eyeballs-0.3.0.tbz";
      sha256 = "a60ea0a1ef7d160a6fd62d63991b9e84e35ca5a9c07e5c7fa035e0fd428bb69e";
    };
    opam = "${repo}/packages/happy-eyeballs-lwt/happy-eyeballs-lwt.0.3.0/opam";
    depends = with self; [ cmdliner dns-client domain-name dune duration fmt
                           happy-eyeballs ipaddr logs lwt mtime ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  happy-eyeballs-mirage = {
    name = "happy-eyeballs-mirage";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/happy-eyeballs/releases/download/v0.3.0/happy-eyeballs-0.3.0.tbz";
      sha256 = "a60ea0a1ef7d160a6fd62d63991b9e84e35ca5a9c07e5c7fa035e0fd428bb69e";
    };
    opam = "${repo}/packages/happy-eyeballs-mirage/happy-eyeballs-mirage.0.3.0/opam";
    depends = with self; [ dns-client domain-name dune duration fmt
                           happy-eyeballs ipaddr logs lwt mirage-clock
                           mirage-random mirage-time ocaml tcpip ];
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
  hxd = {
    name = "hxd";
    version = "0.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/hxd/releases/download/v0.3.2/hxd-0.3.2.tbz";
      sha256 = "a00290abb8538e79b32ddc22ed9b301b9806bc4c03eb1e5105b14af47dabec9f";
    };
    opam = "${repo}/packages/hxd/hxd.0.3.2/opam";
    depends = with self; [ cmdliner dune dune-configurator ocaml
                           (self.lwt or null) ];
    buildDepends = with self; [ dune ocaml ];
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
  irmin-fs = {
    name = "irmin-fs";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-fs/irmin-fs.3.2.2/opam";
    depends = with self; [ astring dune irmin logs lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-git = {
    name = "irmin-git";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-git/irmin-git.3.2.2/opam";
    depends = with self; [ astring cstruct digestif dune fmt fpath git irmin
                           logs lwt mimic ocaml ppx_irmin uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-graphql = {
    name = "irmin-graphql";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-graphql/irmin-graphql.3.2.2/opam";
    depends = with self; [ cohttp cohttp-lwt dune fmt graphql graphql-cohttp
                           graphql-lwt graphql_parser irmin lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-http = {
    name = "irmin-http";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-http/irmin-http.3.2.2/opam";
    depends = with self; [ astring cohttp cohttp-lwt crunch dune fmt irmin
                           jsonm logs lwt ocaml ppx_irmin uri webmachine ];
    buildDepends = with self; [ dune ocaml ];
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
  irmin-unix = {
    name = "irmin-unix";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/irmin-unix/irmin-unix.3.2.2/opam";
    depends = with self; [ astring cmdliner cohttp cohttp-lwt cohttp-lwt-unix
                           conduit conduit-lwt conduit-lwt-unix digestif dune
                           fmt git git-unix happy-eyeballs-lwt irmin irmin-fs
                           irmin-git irmin-graphql irmin-http irmin-pack
                           irmin-tezos irmin-watcher logs lwt ocaml uri yaml ];
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
  libirmin = {
    name = "libirmin";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${repo}/packages/libirmin/libirmin.3.2.2/opam";
    depends = with self; [ ctypes ctypes-foreign dune irmin-unix ];
    buildDepends = with self; [ dune ];
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
  mimic = {
    name = "mimic";
    version = "0.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/mimic/releases/download/0.0.5/mimic-0.0.5.tbz";
      sha256 = "dea163b6d54b8172873acafbd79e74cfb69505c1cf633c1d15e329c078163dad";
    };
    opam = "${repo}/packages/mimic/mimic.0.0.5/opam";
    depends = with self; [ dune fmt logs lwt mirage-flow ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mimic-happy-eyeballs = {
    name = "mimic-happy-eyeballs";
    version = "0.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/mimic/releases/download/0.0.5/mimic-0.0.5.tbz";
      sha256 = "dea163b6d54b8172873acafbd79e74cfb69505c1cf633c1d15e329c078163dad";
    };
    opam = "${repo}/packages/mimic-happy-eyeballs/mimic-happy-eyeballs.0.0.5/opam";
    depends = with self; [ dune happy-eyeballs-mirage mimic ocaml ];
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
  mirage-clock-unix = {
    name = "mirage-clock-unix";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-clock/releases/download/v4.2.0/mirage-clock-4.2.0.tbz";
      sha256 = "fa17d15d5be23c79ba741f5f7cb88ed7112de16a4410cea81c71b98086889847";
    };
    opam = "${repo}/packages/mirage-clock-unix/mirage-clock-unix.4.2.0/opam";
    depends = with self; [ dune dune-configurator mirage-clock ocaml ];
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
  mirage-kv = {
    name = "mirage-kv";
    version = "4.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-kv/releases/download/v4.0.1/mirage-kv-4.0.1.tbz";
      sha256 = "a7a8b8cd4560c6d4e75220488dbf16eaef71453733565e16c1f15c979b55aa71";
    };
    opam = "${repo}/packages/mirage-kv/mirage-kv.4.0.1/opam";
    depends = with self; [ dune fmt lwt ocaml ];
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
  mirage-runtime = {
    name = "mirage-runtime";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${repo}/packages/mirage-runtime/mirage-runtime.4.1.1/opam";
    depends = with self; [ dune fmt functoria-runtime ipaddr logs lwt ocaml ];
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
  mirage-unix = {
    name = "mirage-unix";
    version = "5.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-unix/releases/download/v5.0.0/mirage-unix-5.0.0.tbz";
      sha256 = "810d7a69fef779bb20d77d5df83a94cbb88acdd956af1a7669ccd02784fc1e9b";
    };
    opam = "${repo}/packages/mirage-unix/mirage-unix.5.0.0/opam";
    depends = with self; [ dune duration io-page lwt mirage-runtime ocaml ];
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
  paf = {
    name = "paf";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/paf-le-chien/releases/download/0.0.9/paf-0.0.9.tbz";
      sha256 = "7b4e56372b20c3c3f193298464efbd4ed1b369b872cedc8d00bec9b904930fff";
    };
    opam = "${repo}/packages/paf/paf.0.0.9/opam";
    depends = with self; [ bigstringaf cstruct dune faraday h2 httpaf ke
                           mimic mirage-time ocaml tcpip tls tls-mirage ];
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
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.6.1.0/opam";
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
  tls = {
    name = "tls";
    version = "0.15.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-tls/releases/download/v0.15.3/tls-0.15.3.tbz";
      sha256 = "5db456f98a2da3778296152f33dfb73e900c691c958805899fc8e6981f74465a";
    };
    opam = "${repo}/packages/tls/tls.0.15.3/opam";
    depends = with self; [ cstruct cstruct-sexp domain-name dune fmt hkdf
                           ipaddr ipaddr-sexp logs lwt mirage-crypto
                           mirage-crypto-ec mirage-crypto-pk
                           mirage-crypto-rng ocaml ppx_cstruct ppx_sexp_conv
                           ptime sexplib x509 ];
    buildDepends = with self; [ dune ocaml ];
  };
  tls-mirage = {
    name = "tls-mirage";
    version = "0.15.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-tls/releases/download/v0.15.3/tls-0.15.3.tbz";
      sha256 = "5db456f98a2da3778296152f33dfb73e900c691c958805899fc8e6981f74465a";
    };
    opam = "${repo}/packages/tls-mirage/tls-mirage.0.15.3/opam";
    depends = with self; [ dune fmt lwt mirage-clock mirage-crypto
                           mirage-crypto-pk mirage-flow mirage-kv ocaml ptime
                           tls x509 ];
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
  uri-sexp = {
    name = "uri-sexp";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
      sha256 = "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
    };
    opam = "${repo}/packages/uri-sexp/uri-sexp.4.2.0/opam";
    depends = with self; [ dune ppx_sexp_conv sexplib0 uri ];
    buildDepends = with self; [ dune ];
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
  webmachine = {
    name = "webmachine";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/ocaml-webmachine/archive/0.7.0.tar.gz";
      sha256 = "0c82cni41ij3gwnjjh5scj0a14s9m0cg6dhhidjnfba63dlr5bhk";
    };
    opam = "${repo}/packages/webmachine/webmachine.0.7.0/opam";
    depends = with self; [ cohttp dispatch dune ocaml ptime re ];
    buildDepends = with self; [ dune ocaml ];
  };
  x509 = {
    name = "x509";
    version = "0.16.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-x509/releases/download/v0.16.0/x509-0.16.0.tbz";
      sha256 = "67a6727fb4c38b919334eef2f8ef4eac0237029a439ff981d408eca8b9833595";
    };
    opam = "${repo}/packages/x509/x509.0.16.0/opam";
    depends = with self; [ asn1-combinators base64 cstruct domain-name dune
                           fmt gmap ipaddr logs mirage-crypto
                           mirage-crypto-ec mirage-crypto-pk
                           mirage-crypto-rng ocaml pbkdf ptime ];
    buildDepends = with self; [ dune ocaml ];
  };
  yaml = {
    name = "yaml";
    version = "3.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/avsm/ocaml-yaml/releases/download/v3.1.0/yaml-3.1.0.tbz";
      sha256 = "d0a9e0ae2184a69e6d7202bfe3707d10439d31a71241860234b19f020452ecc7";
    };
    opam = "${repo}/packages/yaml/yaml.3.1.0/opam";
    depends = with self; [ bos ctypes dune dune-configurator ocaml ];
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
