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
  argon2 = {
    name = "argon2";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Khady/ocaml-argon2/releases/download/1.0.1/argon2-1.0.1.tbz";
      sha256 = "c71a08bf050ac258700bdcf3a7a4b0a52338769d519ec5ab433c271a1e22b810";
    };
    opam = "${repo}/packages/argon2/argon2.1.0.1/opam";
    depends = with self; [ ctypes ctypes-foreign dune ocaml result ];
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
  caqti = {
    name = "caqti";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.8.0/caqti-v1.8.0.tbz";
      sha256 = "2630233f335f910290e24b318ac7f6e712b3109fb55581b2b8c324127a9a4b12";
    };
    opam = "${repo}/packages/caqti/caqti.1.8.0/opam";
    depends = with self; [ angstrom bigstringaf dune logs ocaml ptime uri ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  caqti-lwt = {
    name = "caqti-lwt";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.8.0/caqti-v1.8.0.tbz";
      sha256 = "2630233f335f910290e24b318ac7f6e712b3109fb55581b2b8c324127a9a4b12";
    };
    opam = "${repo}/packages/caqti-lwt/caqti-lwt.1.8.0/opam";
    depends = with self; [ caqti dune logs lwt ocaml ];
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
  conf-libargon2 = {
    name = "conf-libargon2";
    version = "1";
    opam = "${repo}/packages/conf-libargon2/conf-libargon2.1/opam";
    depexts = with pkgs; [ (pkgs.app-crypt/argon2 or null)
                           (pkgs.argon2 or null) (pkgs.argon2-libs or null)
                           (pkgs.libargon2 or null)
                           (pkgs.libargon2-0 or null)
                           (pkgs.security/argon2 or null) ];
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
  dream = {
    name = "dream";
    version = "1.0.0+alpha4";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
      sha256 = "045glrnb15k6vv7avg0s002kycynf5cmir3cl6g0ih379mlv6hx1";
    };
    opam = "${repo}/packages/dream/dream.1.0.0~alpha4/opam";
    depends = with self; [ base-unix bigarray-compat camlp-streams caqti
                           caqti-lwt conf-libev cstruct dream-httpaf
                           dream-pure dune fmt graphql-lwt graphql_parser
                           logs lwt lwt_ppx lwt_ssl magic-mime mirage-clock
                           mirage-crypto mirage-crypto-rng multipart_form
                           multipart_form-lwt ocaml ptime ssl uri yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  dream-httpaf = {
    name = "dream-httpaf";
    version = "1.0.0+alpha1";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha3/dream-1.0.0-alpha3.tar.gz";
      sha256 = "1g01gz2k9c07qkakszgx055hnkmlwyjqmwzr2awrmqxf14qjb2gj";
    };
    opam = "${repo}/packages/dream-httpaf/dream-httpaf.1.0.0~alpha1/opam";
    depends = with self; [ angstrom base64 bigstringaf digestif dream-pure
                           dune faraday faraday-lwt-unix lwt lwt_ppx lwt_ssl
                           ocaml psq result ssl ];
    buildDepends = with self; [ dune ocaml ];
  };
  dream-pure = {
    name = "dream-pure";
    version = "1.0.0+alpha2";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
      sha256 = "045glrnb15k6vv7avg0s002kycynf5cmir3cl6g0ih379mlv6hx1";
    };
    opam = "${repo}/packages/dream-pure/dream-pure.1.0.0~alpha2/opam";
    depends = with self; [ base64 bigstringaf dune hmap lwt lwt_ppx ocaml
                           ptime uri ];
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
  FPauth-core = {
    name = "FPauth-core";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mikeGEINE/FPauth/archive/1.0.0.tar.gz";
      sha512 = "4eafc8d414a5e9fc954f6cb26080dc1e21600b85e21f4e3a82528b37e8a19ff3d88530cde5f3cdc56dc2ce47fe7d1552ded26ec250d646f0c9f7805773d30305";
    };
    opam = "${repo}/packages/FPauth-core/FPauth-core.1.0.0/opam";
    depends = with self; [ base dream dune lwt_ppx ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  FPauth-strategies = {
    name = "FPauth-strategies";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mikeGEINE/FPauth/archive/1.0.0.tar.gz";
      sha512 = "4eafc8d414a5e9fc954f6cb26080dc1e21600b85e21f4e3a82528b37e8a19ff3d88530cde5f3cdc56dc2ce47fe7d1552ded26ec250d646f0c9f7805773d30305";
    };
    opam = "${repo}/packages/FPauth-strategies/FPauth-strategies.1.0.0/opam";
    depends = with self; [ argon2 base conf-libargon2 dream dune FPauth-core
                           ocaml twostep ];
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
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/multipart_form/releases/download/v0.4.1/multipart_form-0.4.1.tbz";
      sha256 = "36268ee6fec4c53273c2c0b977a4a9f441a5c6ce586773d91d28b599b45540db";
    };
    opam = "${repo}/packages/multipart_form/multipart_form.0.4.1/opam";
    depends = with self; [ angstrom base64 bigstringaf dune fmt ke logs ocaml
                           pecu prettym rresult unstrctrd uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  multipart_form-lwt = {
    name = "multipart_form-lwt";
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/multipart_form/releases/download/v0.4.1/multipart_form-0.4.1.tbz";
      sha256 = "36268ee6fec4c53273c2c0b977a4a9f441a5c6ce586773d91d28b599b45540db";
    };
    opam = "${repo}/packages/multipart_form-lwt/multipart_form-lwt.0.4.1/opam";
    depends = with self; [ angstrom bigstringaf dune ke lwt multipart_form
                           ocaml ];
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
  twostep = {
    name = "twostep";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/marcoonroad/twostep/archive/1.0.1.tar.gz";
      sha512 = "087509e0d4a7d53f0aa968a013444c645d7a08bdd6a3c707176cfca47d695315344c54e425887009ea3c12a2a7e4b084837b8a52cb7a6a8b34a955cfb57f1f31";
    };
    opam = "${repo}/packages/twostep/twostep.1.0.1/opam";
    depends = with self; [ base dune hex mirage-crypto mirage-crypto-pk
                           mirage-crypto-rng ocaml ];
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
