{ pkgs, self, opam-repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
  allRefs = true;
} }:
{
  alcotest = {
    name = "alcotest";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/alcotest/releases/download/1.5.0/alcotest-js-1.5.0.tbz";
      sha256 = "54281907e02d78995df246dc2e10ed182828294ad2059347a1e3a13354848f6c";
    };
    opam = "${opam-repo}/packages/alcotest/alcotest.1.5.0/opam";
    depends = with self; [ astring cmdliner dune fmt ocaml ocaml-syntax-shims
                           re stdlib-shims uutf ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  angstrom = {
    name = "angstrom";
    version = "0.15.0";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/angstrom/archive/0.15.0.tar.gz";
    };
    opam = "${opam-repo}/packages/angstrom/angstrom.0.15.0/opam";
    depends = with self; [ bigstringaf dune ocaml result ];
    buildDepends = with self; [ dune ocaml ocaml-syntax-shims ];
    testDepends = with self; [ alcotest ppx_let ];
  };
  astring = {
    name = "astring";
    version = "0.8.5";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
    };
    opam = "${opam-repo}/packages/astring/astring.0.8.5/opam";
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
    opam = "${opam-repo}/packages/base/base.v0.15.0/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${opam-repo}/packages/base-bigarray/base-bigarray.base/opam";
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${opam-repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  base-threads = {
    name = "base-threads";
    version = "base";
    opam = "${opam-repo}/packages/base-threads/base-threads.base/opam";
  };
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${opam-repo}/packages/base-unix/base-unix.base/opam";
  };
  base64 = {
    name = "base64";
    version = "3.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-base64/releases/download/v3.5.0/base64-v3.5.0.tbz";
      sha256 = "589de9c00578ebfe784198ac9818d3586c474b2316b6cd3e1c46ccb1f62ae3a4";
    };
    opam = "${opam-repo}/packages/base64/base64.3.5.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest bos rresult ];
  };
  base_bigstring = {
    name = "base_bigstring";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base_bigstring-v0.15.0.tar.gz";
      sha256 = "ff75f1748baf83b0244aeba4e1bfff7f2da3f3ab5a992bb8a21ab832cea1d56b";
    };
    opam = "${opam-repo}/packages/base_bigstring/base_bigstring.v0.15.0/opam";
    depends = with self; [ base dune int_repr ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  base_quickcheck = {
    name = "base_quickcheck";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base_quickcheck-v0.15.0.tar.gz";
      sha256 = "360e6b8f3660398936ec88fecb9e7761370ee63acf8372d3208d4d31c00181f2";
    };
    opam = "${opam-repo}/packages/base_quickcheck/base_quickcheck.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                           ppx_sexp_message ppx_sexp_value ppxlib
                           splittable_random ];
    buildDepends = with self; [ dune ocaml ];
  };
  benchmark = {
    name = "benchmark";
    version = "1.6";
    src = builtins.fetchurl {
      url = "https://github.com/Chris00/ocaml-benchmark/releases/download/1.6/benchmark-1.6.tbz";
    };
    opam = "${opam-repo}/packages/benchmark/benchmark.1.6/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bheap = {
    name = "bheap";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/bheap/releases/download/2.0.0/bheap-2.0.0.tbz";
      sha256 = "5f43d7b237bc87b07097f60eae2b32de64e644158308da338bf1512014bdf636";
    };
    opam = "${opam-repo}/packages/bheap/bheap.2.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ stdlib-shims ];
  };
  bigarray-compat = {
    name = "bigarray-compat";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/bigarray-compat/releases/download/v1.1.0/bigarray-compat-1.1.0.tbz";
      sha256 = "434469a48d5c84e80d621b13d95eb067f8138c1650a1fd5ae6009a19b93718d5";
    };
    opam = "${opam-repo}/packages/bigarray-compat/bigarray-compat.1.1.0/opam";
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
    opam = "${opam-repo}/packages/bigarray-overlap/bigarray-overlap.0.2.1/opam";
    depends = with self; [ dune ocaml (self.js_of_ocaml-compiler or null)
                           (self.mirage-xen-posix or null)
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
    testDepends = with self; [ alcotest astring bos fpath ocamlfind ];
  };
  bigstringaf = {
    name = "bigstringaf";
    version = "0.9.0";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/bigstringaf/archive/0.9.0.tar.gz";
    };
    opam = "${opam-repo}/packages/bigstringaf/bigstringaf.0.9.0/opam";
    depends = with self; [ dune ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  bin_prot = {
    name = "bin_prot";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/bin_prot-v0.15.0.tar.gz";
      sha256 = "7a4ba0daeacfb87e9cb7e8f49afac43a9bbb64dee4801fd789f1f188059d3690";
    };
    opam = "${opam-repo}/packages/bin_prot/bin_prot.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_custom_printf
                           ppx_fields_conv ppx_optcomp ppx_sexp_conv
                           ppx_variants_conv (self.mirage-xen-ocaml or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  biniou = {
    name = "biniou";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/biniou/releases/download/1.2.1/biniou-1.2.1.tbz";
      sha256 = "35546c68b1929a8e6d27a3b39ecd17b38303a0d47e65eb9d1480c2061ea84335";
    };
    opam = "${opam-repo}/packages/biniou/biniou.1.2.1/opam";
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
    opam = "${opam-repo}/packages/bos/bos.0.2.1/opam";
    depends = with self; [ astring base-unix fmt fpath logs ocaml rresult ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
    testDepends = with self; [ mtime ];
  };
  camlp-streams = {
    name = "camlp-streams";
    version = "5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/camlp-streams/archive/refs/tags/v5.0.tar.gz";
      sha512 = "f42e2f5e5ca353b3d647cd7e97a278c167c2d1abd185a634f155965cec29e35d9be7ce940b4c205b0577d7e9b6f714580bfd2e2fd79f1b1b461bc3fb96d26d36";
    };
    opam = "${opam-repo}/packages/camlp-streams/camlp-streams.5.0/opam";
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
    opam = "${opam-repo}/packages/camomile/camomile.1.0.2/opam";
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
    opam = "${opam-repo}/packages/caqti/caqti.1.8.0/opam";
    depends = with self; [ angstrom bigstringaf dune logs ocaml ptime uri ];
    buildDepends = with self; [ cppo dune ocaml ];
    testDepends = with self; [ alcotest cmdliner re ];
    docDepends = with self; [ odoc ];
  };
  caqti-lwt = {
    name = "caqti-lwt";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.8.0/caqti-v1.8.0.tbz";
      sha256 = "2630233f335f910290e24b318ac7f6e712b3109fb55581b2b8c324127a9a4b12";
    };
    opam = "${opam-repo}/packages/caqti-lwt/caqti-lwt.1.8.0/opam";
    depends = with self; [ caqti dune logs lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest alcotest-lwt caqti-driver-sqlite3
                               caqti-dynload cmdliner ];
    docDepends = with self; [ odoc ];
  };
  charInfo_width = {
    name = "charInfo_width";
    version = "1.1.0";
    src = builtins.fetchurl {
      url = "https://github.com/kandu/charInfo_width/archive/1.1.0.tar.gz";
    };
    opam = "${opam-repo}/packages/charInfo_width/charInfo_width.1.1.0/opam";
    depends = with self; [ camomile dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ppx_expect ];
  };
  cmdliner = {
    name = "cmdliner";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
      sha512 = "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
    };
    opam = "${opam-repo}/packages/cmdliner/cmdliner.1.1.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  conf-binutils = {
    name = "conf-binutils";
    version = "0.3";
    opam = "${opam-repo}/packages/conf-binutils/conf-binutils.0.3/opam";
    depends = with self; [ base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ binutils ];
  };
  conf-libev = {
    name = "conf-libev";
    version = "4+12";
    opam = "${opam-repo}/packages/conf-libev/conf-libev.4-12/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ libev ];
  };
  conf-libssl = {
    name = "conf-libssl";
    version = "4";
    opam = "${opam-repo}/packages/conf-libssl/conf-libssl.4/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ openssl ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${opam-repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  containers = {
    name = "containers";
    version = "3.7";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-containers/archive/v3.7.tar.gz";
      sha512 = "70f99a062f7696d4ed7a6336532261c93c49a9858a84a12f7f3d60190a5c664198e70be6281dc7c7932c07325dc9c579ff521367e4c7e083566910ba0f9ea760";
    };
    opam = "${opam-repo}/packages/containers/containers.3.7/opam";
    depends = with self; [ dune dune-configurator either ocaml seq
                           (self.base-threads or null)
                           (self.base-unix or null) ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ csexp gen iter ounit qcheck qtest uutf ];
    docDepends = with self; [ odoc ];
  };
  core = {
    name = "core";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core-v0.15.0.tar.gz";
      sha256 = "3a656f2b8605dd052da6459ad8dace3263d21efe15ef2b3bd36aaa8f8ce85e1f";
    };
    opam = "${opam-repo}/packages/core/core.v0.15.0/opam";
    depends = with self; [ base base_bigstring base_quickcheck bin_prot dune
                           fieldslib jane-street-headers jst-config ocaml
                           ppx_assert ppx_base ppx_hash ppx_inline_test
                           ppx_jane ppx_sexp_conv ppx_sexp_message sexplib
                           splittable_random stdio time_now typerep
                           variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  core_bench = {
    name = "core_bench";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_bench-v0.15.0.tar.gz";
      sha256 = "5db364e75b35f0ba1d528d5edfc6c701abeb619ce1879a1199251e2a8c535258";
    };
    opam = "${opam-repo}/packages/core_bench/core_bench.v0.15.0/opam";
    depends = with self; [ core core_kernel core_unix dune ocaml ppx_compare
                           ppx_fields_conv ppx_jane ppx_let ppx_sexp_conv re
                           textutils ];
    buildDepends = with self; [ dune ocaml ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_kernel-v0.15.0.tar.gz";
      sha256 = "34a0288f16027c6b90e4ad16cb5cc677d7063d310faf918748ce70f1745116c0";
    };
    opam = "${opam-repo}/packages/core_kernel/core_kernel.v0.15.0/opam";
    depends = with self; [ base base-threads core dune int_repr ocaml
                           ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  core_unix = {
    name = "core_unix";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_unix-v0.15.0.tar.gz";
      sha256 = "0af9d2c0d2029a80858c730171e0bd70a1981b3e7021f8c31cd8dc54925da02d";
    };
    opam = "${opam-repo}/packages/core_unix/core_unix.v0.15.0/opam";
    depends = with self; [ base-threads core core_kernel dune
                           expect_test_helpers_core jane-street-headers
                           jst-config ocaml ocaml_intrinsics ppx_jane sexplib
                           spawn timezone ];
    buildDepends = with self; [ dune ocaml ];
    depexts = with pkgs; [ (pkgs.linux-headers or null) ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${opam-repo}/packages/cppo/cppo.1.6.9/opam";
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
    opam = "${opam-repo}/packages/csexp/csexp.1.5.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  cstruct = {
    name = "cstruct";
    version = "6.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.0/cstruct-6.1.0.tbz";
      sha256 = "4f0d2d7d6b7048c99e5d9d62e62ed3fe957bdede56b385567962075c969f1d8b";
    };
    opam = "${opam-repo}/packages/cstruct/cstruct.6.1.0/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest crowbar ];
  };
  digestif = {
    name = "digestif";
    version = "1.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/digestif/releases/download/v1.1.2/digestif-1.1.2.tbz";
      sha256 = "79d34ce513b114857e380aabdf6f1473218f1b05dd7e51d03890779ed01b4666";
    };
    opam = "${opam-repo}/packages/digestif/digestif.1.1.2/opam";
    depends = with self; [ dune eqaf ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
    testDepends = with self; [ alcotest astring bos fmt fpath ocamlfind
                               rresult ];
  };
  domain-name = {
    name = "domain-name";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/domain-name/releases/download/v0.4.0/domain-name-0.4.0.tbz";
      sha256 = "a5c06e22845895201973e812fe3019274d1db81c0a7873da6c8007c4ad2108c5";
    };
    opam = "${opam-repo}/packages/domain-name/domain-name.0.4.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  dream = {
    name = "dream";
    version = "1.0.0+alpha4";
    src = builtins.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
    };
    opam = "${opam-repo}/packages/dream/dream.1.0.0~alpha4/opam";
    depends = with self; [ base-unix bigarray-compat camlp-streams caqti
                           caqti-lwt conf-libev cstruct dream-httpaf
                           dream-pure dune fmt graphql-lwt graphql_parser
                           logs lwt lwt_ppx lwt_ssl magic-mime mirage-clock
                           mirage-crypto mirage-crypto-rng multipart_form
                           multipart_form-lwt ocaml ptime ssl uri yojson ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest bisect_ppx caqti-driver-postgresql
                               caqti-driver-sqlite3 crunch lambdasoup
                               ppx_expect ppx_yojson_conv reason tyxml
                               tyxml-jsx tyxml-ppx ];
  };
  dream-httpaf = {
    name = "dream-httpaf";
    version = "1.0.0+alpha1";
    src = builtins.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha3/dream-1.0.0-alpha3.tar.gz";
    };
    opam = "${opam-repo}/packages/dream-httpaf/dream-httpaf.1.0.0~alpha1/opam";
    depends = with self; [ angstrom base64 bigstringaf digestif dream-pure
                           dune faraday faraday-lwt-unix lwt lwt_ppx lwt_ssl
                           ocaml psq result ssl ];
    buildDepends = with self; [ dune ocaml ];
  };
  dream-pure = {
    name = "dream-pure";
    version = "1.0.0+alpha2";
    src = builtins.fetchurl {
      url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
    };
    opam = "${opam-repo}/packages/dream-pure/dream-pure.1.0.0~alpha2/opam";
    depends = with self; [ base64 bigstringaf dune hmap lwt lwt_ppx ocaml
                           ptime uri ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest bisect_ppx ppx_expect ppx_yojson_conv ];
  };
  dune = {
    name = "dune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/dune/dune.3.2.0/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  dune-build-info = {
    name = "dune-build-info";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/dune-build-info/dune-build-info.3.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/dune-configurator/dune-configurator.3.2.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  dune-rpc = {
    name = "dune-rpc";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/dune-rpc/dune-rpc.3.2.0/opam";
    depends = with self; [ csexp dune dyn ordering pp stdune xdg ];
    buildDepends = with self; [ dune ];
    docDepends = with self; [ odoc ];
  };
  duration = {
    name = "duration";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/duration/releases/download/0.2.0/duration-0.2.0.tbz";
      sha256 = "ad14fb75a5a6f73fff7ef1721178925ee555cf0f23b23e3ab329184bc0c1ce69";
    };
    opam = "${opam-repo}/packages/duration/duration.0.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  dyn = {
    name = "dyn";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/dyn/dyn.3.2.0/opam";
    depends = with self; [ dune ocaml ordering pp ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  easy-format = {
    name = "easy-format";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/easy-format/releases/download/1.3.3/easy-format-1.3.3.tbz";
      sha256 = "eafccae911c26ca23e4ddacee3eaa54654d20f973b8680f84b708cef43adc416";
    };
    opam = "${opam-repo}/packages/easy-format/easy-format.1.3.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  either = {
    name = "either";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
      sha256 = "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
    };
    opam = "${opam-repo}/packages/either/either.1.0.0/opam";
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
    opam = "${opam-repo}/packages/emile/emile.1.1/opam";
    depends = with self; [ angstrom base64 bigstringaf dune ipaddr ocaml pecu
                           uutf (self.cmdliner or null) ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  eqaf = {
    name = "eqaf";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/eqaf/releases/download/v0.8/eqaf-v0.8.tbz";
      sha256 = "1145a160107437d7943e02e486df6bd233d3937ec1a597d7fa39edb9471cf875";
    };
    opam = "${opam-repo}/packages/eqaf/eqaf.0.8/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest base64 crowbar ];
  };
  expect_test_helpers_core = {
    name = "expect_test_helpers_core";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/expect_test_helpers_core-v0.15.0.tar.gz";
      sha256 = "7f2a738564253e32c8bd816f9da548d1619e447b6ebc4c7af33e5c0c52ff9652";
    };
    opam = "${opam-repo}/packages/expect_test_helpers_core/expect_test_helpers_core.v0.15.0/opam";
    depends = with self; [ base base_quickcheck core dune ocaml ppx_jane re
                           sexp_pretty stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  faraday = {
    name = "faraday";
    version = "0.8.1";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
    };
    opam = "${opam-repo}/packages/faraday/faraday.0.8.1/opam";
    depends = with self; [ bigstringaf dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  faraday-lwt = {
    name = "faraday-lwt";
    version = "0.8.1";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
    };
    opam = "${opam-repo}/packages/faraday-lwt/faraday-lwt.0.8.1/opam";
    depends = with self; [ dune faraday lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  faraday-lwt-unix = {
    name = "faraday-lwt-unix";
    version = "0.8.1";
    src = builtins.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
    };
    opam = "${opam-repo}/packages/faraday-lwt-unix/faraday-lwt-unix.0.8.1/opam";
    depends = with self; [ base-unix dune faraday-lwt lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fiber = {
    name = "fiber";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/fiber/fiber.3.2.0/opam";
    depends = with self; [ dune dyn ocaml stdune ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  fieldslib = {
    name = "fieldslib";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/fieldslib-v0.15.0.tar.gz";
      sha256 = "050afd7327840c63483616f9781c6ec127e0e48d270f237f89f56f5290fb7120";
    };
    opam = "${opam-repo}/packages/fieldslib/fieldslib.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fix = {
    name = "fix";
    version = "20220121";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/fix/-/archive/20220121/archive.tar.gz";
      sha512 = "a851d8783c0c519c6e55359a5c471af433058872409c29a1a7bdfd0076813341ad2c0ebd1ce9e28bff4d4c729dfbc808c41c084fe12a42b45a2b5e391e77ccd2";
    };
    opam = "${opam-repo}/packages/fix/fix.20220121/opam";
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
    opam = "${opam-repo}/packages/fmt/fmt.0.9.0/opam";
    depends = with self; [ ocaml (self.base-unix or null)
                           (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  fpath = {
    name = "fpath";
    version = "0.7.3";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/fpath/releases/fpath-0.7.3.tbz";
    };
    opam = "${opam-repo}/packages/fpath/fpath.0.7.3/opam";
    depends = with self; [ astring ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  functoria = {
    name = "functoria";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${opam-repo}/packages/functoria/functoria.4.1.1/opam";
    depends = with self; [ astring base-unix bos cmdliner dune emile fmt
                           fpath logs ocaml result rresult uri ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest functoria-runtime ];
  };
  functoria-runtime = {
    name = "functoria-runtime";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${opam-repo}/packages/functoria-runtime/functoria-runtime.4.1.1/opam";
    depends = with self; [ cmdliner dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  gen = {
    name = "gen";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/gen/archive/v1.0.tar.gz";
      sha512 = "fb4ec2ab35a1aba0dcc8439b11f14a0a785d939f661f505aec88a6f2ca6ca87e14ddfda860d9c180b215190b76690de87040c144582f069224f7e58d37ef48a0";
    };
    opam = "${opam-repo}/packages/gen/gen.1.0/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit2 qcheck qtest ];
    docDepends = with self; [ odoc ];
  };
  graphql = {
    name = "graphql";
    version = "0.13.0";
    src = builtins.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
    };
    opam = "${opam-repo}/packages/graphql/graphql.0.13.0/opam";
    depends = with self; [ dune graphql_parser ocaml rresult seq yojson ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  graphql-lwt = {
    name = "graphql-lwt";
    version = "0.13.0";
    src = builtins.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
    };
    opam = "${opam-repo}/packages/graphql-lwt/graphql-lwt.0.13.0/opam";
    depends = with self; [ dune graphql lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  graphql_parser = {
    name = "graphql_parser";
    version = "0.13.0";
    src = builtins.fetchurl {
      url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.13.0/graphql-0.13.0.tbz";
    };
    opam = "${opam-repo}/packages/graphql_parser/graphql_parser.0.13.0/opam";
    depends = with self; [ dune fmt ocaml re ];
    buildDepends = with self; [ dune menhir ocaml ];
    testDepends = with self; [ alcotest ];
  };
  hmap = {
    name = "hmap";
    version = "0.8.1";
    src = builtins.fetchurl {
      url = "http://erratique.ch/software/hmap/releases/hmap-0.8.1.tbz";
    };
    opam = "${opam-repo}/packages/hmap/hmap.0.8.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  int_repr = {
    name = "int_repr";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/int_repr-v0.15.0.tar.gz";
      sha256 = "5d357b58914bcaa183432f2cfafc726ecccaa36f42cab982ab32e8b1c1ed6719";
    };
    opam = "${opam-repo}/packages/int_repr/int_repr.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  ipaddr = {
    name = "ipaddr";
    version = "5.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.0/ipaddr-5.3.0.tbz";
      sha256 = "36979edf64b464d44055f3504b97d61e22050e7369d983052c4ecc3d2b1ab755";
    };
    opam = "${opam-repo}/packages/ipaddr/ipaddr.5.3.0/opam";
    depends = with self; [ domain-name dune macaddr ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit ppx_sexp_conv ];
  };
  irmin = {
    name = "irmin";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${opam-repo}/packages/irmin/irmin.3.2.2/opam";
    depends = with self; [ astring bheap bigstringaf digestif dune fmt jsonm
                           logs lwt mtime ocaml ocamlgraph ppx_irmin repr uri
                           uutf ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest alcotest-lwt hex vector ];
    docDepends = with self; [ odoc ];
  };
  iter = {
    name = "iter";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/sequence/archive/v1.4.tar.gz";
      sha512 = "8bcb6ddaab69aa18a8489a2287313227d59062fd554f70373a10bdbe1d1eabe4b199860223709fe7baa917d0d47aedeed895ed6d610a989ca540e00fe9cd135b";
    };
    opam = "${opam-repo}/packages/iter/iter.1.4/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml result
                           (self.base-bigarray or null) ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ mdx qcheck qtest ];
    docDepends = with self; [ odoc ];
  };
  jane-street-headers = {
    name = "jane-street-headers";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/jane-street-headers-v0.15.0.tar.gz";
      sha256 = "34e4a37b26e3827da129c0ac7add26e8c09a21a704d55ca05211a8de17c847e4";
    };
    opam = "${opam-repo}/packages/jane-street-headers/jane-street-headers.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  jsonm = {
    name = "jsonm";
    version = "1.0.1";
    src = builtins.fetchurl {
      url = "http://erratique.ch/software/jsonm/releases/jsonm-1.0.1.tbz";
    };
    opam = "${opam-repo}/packages/jsonm/jsonm.1.0.1/opam";
    depends = with self; [ ocaml uchar uutf ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  jst-config = {
    name = "jst-config";
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/jst-config/archive/refs/tags/v0.15.1.tar.gz";
      sha256 = "7053e5bbb3016b760c1e8f419814ad059625105db25dafa020676fcfc0f3b41b";
    };
    opam = "${opam-repo}/packages/jst-config/jst-config.v0.15.1/opam";
    depends = with self; [ base dune dune-configurator ocaml ppx_assert ];
    buildDepends = with self; [ dune ocaml ];
  };
  ke = {
    name = "ke";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ke/releases/download/v0.6/ke-0.6.tbz";
      sha256 = "61217207e2200b04b17759736610ff9208269a647f854cb5ae72cdac0d672305";
    };
    opam = "${opam-repo}/packages/ke/ke.0.6/opam";
    depends = with self; [ dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest bechamel bechamel-notty bechamel-perf
                               bigstringaf cmdliner core_bench crowbar jsonm
                               lwt ocplib-json-typed psq rresult ];
  };
  lambda-term = {
    name = "lambda-term";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/lambda-term/releases/download/3.2.0/lambda-term-3.2.0.tar.gz";
      sha512 = "46cd46f47c9f34c0a5e096b96e6eec59667b645bf5201140e498e6d4eb9baba8204a2b30b73c4b2f8140e5cf1972a56e3aa485b27bc5ace25b2c368f713ad7c4";
    };
    opam = "${opam-repo}/packages/lambda-term/lambda-term.3.2.0/opam";
    depends = with self; [ camomile dune lwt lwt_log lwt_react mew_vi ocaml
                           react zed ];
    buildDepends = with self; [ dune ocaml ];
  };
  logs = {
    name = "logs";
    version = "0.7.0";
    src = builtins.fetchurl {
      url = "https://erratique.ch/software/logs/releases/logs-0.7.0.tbz";
    };
    opam = "${opam-repo}/packages/logs/logs.0.7.0/opam";
    depends = with self; [ ocaml (self.base-threads or null)
                           (self.cmdliner or null) (self.fmt or null)
                           (self.js_of_ocaml or null) (self.lwt or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
    testDepends = with self; [ mtime ];
  };
  lwt = {
    name = "lwt";
    version = "5.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${opam-repo}/packages/lwt/lwt.5.5.0/opam";
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
    src = builtins.fetchurl {
      url = "https://github.com/aantron/lwt_log/archive/1.1.1.tar.gz";
    };
    opam = "${opam-repo}/packages/lwt_log/lwt_log.1.1.1/opam";
    depends = with self; [ dune lwt ];
    buildDepends = with self; [ dune ];
  };
  lwt_ppx = {
    name = "lwt_ppx";
    version = "2.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${opam-repo}/packages/lwt_ppx/lwt_ppx.2.0.3/opam";
    depends = with self; [ dune lwt ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  lwt_react = {
    name = "lwt_react";
    version = "1.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${opam-repo}/packages/lwt_react/lwt_react.1.1.5/opam";
    depends = with self; [ dune lwt ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  lwt_ssl = {
    name = "lwt_ssl";
    version = "1.1.3";
    src = builtins.fetchurl {
      url = "https://github.com/ocsigen/lwt_ssl/archive/1.1.3.tar.gz";
    };
    opam = "${opam-repo}/packages/lwt_ssl/lwt_ssl.1.1.3/opam";
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
    opam = "${opam-repo}/packages/macaddr/macaddr.5.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit ppx_sexp_conv ];
  };
  magic-mime = {
    name = "magic-mime";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-magic-mime/releases/download/v1.2.0/magic-mime-v1.2.0.tbz";
      sha256 = "f121b67500f8dd97e2fc9fd5d01c7325e4c84bc5c0237442779fbd6fa20694f5";
    };
    opam = "${opam-repo}/packages/magic-mime/magic-mime.1.2.0/opam";
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
    opam = "${opam-repo}/packages/menhir/menhir.20220210/opam";
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
    opam = "${opam-repo}/packages/menhirLib/menhirLib.20220210/opam";
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
    opam = "${opam-repo}/packages/menhirSdk/menhirSdk.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew = {
    name = "mew";
    version = "0.1.0";
    src = builtins.fetchurl {
      url = "https://github.com/kandu/mew/archive/0.1.0.tar.gz";
    };
    opam = "${opam-repo}/packages/mew/mew.0.1.0/opam";
    depends = with self; [ dune ocaml result trie ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew_vi = {
    name = "mew_vi";
    version = "0.5.0";
    src = builtins.fetchurl {
      url = "https://github.com/kandu/mew_vi/archive/0.5.0.tar.gz";
    };
    opam = "${opam-repo}/packages/mew_vi/mew_vi.0.5.0/opam";
    depends = with self; [ dune mew ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  mirage = {
    name = "mirage";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${opam-repo}/packages/mirage/mirage.4.1.1/opam";
    depends = with self; [ astring bos dune functoria ipaddr logs
                           mirage-runtime ocaml opam-monorepo ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest fmt ];
  };
  mirage-clock = {
    name = "mirage-clock";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-clock/releases/download/v4.2.0/mirage-clock-4.2.0.tbz";
      sha256 = "fa17d15d5be23c79ba741f5f7cb88ed7112de16a4410cea81c71b98086889847";
    };
    opam = "${opam-repo}/packages/mirage-clock/mirage-clock.4.2.0/opam";
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
    opam = "${opam-repo}/packages/mirage-crypto/mirage-crypto.0.10.6/opam";
    depends = with self; [ cstruct dune dune-configurator eqaf ocaml
                           (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
    testDepends = with self; [ ounit2 ];
  };
  mirage-crypto-rng = {
    name = "mirage-crypto-rng";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.6/mirage-crypto-0.10.6.tbz";
      sha256 = "01d6477a4edcad007b56983955d327f0e61c3f36494822f3755017d26e8f9410";
    };
    opam = "${opam-repo}/packages/mirage-crypto-rng/mirage-crypto-rng.0.10.6/opam";
    depends = with self; [ cstruct dune dune-configurator duration logs lwt
                           mirage-crypto mtime ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit2 randomconv ];
  };
  mirage-runtime = {
    name = "mirage-runtime";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage/releases/download/v4.1.1/mirage-4.1.1.tbz";
      sha256 = "3ace4c8fd3326e95a0f2b7eb7ab07b1d9f36e37de1b0066cae27d36b4fc58715";
    };
    opam = "${opam-repo}/packages/mirage-runtime/mirage-runtime.4.1.1/opam";
    depends = with self; [ dune fmt functoria-runtime ipaddr logs lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  mmap = {
    name = "mmap";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mmap/releases/download/v1.2.0/mmap-1.2.0.tbz";
      sha256 = "1602a8abc8e232fa94771a52e540e5780b40c2f2762eee6afbd9286502116ddb";
    };
    opam = "${opam-repo}/packages/mmap/mmap.1.2.0/opam";
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
    opam = "${opam-repo}/packages/mtime/mtime.1.4.0/opam";
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
    opam = "${opam-repo}/packages/multipart_form/multipart_form.0.4.1/opam";
    depends = with self; [ angstrom base64 bigstringaf dune fmt ke logs ocaml
                           pecu prettym rresult unstrctrd uutf ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest rosetta ];
  };
  multipart_form-lwt = {
    name = "multipart_form-lwt";
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/multipart_form/releases/download/v0.4.1/multipart_form-0.4.1.tbz";
      sha256 = "36268ee6fec4c53273c2c0b977a4a9f441a5c6ce586773d91d28b599b45540db";
    };
    opam = "${opam-repo}/packages/multipart_form-lwt/multipart_form-lwt.0.4.1/opam";
    depends = with self; [ angstrom bigstringaf dune ke lwt multipart_form
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest alcotest-lwt fmt logs rosetta rresult
                               unstrctrd ];
  };
  num = {
    name = "num";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
      sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
    };
    opam = "${opam-repo}/packages/num/num.1.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.14.0";
    opam = "${opam-repo}/packages/ocaml/ocaml.4.14.0/opam";
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
    opam = "${opam-repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.14.0/opam";
  };
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.12.4";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.4/ocaml-compiler-libs-v0.12.4.tbz";
      sha256 = "4ec9c9ec35cc45c18c7a143761154ef1d7663036a29297f80381f47981a07760";
    };
    opam = "${opam-repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.4/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${opam-repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-lsp-server = {
    name = "ocaml-lsp-server";
    version = "1.11.6";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-lsp/releases/download/1.11.6/jsonrpc-1.11.6.tbz";
      sha256 = "50b546ced5332c4a038bcf68b65b7888cb8e61aebe102e8c80b23a4c5899bbbb";
    };
    opam = "${opam-repo}/packages/ocaml-lsp-server/ocaml-lsp-server.1.11.6/opam";
    depends = with self; [ csexp dune dune-build-info dune-rpc dyn fiber
                           ocaml ocamlformat-rpc-lib octavius omd ordering pp
                           ppx_yojson_conv_lib re spawn stdune uutf xdg
                           yojson ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  ocaml-options-vanilla = {
    name = "ocaml-options-vanilla";
    version = "1";
    opam = "${opam-repo}/packages/ocaml-options-vanilla/ocaml-options-vanilla.1/opam";
  };
  ocaml-syntax-shims = {
    name = "ocaml-syntax-shims";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-syntax-shims/releases/download/1.0.0/ocaml-syntax-shims-1.0.0.tbz";
      sha256 = "89b2e193e90a0c168b6ec5ddf6fef09033681bdcb64e11913c97440a2722e8c8";
    };
    opam = "${opam-repo}/packages/ocaml-syntax-shims/ocaml-syntax-shims.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ocaml-version = {
    name = "ocaml-version";
    version = "3.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocurrent/ocaml-version/releases/download/v3.4.0/ocaml-version-v3.4.0.tbz";
      sha256 = "d8c1beb5e8d8ebb7710b5f434ce66a3ec8b752b1e4d6ba87c4fe27452bdb8a25";
    };
    opam = "${opam-repo}/packages/ocaml-version/ocaml-version.3.4.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  ocaml_intrinsics = {
    name = "ocaml_intrinsics";
    version = "v0.15.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml_intrinsics/archive/refs/tags/v0.15.2.tar.gz";
      sha256 = "92064a7fcebf1654d44f4d29abec0a9650505c3929b6d38fb293c2b69e5ca5ca";
    };
    opam = "${opam-repo}/packages/ocaml_intrinsics/ocaml_intrinsics.v0.15.2/opam";
    depends = with self; [ dune dune-configurator ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${opam-repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
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
    opam = "${opam-repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
    buildDepends = with self; [ ocaml ];
  };
  ocamlformat = {
    name = "ocamlformat";
    version = "0.21.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocamlformat/releases/download/0.21.0/ocamlformat-0.21.0.tbz";
      sha256 = "2a1817f6bc581ff0cce9f0aa9687b897b02726e2ab75749ee98d57637057332d";
    };
    opam = "${opam-repo}/packages/ocamlformat/ocamlformat.0.21.0/opam";
    depends = with self; [ base cmdliner dune dune-build-info either fix
                           fpath menhir menhirLib menhirSdk ocaml
                           ocaml-version ocp-indent odoc-parser re stdio
                           uuseg uutf ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest ];
    docDepends = with self; [ odoc ];
  };
  ocamlformat-rpc-lib = {
    name = "ocamlformat-rpc-lib";
    version = "0.21.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocamlformat/releases/download/0.21.0/ocamlformat-0.21.0.tbz";
      sha256 = "2a1817f6bc581ff0cce9f0aa9687b897b02726e2ab75749ee98d57637057332d";
    };
    opam = "${opam-repo}/packages/ocamlformat-rpc-lib/ocamlformat-rpc-lib.0.21.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  ocamlgraph = {
    name = "ocamlgraph";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
      sha256 = "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
    };
    opam = "${opam-repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ graphics ];
  };
  ocp-browser = {
    name = "ocp-browser";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-index/archive/refs/tags/1.3.3.tar.gz";
      sha512 = "6360240c951ac64baf9b3736c9a37c41a5ac8c5ddf52e723019fb5ef294e786e245712fd88f408bd8f6881d8741ab152872181062acd81443eec07d1d703e85a";
    };
    opam = "${opam-repo}/packages/ocp-browser/ocp-browser.1.3.3/opam";
    depends = with self; [ cmdliner dune lambda-term ocaml ocp-index zed ];
    buildDepends = with self; [ cppo dune ocaml ];
    testDepends = with self; [ odoc ];
  };
  ocp-indent = {
    name = "ocp-indent";
    version = "1.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-indent/archive/1.8.1.tar.gz";
      sha512 = "565353de333dd44375366fff75e85a6256c3cd9ff52b3db79803141f975e77cda04dfe32f5e0f2d4c82c59be8f04e9c2bf4d066b113b2cdf267f4c3dcfa401da";
    };
    opam = "${opam-repo}/packages/ocp-indent/ocp-indent.1.8.1/opam";
    depends = with self; [ base-bytes cmdliner dune ocaml ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  ocp-index = {
    name = "ocp-index";
    version = "1.3.3";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-index/archive/refs/tags/1.3.3.tar.gz";
      sha512 = "6360240c951ac64baf9b3736c9a37c41a5ac8c5ddf52e723019fb5ef294e786e245712fd88f408bd8f6881d8741ab152872181062acd81443eec07d1d703e85a";
    };
    opam = "${opam-repo}/packages/ocp-index/ocp-index.1.3.3/opam";
    depends = with self; [ cmdliner dune ocaml ocp-indent re ];
    buildDepends = with self; [ cppo dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  ocplib-endian = {
    name = "ocplib-endian";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocplib-endian/archive/refs/tags/1.2.tar.gz";
      sha512 = "2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85";
    };
    opam = "${opam-repo}/packages/ocplib-endian/ocplib-endian.1.2/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  octavius = {
    name = "octavius";
    version = "1.2.2";
    src = builtins.fetchurl {
      url = "https://github.com/ocaml-doc/octavius/archive/v1.2.2.tar.gz";
    };
    opam = "${opam-repo}/packages/octavius/octavius.1.2.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  odoc-parser = {
    name = "odoc-parser";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-doc/odoc-parser/releases/download/1.0.0/odoc-parser-1.0.0.tbz";
      sha256 = "b6aa08ea71a9ebad9b2bebc4da1eda0d713cf3674e6d57d10459d934286e7aa1";
    };
    opam = "${opam-repo}/packages/odoc-parser/odoc-parser.1.0.0/opam";
    depends = with self; [ astring dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ppx_expect (self.ocaml or null)
                               (self.sexplib0 or null) ];
  };
  omd = {
    name = "omd";
    version = "1.3.1";
    src = builtins.fetchurl {
      url = "https://github.com/Chris00/omd/releases/download/1.3.1/omd-1.3.1.tar.gz";
    };
    opam = "${opam-repo}/packages/omd/omd.1.3.1/opam";
    depends = with self; [ base-bigarray base-bytes ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  opam-monorepo = {
    name = "opam-monorepo";
    version = "0.3.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/opam-monorepo/releases/download/0.3.1/opam-monorepo-0.3.1.tbz";
      sha256 = "6303da2673fdaaf2da77b62274a9717706befe890981e183ab0c9e94e734bc67";
    };
    opam = "${opam-repo}/packages/opam-monorepo/opam-monorepo.0.3.1/opam";
    depends = with self; [ conf-pkg-config dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  optint = {
    name = "optint";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/optint/releases/download/v0.2.0/optint-0.2.0.tbz";
      sha256 = "1dcbe0b6b6031f77db33028c87138fdb3bf90f92915e3b6629ddeb30a0d3000b";
    };
    opam = "${opam-repo}/packages/optint/optint.0.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ crowbar fmt monolith ];
  };
  ordering = {
    name = "ordering";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/ordering/ordering.3.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  parsexp = {
    name = "parsexp";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/parsexp-v0.15.0.tar.gz";
      sha256 = "d1ee902b12ac7c0c888863025990d06845530fb75328454814e5ce5b6d43d193";
    };
    opam = "${opam-repo}/packages/parsexp/parsexp.v0.15.0/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  pecu = {
    name = "pecu";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/pecu/releases/download/v0.6/pecu-v0.6.tbz";
      sha256 = "a9d2b7da444c83b20f879f6c3b7fc911d08ac1e6245ad7105437504f9394e5c7";
    };
    opam = "${opam-repo}/packages/pecu/pecu.0.6/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest astring crowbar fmt ];
  };
  pp = {
    name = "pp";
    version = "1.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-dune/pp/releases/download/1.1.2/pp-1.1.2.tbz";
      sha256 = "e4a4e98d96b1bb76950fcd6da4e938c86d989df4d7e48f02f7a44595f5af1d56";
    };
    opam = "${opam-repo}/packages/pp/pp.1.1.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ppx_expect ];
  };
  ppx_assert = {
    name = "ppx_assert";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_assert-v0.15.0.tar.gz";
      sha256 = "4e5f653f84232569cd7d8e04d09ebba28b395e4be037c0b1e122e82cbe0f5967";
    };
    opam = "${opam-repo}/packages/ppx_assert/ppx_assert.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_cold ppx_compare ppx_here
                           ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_base = {
    name = "ppx_base";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_base-v0.15.0.tar.gz";
      sha256 = "d6bbad352ea547c9c0a3636abe87287d5a680b46a06ddd70d6126905853f3ca0";
    };
    opam = "${opam-repo}/packages/ppx_base/ppx_base.v0.15.0/opam";
    depends = with self; [ dune ocaml ppx_cold ppx_compare ppx_enumerate
                           ppx_hash ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bench = {
    name = "ppx_bench";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_bench-v0.15.0.tar.gz";
      sha256 = "b188c72c3ecd7273fbecece152da206df937263ed5bf0d3163e9a123a8c2e17e";
    };
    opam = "${opam-repo}/packages/ppx_bench/ppx_bench.v0.15.0/opam";
    depends = with self; [ dune ocaml ppx_inline_test ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bin_prot = {
    name = "ppx_bin_prot";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_bin_prot-v0.15.0.tar.gz";
      sha256 = "b2c8e62211d9a3ae5f91984613b812e0416c73120a2a18b8670d131110154013";
    };
    opam = "${opam-repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.15.0/opam";
    depends = with self; [ base bin_prot dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cold = {
    name = "ppx_cold";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_cold-v0.15.0.tar.gz";
      sha256 = "8b9fae3341332411e46209d6639d75810260caa897aff4945500612db8abf88d";
    };
    opam = "${opam-repo}/packages/ppx_cold/ppx_cold.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_compare = {
    name = "ppx_compare";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_compare-v0.15.0.tar.gz";
      sha256 = "6a0728929a7b591dffa0f1099d989854f871238697c70b34475eb9ffdce17385";
    };
    opam = "${opam-repo}/packages/ppx_compare/ppx_compare.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_custom_printf = {
    name = "ppx_custom_printf";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_custom_printf-v0.15.0.tar.gz";
      sha256 = "ae0ca7773cdbabf8caac90353c953fc4654ad3d988219c7ce6a03b08f2a3a680";
    };
    opam = "${opam-repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_derivers = {
    name = "ppx_derivers";
    version = "1.2.1";
    src = builtins.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
    };
    opam = "${opam-repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
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
    opam = "${opam-repo}/packages/ppx_deriving/ppx_deriving.5.2.1/opam";
    depends = with self; [ dune ocaml ocamlfind ppx_derivers ppxlib result ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
    testDepends = with self; [ ounit2 ];
  };
  ppx_disable_unused_warnings = {
    name = "ppx_disable_unused_warnings";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_disable_unused_warnings-v0.15.0.tar.gz";
      sha256 = "aeab318cb7541f9b22da50268492ff9d161ece9003ed5b1977917da346f6eebe";
    };
    opam = "${opam-repo}/packages/ppx_disable_unused_warnings/ppx_disable_unused_warnings.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_enumerate = {
    name = "ppx_enumerate";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_enumerate-v0.15.0.tar.gz";
      sha256 = "deb5fb9ca12ade3e4fb8093f1cfdf50a03735b9db19a7535ad534331fb98d09b";
    };
    opam = "${opam-repo}/packages/ppx_enumerate/ppx_enumerate.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_expect = {
    name = "ppx_expect";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_expect-v0.15.0.tar.gz";
      sha256 = "06315a45b43da72f96719bcb183c0177b5198beae8c3ddce357e180a32f9ca7b";
    };
    opam = "${opam-repo}/packages/ppx_expect/ppx_expect.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_inline_test ppxlib re
                           stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fields_conv = {
    name = "ppx_fields_conv";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_fields_conv-v0.15.0.tar.gz";
      sha256 = "d22ab3b63b043baf67e2bf9f2a7d92da625b46afc0230f925aef732bd1b62e61";
    };
    opam = "${opam-repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.15.0/opam";
    depends = with self; [ base dune fieldslib ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fixed_literal = {
    name = "ppx_fixed_literal";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_fixed_literal-v0.15.0.tar.gz";
      sha256 = "f04136ce33f999c08cadb92a17f371b4dcb086a7ae0039e5c2c86b2ce985a9fc";
    };
    opam = "${opam-repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_hash = {
    name = "ppx_hash";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_hash-v0.15.0.tar.gz";
      sha256 = "45bb666a0f93aab5bc120126c4c7d4081d611c64969606799248b2d8418d1711";
    };
    opam = "${opam-repo}/packages/ppx_hash/ppx_hash.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_here = {
    name = "ppx_here";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_here-v0.15.0.tar.gz";
      sha256 = "c5bc027c938a4893267c12e5ded6d7391b89851cf69094154ad9d824c3e0cadf";
    };
    opam = "${opam-repo}/packages/ppx_here/ppx_here.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_ignore_instrumentation = {
    name = "ppx_ignore_instrumentation";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_ignore_instrumentation-v0.15.0.tar.gz";
      sha256 = "22441d1be03937f32cb329cd5863fcb2d7d7e3f74bacce73b19bc0fd14a89f02";
    };
    opam = "${opam-repo}/packages/ppx_ignore_instrumentation/ppx_ignore_instrumentation.v0.15.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_inline_test = {
    name = "ppx_inline_test";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_inline_test-v0.15.0.tar.gz";
      sha256 = "3f78d141abc4a8e2ff69354299f8b2215ad33aa79a36a7f7fb82635e4ea1871b";
    };
    opam = "${opam-repo}/packages/ppx_inline_test/ppx_inline_test.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_irmin = {
    name = "ppx_irmin";
    version = "3.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/3.2.2/irmin-3.2.2.tbz";
      sha256 = "fde223f91b7adb0118698f210356c9965b4a7ae87f61d19c7f2892d1a2d0bcb9";
    };
    opam = "${opam-repo}/packages/ppx_irmin/ppx_irmin.3.2.2/opam";
    depends = with self; [ dune logs ocaml ppx_repr ppxlib ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ fmt ];
  };
  ppx_jane = {
    name = "ppx_jane";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_jane-v0.15.0.tar.gz";
      sha256 = "d0fa44d2279adfd24223c7e7a6d2a9be9fccc737810bf53876214181858e8146";
    };
    opam = "${opam-repo}/packages/ppx_jane/ppx_jane.v0.15.0/opam";
    depends = with self; [ base_quickcheck dune ocaml ppx_assert ppx_base
                           ppx_bench ppx_bin_prot ppx_custom_printf
                           ppx_disable_unused_warnings ppx_expect
                           ppx_fields_conv ppx_fixed_literal ppx_here
                           ppx_ignore_instrumentation ppx_inline_test ppx_let
                           ppx_log ppx_module_timer ppx_optcomp ppx_optional
                           ppx_pipebang ppx_sexp_message ppx_sexp_value
                           ppx_stable ppx_string ppx_typerep_conv
                           ppx_variants_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_let = {
    name = "ppx_let";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_let-v0.15.0.tar.gz";
      sha256 = "64742c11eab6d6915a5213b20648af16ea2f65771170887ad91f8f1da38f3655";
    };
    opam = "${opam-repo}/packages/ppx_let/ppx_let.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_log = {
    name = "ppx_log";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_log-v0.15.0.tar.gz";
      sha256 = "037aa3c8c4dca5c7ce9154e981c146c92faeeac456931cf3c9496b4f9698763e";
    };
    opam = "${opam-repo}/packages/ppx_log/ppx_log.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv
                           ppx_sexp_message ppxlib sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_module_timer = {
    name = "ppx_module_timer";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_module_timer-v0.15.0.tar.gz";
      sha256 = "22a8d0347cb0c7a349a316ff250f059ab90dafd20f14373f08ef04500b967c62";
    };
    opam = "${opam-repo}/packages/ppx_module_timer/ppx_module_timer.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optcomp = {
    name = "ppx_optcomp";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_optcomp-v0.15.0.tar.gz";
      sha256 = "c44e70d7b3c80f9e2bf8456da1076d16dc4504fc3e02d8709ca1b2e080caa6ed";
    };
    opam = "${opam-repo}/packages/ppx_optcomp/ppx_optcomp.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optional = {
    name = "ppx_optional";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_optional-v0.15.0.tar.gz";
      sha256 = "72bb1319fc697c769df15ad659bdd0da2782df286212dd6b004c06e6a057c729";
    };
    opam = "${opam-repo}/packages/ppx_optional/ppx_optional.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pipebang = {
    name = "ppx_pipebang";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_pipebang-v0.15.0.tar.gz";
      sha256 = "1e56554d86ab61830492cc922b02dab0110cdd7584e90ffef4832dc6335620a8";
    };
    opam = "${opam-repo}/packages/ppx_pipebang/ppx_pipebang.v0.15.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_repr = {
    name = "ppx_repr";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
      sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
    };
    opam = "${opam-repo}/packages/ppx_repr/ppx_repr.0.6.0/opam";
    depends = with self; [ dune fmt ppx_deriving ppxlib repr ];
    buildDepends = with self; [ dune ];
    testDepends = with self; [ alcotest hex optint sexplib0 ];
    docDepends = with self; [ odoc ];
  };
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/refs/tags/v0.15.1.tar.gz";
      sha256 = "e34647850c58992a463f29b11b863f9b1322adc0a98d3b16028012507e0c2e9d";
    };
    opam = "${opam-repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.15.1/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_message = {
    name = "ppx_sexp_message";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_sexp_message-v0.15.0.tar.gz";
      sha256 = "0d94785f80e45b97269e2e34b762a0909eba6a46e55c383cf8c1bdb8ffffdaba";
    };
    opam = "${opam-repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_value = {
    name = "ppx_sexp_value";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_sexp_value-v0.15.0.tar.gz";
      sha256 = "376ed3dcfb2f98b22d0c3a41a2adec3255ace7c93b8b72a8b3a46154395b558d";
    };
    opam = "${opam-repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_stable = {
    name = "ppx_stable";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_stable-v0.15.0.tar.gz";
      sha256 = "90b4e87a590c695938db2b148aeb4a6543d32525ee826432812034470c012bb3";
    };
    opam = "${opam-repo}/packages/ppx_stable/ppx_stable.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_string = {
    name = "ppx_string";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_string-v0.15.0.tar.gz";
      sha256 = "f33d4956792fd022c63f8eef4269fcbf77aa06402d7b17df80cb493482b71393";
    };
    opam = "${opam-repo}/packages/ppx_string/ppx_string.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_typerep_conv = {
    name = "ppx_typerep_conv";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_typerep_conv-v0.15.0.tar.gz";
      sha256 = "e71729ed13a3cafd8f541056340bf167e8b510f3090ff5825402ed61af3b5e9f";
    };
    opam = "${opam-repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib typerep ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_variants_conv = {
    name = "ppx_variants_conv";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_variants_conv-v0.15.0.tar.gz";
      sha256 = "6e7096f6e7b6c2fa916e85d2b526a4574234f72185b40f7d409d08f339dfac9c";
    };
    opam = "${opam-repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_yojson_conv_lib = {
    name = "ppx_yojson_conv_lib";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_yojson_conv_lib-v0.15.0.tar.gz";
      sha256 = "f9d2c5eff4566ec1f1f379b186ed22c8ddd6be0909a160bc5a9ac7abc6a6b684";
    };
    opam = "${opam-repo}/packages/ppx_yojson_conv_lib/ppx_yojson_conv_lib.v0.15.0/opam";
    depends = with self; [ dune ocaml yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.26.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.26.0/ppxlib-0.26.0.tbz";
      sha256 = "63117b67ea5863935455fe921f88fe333c0530f0483f730313303a93af817efd";
    };
    opam = "${opam-repo}/packages/ppxlib/ppxlib.0.26.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs ppx_derivers
                           sexplib0 stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ base cinaps ocamlfind re stdio ];
    docDepends = with self; [ odoc ];
  };
  prettym = {
    name = "prettym";
    version = "0.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/prettym/releases/download/0.0.3/prettym-0.0.3.tbz";
      sha256 = "9170f1a11ade7f4d98a584a5be52bb6b91415f971c6e75894331b46b18b98f09";
    };
    opam = "${opam-repo}/packages/prettym/prettym.0.0.3/opam";
    depends = with self; [ bigarray-overlap bigstringaf dune fmt ke ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest base64 jsonm ptime ];
  };
  psq = {
    name = "psq";
    version = "0.2.0";
    src = builtins.fetchurl {
      url = "https://github.com/pqwy/psq/releases/download/v0.2.0/psq-v0.2.0.tbz";
    };
    opam = "${opam-repo}/packages/psq/psq.0.2.0/opam";
    depends = with self; [ dune ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest qcheck-alcotest qcheck-core ];
  };
  ptime = {
    name = "ptime";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/ptime/releases/ptime-1.0.0.tbz";
      sha512 = "df2410d9cc25a33083fe968a584b8fb4d68ad5c077f3356da0a20427e6cd8756a5b946b921e5cf8ed4097f2c506e93345d9dca63b113be644d5a7cc0753d1534";
    };
    opam = "${opam-repo}/packages/ptime/ptime.1.0.0/opam";
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
    opam = "${opam-repo}/packages/re/re.1.10.4/opam";
    depends = with self; [ dune ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit ];
  };
  react = {
    name = "react";
    version = "1.2.2";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/react/releases/react-1.2.2.tbz";
      sha512 = "18cdd544d484222ba02db6bd9351571516532e7a1c107b59bbe39193837298f5c745eab6754f8bc6ff125b387be7018c6d6e6ac99f91925a5e4f53af688522b1";
    };
    opam = "${opam-repo}/packages/react/react.1.2.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  repr = {
    name = "repr";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
      sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
    };
    opam = "${opam-repo}/packages/repr/repr.0.6.0/opam";
    depends = with self; [ base64 dune either fmt jsonm ocaml optint uutf ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  result = {
    name = "result";
    version = "1.5";
    src = builtins.fetchurl {
      url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
    };
    opam = "${opam-repo}/packages/result/result.1.5/opam";
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
    opam = "${opam-repo}/packages/rresult/rresult.0.7.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${opam-repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  sexp_pretty = {
    name = "sexp_pretty";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexp_pretty-v0.15.0.tar.gz";
      sha256 = "99e8643bc2bf9d0201702b165acccc9195bbb481093dc16ccb95c9fdfe015df1";
    };
    opam = "${opam-repo}/packages/sexp_pretty/sexp_pretty.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_base re sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib = {
    name = "sexplib";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexplib-v0.15.0.tar.gz";
      sha256 = "a562348f2cc150224c31e424e0fb4cb11b5980ddc1effbb3b34c431f822b45f7";
    };
    opam = "${opam-repo}/packages/sexplib/sexplib.v0.15.0/opam";
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
    opam = "${opam-repo}/packages/sexplib0/sexplib0.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  spawn = {
    name = "spawn";
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/spawn/archive/v0.15.1.tar.gz";
      sha256 = "9afdee314fab6c3fcd689ab6eb5608d6b78078e6dede3953a47debde06c19d50";
    };
    opam = "${opam-repo}/packages/spawn/spawn.v0.15.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ppx_expect ];
    docDepends = with self; [ odoc ];
  };
  splittable_random = {
    name = "splittable_random";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/splittable_random-v0.15.0.tar.gz";
      sha256 = "9ff8e6c85fb5c39f45ca8bcf499a8bc3f419a18e759091d3a8d82b2aabeedb00";
    };
    opam = "${opam-repo}/packages/splittable_random/splittable_random.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_bench
                           ppx_inline_test ppx_sexp_message ];
    buildDepends = with self; [ dune ocaml ];
  };
  ssl = {
    name = "ssl";
    version = "0.5.10";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ssl/archive/v0.5.10.tar.gz";
      sha512 = "f2d0acc8dcdb0a36c8ad236f60c6e9d7f8f76ea25183017218953dbe3432a19de5b0be8214714add71b88b211ac78318f09429d4df7ecba1e19dc94d4414f0e1";
    };
    opam = "${opam-repo}/packages/ssl/ssl.0.5.10/opam";
    depends = with self; [ base-unix conf-libssl dune dune-configurator ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/stdio-v0.15.0.tar.gz";
      sha256 = "c37292921dc6a88425f773eba6bdbeac1dedacd1f55917fa4bcd9c4b25795e4b";
    };
    opam = "${opam-repo}/packages/stdio/stdio.v0.15.0/opam";
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
    opam = "${opam-repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdune = {
    name = "stdune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/stdune/stdune.3.2.0/opam";
    depends = with self; [ csexp dune dyn ocaml ordering pp ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  streaming = {
    name = "streaming";
    version = "0.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/odis-labs/streaming/releases/download/0.8.0/streaming-0.8.0.tbz";
      sha256 = "5bedc6619a6c2e3d529d086e4a68d7762ffce5f31a8d6a73e1bef1e56d1b9c9b";
    };
    opam = "${opam-repo}/packages/streaming/streaming.0.8.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  stringext = {
    name = "stringext";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/rgrinberg/stringext/releases/download/1.6.0/stringext-1.6.0.tbz";
      sha256 = "db41f5d52e9eab17615f110b899dfeb27dd7e7f89cd35ae43827c5119db206ea";
    };
    opam = "${opam-repo}/packages/stringext/stringext.1.6.0/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit qtest ];
  };
  textutils = {
    name = "textutils";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/textutils-v0.15.0.tar.gz";
      sha256 = "c0368fb6ad18727cd69fbfb20dd734fb7f7189707107d1f88d8de15837dc22df";
    };
    opam = "${opam-repo}/packages/textutils/textutils.v0.15.0/opam";
    depends = with self; [ core core_kernel core_unix dune ocaml ppx_jane
                           textutils_kernel uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  textutils_kernel = {
    name = "textutils_kernel";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/textutils_kernel-v0.15.0.tar.gz";
      sha256 = "acac915dc3240a0888141e89dc9fcc8fe696c25003f331ca0f014bcbeb57fa37";
    };
    opam = "${opam-repo}/packages/textutils_kernel/textutils_kernel.v0.15.0/opam";
    depends = with self; [ core dune ocaml ppx_jane uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  time_now = {
    name = "time_now";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/time_now-v0.15.0.tar.gz";
      sha256 = "13b353305da2d349fce3bb47be24307a7163318872238eda0a91f15a8a0bcba8";
    };
    opam = "${opam-repo}/packages/time_now/time_now.v0.15.0/opam";
    depends = with self; [ base dune jane-street-headers jst-config ocaml
                           ppx_base ppx_optcomp ];
    buildDepends = with self; [ dune ocaml ];
  };
  timezone = {
    name = "timezone";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/timezone-v0.15.0.tar.gz";
      sha256 = "a5fecedd06c779a7a6c0b910e2a1bfc7119049a57e8f6c59bf18752c1271410d";
    };
    opam = "${opam-repo}/packages/timezone/timezone.v0.15.0/opam";
    depends = with self; [ core dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${opam-repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  trie = {
    name = "trie";
    version = "1.0.0";
    src = builtins.fetchurl {
      url = "https://github.com/kandu/trie/archive/1.0.0.tar.gz";
    };
    opam = "${opam-repo}/packages/trie/trie.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  typerep = {
    name = "typerep";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/typerep-v0.15.0.tar.gz";
      sha256 = "26c8d37db41440a417593fcb389aaebafdf2e33e62bd762e1f148875a7a3183e";
    };
    opam = "${opam-repo}/packages/typerep/typerep.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  uchar = {
    name = "uchar";
    version = "0.0.2";
    src = builtins.fetchurl {
      url = "https://github.com/ocaml/uchar/releases/download/v0.0.2/uchar-0.0.2.tbz";
    };
    opam = "${opam-repo}/packages/uchar/uchar.0.0.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  universe = rec {
    name = "universe";
    version = "root";
    src = ./.;
    opam = "${src}/universe.opam";
    depends = with self; [ alcotest benchmark caqti conf-binutils containers
                           core_bench dream dune fmt gen irmin iter lwt
                           mirage ocaml ocaml-lsp-server ocamlformat
                           ocp-browser ppxlib ptime seq streaming utop yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  unstrctrd = {
    name = "unstrctrd";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/unstrctrd/releases/download/v0.3/unstrctrd-v0.3.tbz";
      sha256 = "7355b1e9a6b977608641c88f9f136fff309ef64e174818c7ccadc8a2a78ded5b";
    };
    opam = "${opam-repo}/packages/unstrctrd/unstrctrd.0.3/opam";
    depends = with self; [ angstrom dune ocaml uutf ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ alcotest bigstringaf crowbar fmt hxd ke
                               rresult ];
  };
  uri = {
    name = "uri";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
      sha256 = "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
    };
    opam = "${opam-repo}/packages/uri/uri.4.2.0/opam";
    depends = with self; [ angstrom dune ocaml stringext ];
    buildDepends = with self; [ dune ocaml ];
    testDepends = with self; [ ounit ppx_sexp_conv ];
  };
  utop = {
    name = "utop";
    version = "2.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/utop/releases/download/2.9.1/utop-2.9.1.tbz";
      sha512 = "002fa809d4924419f51b81df968b653a111ae5992837792fcb867adf2e44c15d40fadccc9784ef61f21ea3233f9da74016433920bf909d808752b7f825f8cdb1";
    };
    opam = "${opam-repo}/packages/utop/utop.2.9.1/opam";
    depends = with self; [ base-threads base-unix camomile dune lambda-term
                           lwt lwt_react ocaml ocamlfind react ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
  };
  uucp = {
    name = "uucp";
    version = "14.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uucp/releases/uucp-14.0.0.tbz";
      sha512 = "2d0224aed5d5accbb121624898f08598e8c74a2415942f159a54221c0cdac62ed64fc70a039c833e50110cefce77754ada9ac2d58f79a6fc9331135326fe6899";
    };
    opam = "${opam-repo}/packages/uucp/uucp.14.0.0/opam";
    depends = with self; [ ocaml (self.cmdliner or null) (self.uunf or null)
                           (self.uutf or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
    testDepends = with self; [ uucd uunf uutf ];
  };
  uuseg = {
    name = "uuseg";
    version = "14.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uuseg/releases/uuseg-14.0.0.tbz";
      sha512 = "3f089baf95f010663a0c2f060b2911395d9b396f478efb10fd979815f527c9e61e0a70b3192f2e921f59287bfde0da6e25109d4a1825554e2e4a50c0535e97aa";
    };
    opam = "${opam-repo}/packages/uuseg/uuseg.14.0.0/opam";
    depends = with self; [ ocaml uucp (self.cmdliner or null)
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
    opam = "${opam-repo}/packages/uutf/uutf.1.0.3/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  variantslib = {
    name = "variantslib";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/variantslib-v0.15.0.tar.gz";
      sha256 = "e5d87438e439877d8580ed209b17c0ba5e36e1405fcf9ddd972f1bbf48d7ba89";
    };
    opam = "${opam-repo}/packages/variantslib/variantslib.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  xdg = {
    name = "xdg";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${opam-repo}/packages/xdg/xdg.3.2.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
    docDepends = with self; [ odoc ];
  };
  yojson = {
    name = "yojson";
    version = "1.7.0";
    src = builtins.fetchurl {
      url = "https://github.com/ocaml-community/yojson/releases/download/1.7.0/yojson-1.7.0.tbz";
    };
    opam = "${opam-repo}/packages/yojson/yojson.1.7.0/opam";
    depends = with self; [ biniou dune easy-format ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
    testDepends = with self; [ alcotest ];
  };
  zed = {
    name = "zed";
    version = "3.1.0";
    src = builtins.fetchurl {
      url = "https://github.com/ocaml-community/zed/archive/3.1.0.tar.gz";
    };
    opam = "${opam-repo}/packages/zed/zed.3.1.0/opam";
    depends = with self; [ base-bytes camomile charInfo_width dune ocaml
                           react ];
    buildDepends = with self; [ dune ocaml ];
  };
}
