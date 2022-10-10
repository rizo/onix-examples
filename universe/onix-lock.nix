{ pkgs ? import <nixpkgs> {} }:
rec {
  version = "0.0.5";
  repo = builtins.fetchGit {
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "f3dcd527e82e83facb92cd2727651938cb9fecf9";
  };
  scope = rec {
    alcotest = {
      name = "alcotest";
      version = "1.6.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/alcotest/releases/download/1.6.0/alcotest-1.6.0.tbz";
        sha256 = "fd00f9668395874ff3b1d7ef566d14efc02fa7dd34123eb25d59355be94b2329";
      };
      opam = "${repo}/packages/alcotest/alcotest.1.6.0/opam";
      depends = [ astring cmdliner dune fmt ocaml ocaml-syntax-shims re
                  stdlib-shims uutf ];
      buildDepends = [ dune ocaml ];
    };
    angstrom = {
      name = "angstrom";
      version = "0.15.0";
      src = pkgs.fetchurl {
        url = "https://github.com/inhabitedtype/angstrom/archive/0.15.0.tar.gz";
        sha256 = "01cjjal8vjsm225v9y0q6ixam8k5f821rcr6yix6i9nzs84aq6gi";
      };
      opam = "${repo}/packages/angstrom/angstrom.0.15.0/opam";
      depends = [ bigstringaf dune ocaml result ];
      buildDepends = [ dune ocaml ocaml-syntax-shims ];
    };
    astring = {
      name = "astring";
      version = "0.8.5";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
        sha256 = "1ykhg9gd3iy7zsgyiy2p9b1wkpqg9irw5pvcqs3sphq71iir4ml6";
      };
      opam = "${repo}/packages/astring/astring.0.8.5/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    base = {
      name = "base";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base-v0.15.0.tar.gz";
        sha256 = "8657ae4324a9948457112245c49d97d2da95f157f780f5d97f0b924312a6a53d";
      };
      opam = "${repo}/packages/base/base.v0.15.0/opam";
      depends = [ dune dune-configurator ocaml sexplib0 ];
      buildDepends = [ dune dune-configurator ocaml ];
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
      depends = [ ocaml ocamlfind ];
      buildDepends = [ ocaml ocamlfind ];
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
      depends = [ base-bytes dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    base_bigstring = {
      name = "base_bigstring";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base_bigstring-v0.15.0.tar.gz";
        sha256 = "ff75f1748baf83b0244aeba4e1bfff7f2da3f3ab5a992bb8a21ab832cea1d56b";
      };
      opam = "${repo}/packages/base_bigstring/base_bigstring.v0.15.0/opam";
      depends = [ base dune int_repr ocaml ppx_jane ];
      buildDepends = [ dune ocaml ];
    };
    base_quickcheck = {
      name = "base_quickcheck";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base_quickcheck-v0.15.0.tar.gz";
        sha256 = "360e6b8f3660398936ec88fecb9e7761370ee63acf8372d3208d4d31c00181f2";
      };
      opam = "${repo}/packages/base_quickcheck/base_quickcheck.v0.15.0/opam";
      depends = [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                  ppx_sexp_message ppx_sexp_value ppxlib splittable_random ];
      buildDepends = [ dune ocaml ];
    };
    benchmark = {
      name = "benchmark";
      version = "1.6";
      src = pkgs.fetchurl {
        url = "https://github.com/Chris00/ocaml-benchmark/releases/download/1.6/benchmark-1.6.tbz";
        sha256 = "1w4wh3r52ar5yhrx3rmh4nlfg9077y0lbmb3wwrc3z4siiqps39k";
      };
      opam = "${repo}/packages/benchmark/benchmark.1.6/opam";
      depends = [ base-unix dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    bheap = {
      name = "bheap";
      version = "2.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/backtracking/bheap/releases/download/2.0.0/bheap-2.0.0.tbz";
        sha256 = "5f43d7b237bc87b07097f60eae2b32de64e644158308da338bf1512014bdf636";
      };
      opam = "${repo}/packages/bheap/bheap.2.0.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    bigarray-compat = {
      name = "bigarray-compat";
      version = "1.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/bigarray-compat/releases/download/v1.1.0/bigarray-compat-1.1.0.tbz";
        sha256 = "434469a48d5c84e80d621b13d95eb067f8138c1650a1fd5ae6009a19b93718d5";
      };
      opam = "${repo}/packages/bigarray-compat/bigarray-compat.1.1.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    bigarray-overlap = {
      name = "bigarray-overlap";
      version = "0.2.1";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/overlap/releases/download/v0.2.1/bigarray-overlap-0.2.1.tbz";
        sha256 = "2f520ac470054e335883eba9254bf28b6676ddb57753cfb58b22cf84ae1a66e0";
      };
      opam = "${repo}/packages/bigarray-overlap/bigarray-overlap.0.2.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ conf-pkg-config dune ocaml ];
    };
    bigstringaf = {
      name = "bigstringaf";
      version = "0.9.0";
      src = pkgs.fetchurl {
        url = "https://github.com/inhabitedtype/bigstringaf/archive/0.9.0.tar.gz";
        sha256 = "0v0h09r0690b6b27ww443zxvj1dwhxcy86fbjaf2wm56kb3qccsl";
      };
      opam = "${repo}/packages/bigstringaf/bigstringaf.0.9.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ conf-pkg-config dune ocaml ];
    };
    bin_prot = {
      name = "bin_prot";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/bin_prot-v0.15.0.tar.gz";
        sha256 = "7a4ba0daeacfb87e9cb7e8f49afac43a9bbb64dee4801fd789f1f188059d3690";
      };
      opam = "${repo}/packages/bin_prot/bin_prot.v0.15.0/opam";
      depends = [ base dune ocaml ppx_compare ppx_custom_printf
                  ppx_fields_conv ppx_optcomp ppx_sexp_conv ppx_variants_conv ];
      buildDepends = [ dune ocaml ];
    };
    bos = {
      name = "bos";
      version = "0.2.1";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/bos/releases/bos-0.2.1.tbz";
        sha512 = "8daeb8a4c2dd1f2460f6274ada19f4f1b6ebe875ff83a938c93418ce0e6bdb74b8afc5c9a7d410c1c9df2dad030e4fa276b6ed2da580639484e8b5bc92610b1d";
      };
      opam = "${repo}/packages/bos/bos.0.2.1/opam";
      depends = [ astring base-unix fmt fpath logs ocaml rresult ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    camlp-streams = {
      name = "camlp-streams";
      version = "5.0.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/camlp-streams/archive/v5.0.1.tar.gz";
        sha512 = "2efa8dd4a636217c8d49bac1e4e7e5558fc2f45cfea66514140a59fd99dd08d61fb9f1e17804997ff648b71b13820a5d4a1eb70fed9d848aa2abd6e41f853c86";
      };
      opam = "${repo}/packages/camlp-streams/camlp-streams.5.0.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    camomile = {
      name = "camomile";
      version = "1.0.2";
      src = pkgs.fetchurl {
        url = "https://github.com/yoriyuki/Camomile/releases/download/1.0.2/camomile-1.0.2.tbz";
        sha256 = "f0a419b0affc36500f83b086ffaa36c545560cee5d57e84b729e8f851b3d1632";
      };
      opam = "${repo}/packages/camomile/camomile.1.0.2/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    caqti = {
      name = "caqti";
      version = "1.9.0";
      src = pkgs.fetchurl {
        url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.9.0/caqti-v1.9.0.tbz";
        sha256 = "e1f580848faf3a54f23174067f2c75f77f6a2fe50ca8bc923428d0e1841192c5";
      };
      opam = "${repo}/packages/caqti/caqti.1.9.0/opam";
      depends = [ angstrom bigstringaf dune logs ocaml ptime uri ];
      buildDepends = [ cppo dune ocaml ];
    };
    caqti-lwt = {
      name = "caqti-lwt";
      version = "1.9.0";
      src = pkgs.fetchurl {
        url = "https://github.com/paurkedal/ocaml-caqti/releases/download/v1.9.0/caqti-v1.9.0.tbz";
        sha256 = "e1f580848faf3a54f23174067f2c75f77f6a2fe50ca8bc923428d0e1841192c5";
      };
      opam = "${repo}/packages/caqti-lwt/caqti-lwt.1.9.0/opam";
      depends = [ caqti dune logs lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    charInfo_width = {
      name = "charInfo_width";
      version = "1.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/kandu/charInfo_width/archive/1.1.0.tar.gz";
        sha256 = "0wl1hcwbx2mmgbhwh1wwgjixvppjq0k43nqyq13xm4pvgdxfvci1";
      };
      opam = "${repo}/packages/charInfo_width/charInfo_width.1.1.0/opam";
      depends = [ camomile dune ocaml result ];
      buildDepends = [ dune ocaml ];
    };
    chrome-trace = {
      name = "chrome-trace";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/chrome-trace/chrome-trace.3.4.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    cmdliner = {
      name = "cmdliner";
      version = "1.1.1";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
        sha512 = "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
      };
      opam = "${repo}/packages/cmdliner/cmdliner.1.1.1/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    conf-libev = {
      name = "conf-libev";
      version = "4+12";
      opam = "${repo}/packages/conf-libev/conf-libev.4-12/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
      depexts = [ pkgs.libev ];
    };
    conf-libssl = {
      name = "conf-libssl";
      version = "4";
      opam = "${repo}/packages/conf-libssl/conf-libssl.4/opam";
      buildDepends = [ conf-pkg-config ];
      depexts = [ pkgs.openssl ];
    };
    conf-pkg-config = {
      name = "conf-pkg-config";
      version = "2";
      opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
      depexts = [ pkgs.pkgconfig ];
    };
    containers = {
      name = "containers";
      version = "3.9";
      src = pkgs.fetchurl {
        url = "https://github.com/c-cube/ocaml-containers/archive/v3.9.tar.gz";
        sha512 = "8c954cb5ff01dc73a4e04ce2ef8fb5ad5162f16b2e4b2463501dd60c428d388c03c5b641c62b5876cd0d5ac5dc244d6a44d4d92a18525a03bdbf9cca82321272";
      };
      opam = "${repo}/packages/containers/containers.3.9/opam";
      depends = [ base-threads base-unix dune dune-configurator either ocaml
                  seq ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    core = {
      name = "core";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core-v0.15.0.tar.gz";
        sha256 = "3a656f2b8605dd052da6459ad8dace3263d21efe15ef2b3bd36aaa8f8ce85e1f";
      };
      opam = "${repo}/packages/core/core.v0.15.0/opam";
      depends = [ base base_bigstring base_quickcheck bin_prot dune fieldslib
                  jane-street-headers jst-config ocaml ppx_assert ppx_base
                  ppx_hash ppx_inline_test ppx_jane ppx_sexp_conv
                  ppx_sexp_message sexplib splittable_random stdio time_now
                  typerep variantslib ];
      buildDepends = [ dune ocaml ];
    };
    core_bench = {
      name = "core_bench";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_bench-v0.15.0.tar.gz";
        sha256 = "5db364e75b35f0ba1d528d5edfc6c701abeb619ce1879a1199251e2a8c535258";
      };
      opam = "${repo}/packages/core_bench/core_bench.v0.15.0/opam";
      depends = [ core core_kernel core_unix dune ocaml ppx_compare
                  ppx_fields_conv ppx_jane ppx_let ppx_sexp_conv re textutils ];
      buildDepends = [ dune ocaml ];
    };
    core_kernel = {
      name = "core_kernel";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_kernel-v0.15.0.tar.gz";
        sha256 = "34a0288f16027c6b90e4ad16cb5cc677d7063d310faf918748ce70f1745116c0";
      };
      opam = "${repo}/packages/core_kernel/core_kernel.v0.15.0/opam";
      depends = [ base base-threads core dune int_repr ocaml ppx_jane ];
      buildDepends = [ dune ocaml ];
    };
    core_unix = {
      name = "core_unix";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_unix-v0.15.0.tar.gz";
        sha256 = "0af9d2c0d2029a80858c730171e0bd70a1981b3e7021f8c31cd8dc54925da02d";
      };
      opam = "${repo}/packages/core_unix/core_unix.v0.15.0/opam";
      depends = [ base-threads core core_kernel dune expect_test_helpers_core
                  jane-street-headers jst-config ocaml ocaml_intrinsics
                  ppx_jane sexplib spawn timezone ];
      buildDepends = [ dune ocaml ];
      depexts = [ (pkgs.linux-headers or null) ];
    };
    cppo = {
      name = "cppo";
      version = "1.6.9";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
        sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
      };
      opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
      depends = [ base-unix dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    csexp = {
      name = "csexp";
      version = "1.5.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-dune/csexp/releases/download/1.5.1/csexp-1.5.1.tbz";
        sha256 = "d605e4065fa90a58800440ef2f33a2d931398bf2c22061a8acb7df845c0aac02";
      };
      opam = "${repo}/packages/csexp/csexp.1.5.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    cstruct = {
      name = "cstruct";
      version = "6.1.1";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ocaml-cstruct/releases/download/v6.1.1/cstruct-6.1.1.tbz";
        sha256 = "1b74f9870f6a7ee6008924590716dd533a728a3ca10bb18da9fea8be467f518d";
      };
      opam = "${repo}/packages/cstruct/cstruct.6.1.1/opam";
      depends = [ dune fmt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    digestif = {
      name = "digestif";
      version = "1.1.2";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/digestif/releases/download/v1.1.2/digestif-1.1.2.tbz";
        sha256 = "79d34ce513b114857e380aabdf6f1473218f1b05dd7e51d03890779ed01b4666";
      };
      opam = "${repo}/packages/digestif/digestif.1.1.2/opam";
      depends = [ dune eqaf ocaml ];
      buildDepends = [ conf-pkg-config dune ocaml ];
    };
    domain-name = {
      name = "domain-name";
      version = "0.4.0";
      src = pkgs.fetchurl {
        url = "https://github.com/hannesm/domain-name/releases/download/v0.4.0/domain-name-0.4.0.tbz";
        sha256 = "a5c06e22845895201973e812fe3019274d1db81c0a7873da6c8007c4ad2108c5";
      };
      opam = "${repo}/packages/domain-name/domain-name.0.4.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    dream = {
      name = "dream";
      version = "1.0.0+alpha4";
      src = pkgs.fetchurl {
        url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
        sha256 = "045glrnb15k6vv7avg0s002kycynf5cmir3cl6g0ih379mlv6hx1";
      };
      opam = "${repo}/packages/dream/dream.1.0.0~alpha4/opam";
      depends = [ base-unix bigarray-compat camlp-streams caqti caqti-lwt
                  conf-libev cstruct dream-httpaf dream-pure dune fmt
                  graphql-lwt graphql_parser logs lwt lwt_ppx lwt_ssl
                  magic-mime mirage-clock mirage-crypto mirage-crypto-rng
                  multipart_form multipart_form-lwt ocaml ptime ssl uri
                  yojson ];
      buildDepends = [ dune ocaml ];
    };
    dream-httpaf = {
      name = "dream-httpaf";
      version = "1.0.0+alpha1";
      src = pkgs.fetchurl {
        url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha3/dream-1.0.0-alpha3.tar.gz";
        sha256 = "1g01gz2k9c07qkakszgx055hnkmlwyjqmwzr2awrmqxf14qjb2gj";
      };
      opam = "${repo}/packages/dream-httpaf/dream-httpaf.1.0.0~alpha1/opam";
      depends = [ angstrom base64 bigstringaf digestif dream-pure dune
                  faraday faraday-lwt-unix lwt lwt_ppx lwt_ssl ocaml psq
                  result ssl ];
      buildDepends = [ dune ocaml ];
    };
    dream-pure = {
      name = "dream-pure";
      version = "1.0.0+alpha2";
      src = pkgs.fetchurl {
        url = "https://github.com/aantron/dream/releases/download/1.0.0-alpha4/dream-1.0.0-alpha4.tar.gz";
        sha256 = "045glrnb15k6vv7avg0s002kycynf5cmir3cl6g0ih379mlv6hx1";
      };
      opam = "${repo}/packages/dream-pure/dream-pure.1.0.0~alpha2/opam";
      depends = [ base64 bigstringaf dune hmap lwt lwt_ppx ocaml ptime uri ];
      buildDepends = [ dune ocaml ];
    };
    dune = {
      name = "dune";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/dune/dune.3.4.1/opam";
      depends = [ base-threads base-unix ocaml ];
      buildDepends = [ ocaml ];
    };
    dune-build-info = {
      name = "dune-build-info";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/dune-build-info/dune-build-info.3.4.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    dune-configurator = {
      name = "dune-configurator";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/dune-configurator/dune-configurator.3.4.1/opam";
      depends = [ base-unix csexp dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    dune-rpc = {
      name = "dune-rpc";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/dune-rpc/dune-rpc.3.4.1/opam";
      depends = [ csexp dune dyn ordering pp stdune xdg ];
      buildDepends = [ dune ];
    };
    duration = {
      name = "duration";
      version = "0.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/hannesm/duration/releases/download/0.2.0/duration-0.2.0.tbz";
        sha256 = "ad14fb75a5a6f73fff7ef1721178925ee555cf0f23b23e3ab329184bc0c1ce69";
      };
      opam = "${repo}/packages/duration/duration.0.2.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    dyn = {
      name = "dyn";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/dyn/dyn.3.4.1/opam";
      depends = [ dune ocaml ordering pp ];
      buildDepends = [ dune ocaml ];
    };
    either = {
      name = "either";
      version = "1.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
        sha256 = "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
      };
      opam = "${repo}/packages/either/either.1.0.0/opam";
      depends = [ dune ];
      buildDepends = [ dune ];
    };
    emile = {
      name = "emile";
      version = "1.1";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/emile/releases/download/v1.1/emile-v1.1.tbz";
        sha256 = "1759253996b53b84ff1a2b76ff30c3614bc61cb02ff8a500480be4a96a202164";
      };
      opam = "${repo}/packages/emile/emile.1.1/opam";
      depends = [ angstrom base64 bigstringaf cmdliner dune ipaddr ocaml pecu
                  uutf ];
      buildDepends = [ dune ocaml ];
    };
    eqaf = {
      name = "eqaf";
      version = "0.9";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/eqaf/releases/download/v0.9/eqaf-0.9.tbz";
        sha256 = "ec0e28a946ac6817f95d5854f05a9961ae3a8408bb610e79cfad01b9b255dfe0";
      };
      opam = "${repo}/packages/eqaf/eqaf.0.9/opam";
      depends = [ cstruct dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    expect_test_helpers_core = {
      name = "expect_test_helpers_core";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/expect_test_helpers_core-v0.15.0.tar.gz";
        sha256 = "7f2a738564253e32c8bd816f9da548d1619e447b6ebc4c7af33e5c0c52ff9652";
      };
      opam = "${repo}/packages/expect_test_helpers_core/expect_test_helpers_core.v0.15.0/opam";
      depends = [ base base_quickcheck core dune ocaml ppx_jane re
                  sexp_pretty stdio ];
      buildDepends = [ dune ocaml ];
    };
    faraday = {
      name = "faraday";
      version = "0.8.1";
      src = pkgs.fetchurl {
        url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
        sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
      };
      opam = "${repo}/packages/faraday/faraday.0.8.1/opam";
      depends = [ bigstringaf dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    faraday-lwt = {
      name = "faraday-lwt";
      version = "0.8.1";
      src = pkgs.fetchurl {
        url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
        sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
      };
      opam = "${repo}/packages/faraday-lwt/faraday-lwt.0.8.1/opam";
      depends = [ dune faraday lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    faraday-lwt-unix = {
      name = "faraday-lwt-unix";
      version = "0.8.1";
      src = pkgs.fetchurl {
        url = "https://github.com/inhabitedtype/faraday/archive/0.8.1.tar.gz";
        sha256 = "0yngavdplaaw5lb4ci4v4y5nvlhgan0mg1dlx1b5qdjgr83dk7cf";
      };
      opam = "${repo}/packages/faraday-lwt-unix/faraday-lwt-unix.0.8.1/opam";
      depends = [ base-unix dune faraday-lwt lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    fiber = {
      name = "fiber";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/fiber/fiber.3.4.1/opam";
      depends = [ dune dyn ocaml stdune ];
      buildDepends = [ dune ocaml ];
    };
    fieldslib = {
      name = "fieldslib";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/fieldslib-v0.15.0.tar.gz";
        sha256 = "050afd7327840c63483616f9781c6ec127e0e48d270f237f89f56f5290fb7120";
      };
      opam = "${repo}/packages/fieldslib/fieldslib.v0.15.0/opam";
      depends = [ base dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    fix = {
      name = "fix";
      version = "20220121";
      src = pkgs.fetchurl {
        url = "https://gitlab.inria.fr/fpottier/fix/-/archive/20220121/archive.tar.gz";
        sha512 = "a851d8783c0c519c6e55359a5c471af433058872409c29a1a7bdfd0076813341ad2c0ebd1ce9e28bff4d4c729dfbc808c41c084fe12a42b45a2b5e391e77ccd2";
      };
      opam = "${repo}/packages/fix/fix.20220121/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    fmt = {
      name = "fmt";
      version = "0.9.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
        sha512 = "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
      };
      opam = "${repo}/packages/fmt/fmt.0.9.0/opam";
      depends = [ base-unix cmdliner ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    fpath = {
      name = "fpath";
      version = "0.7.3";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/fpath/releases/fpath-0.7.3.tbz";
        sha256 = "03z7mj0sqdz465rc4drj1gr88l9q3nfs374yssvdjdyhjbqqzc0j";
      };
      opam = "${repo}/packages/fpath/fpath.0.7.3/opam";
      depends = [ astring ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    functoria = {
      name = "functoria";
      version = "4.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage/releases/download/v4.3.0/mirage-4.3.0.tbz";
        sha256 = "6794212f3351ba3aacdcc4ef1752f97d8049795ffb2df714feb9f0f890f9ad8d";
      };
      opam = "${repo}/packages/functoria/functoria.4.3.0/opam";
      depends = [ astring base-unix bos cmdliner dune emile fmt fpath logs
                  ocaml result rresult uri ];
      buildDepends = [ dune ocaml ];
    };
    functoria-runtime = {
      name = "functoria-runtime";
      version = "4.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage/releases/download/v4.3.0/mirage-4.3.0.tbz";
        sha256 = "6794212f3351ba3aacdcc4ef1752f97d8049795ffb2df714feb9f0f890f9ad8d";
      };
      opam = "${repo}/packages/functoria-runtime/functoria-runtime.4.3.0/opam";
      depends = [ cmdliner dune fmt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    gen = {
      name = "gen";
      version = "1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/c-cube/gen/archive/v1.0.tar.gz";
        sha512 = "fb4ec2ab35a1aba0dcc8439b11f14a0a785d939f661f505aec88a6f2ca6ca87e14ddfda860d9c180b215190b76690de87040c144582f069224f7e58d37ef48a0";
      };
      opam = "${repo}/packages/gen/gen.1.0/opam";
      depends = [ base-bytes dune dune-configurator ocaml seq ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    graphql = {
      name = "graphql";
      version = "0.14.0";
      src = pkgs.fetchurl {
        url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.14.0/graphql-0.14.0.tbz";
        sha256 = "bf8bf5b9e17e355ecbbd82158a769fe2b138e746753fd3a23008ada3afcd1c06";
      };
      opam = "${repo}/packages/graphql/graphql.0.14.0/opam";
      depends = [ dune graphql_parser ocaml rresult seq yojson ];
      buildDepends = [ dune ocaml ];
    };
    graphql-lwt = {
      name = "graphql-lwt";
      version = "0.14.0";
      src = pkgs.fetchurl {
        url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.14.0/graphql-0.14.0.tbz";
        sha256 = "bf8bf5b9e17e355ecbbd82158a769fe2b138e746753fd3a23008ada3afcd1c06";
      };
      opam = "${repo}/packages/graphql-lwt/graphql-lwt.0.14.0/opam";
      depends = [ dune graphql lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    graphql_parser = {
      name = "graphql_parser";
      version = "0.14.0";
      src = pkgs.fetchurl {
        url = "https://github.com/andreas/ocaml-graphql-server/releases/download/0.14.0/graphql-0.14.0.tbz";
        sha256 = "bf8bf5b9e17e355ecbbd82158a769fe2b138e746753fd3a23008ada3afcd1c06";
      };
      opam = "${repo}/packages/graphql_parser/graphql_parser.0.14.0/opam";
      depends = [ dune fmt ocaml re ];
      buildDepends = [ dune menhir ocaml ];
    };
    hmap = {
      name = "hmap";
      version = "0.8.1";
      src = pkgs.fetchurl {
        url = "http://erratique.ch/software/hmap/releases/hmap-0.8.1.tbz";
        sha256 = "10xyjy4ab87z7jnghy0wnla9wrmazgyhdwhr4hdmxxdn28dxn03a";
      };
      opam = "${repo}/packages/hmap/hmap.0.8.1/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    int_repr = {
      name = "int_repr";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/int_repr-v0.15.0.tar.gz";
        sha256 = "5d357b58914bcaa183432f2cfafc726ecccaa36f42cab982ab32e8b1c1ed6719";
      };
      opam = "${repo}/packages/int_repr/int_repr.v0.15.0/opam";
      depends = [ base dune ocaml ppx_jane ];
      buildDepends = [ dune ocaml ];
    };
    ipaddr = {
      name = "ipaddr";
      version = "5.3.1";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.1/ipaddr-5.3.1.tbz";
        sha256 = "9820bcbccadb6e6d9e22fe26b2f9a044897c8f47c29d157f464b41a2f191e7d4";
      };
      opam = "${repo}/packages/ipaddr/ipaddr.5.3.1/opam";
      depends = [ domain-name dune macaddr ocaml ];
      buildDepends = [ dune ocaml ];
    };
    irmin = {
      name = "irmin";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/irmin/releases/download/3.4.1/irmin-3.4.1.tbz";
        sha256 = "922836116c30ec68068a38694a09bba521cf47edd0e4ae44e076b9b4963da180";
      };
      opam = "${repo}/packages/irmin/irmin.3.4.1/opam";
      depends = [ astring bheap bigstringaf digestif dune fmt jsonm logs lwt
                  mtime ocaml ocamlgraph ppx_irmin repr uri uutf ];
      buildDepends = [ dune ocaml ];
    };
    iter = {
      name = "iter";
      version = "1.5";
      src = pkgs.fetchurl {
        url = "https://github.com/c-cube/iter/archive/v1.5.tar.gz";
        sha512 = "a591bf60ba8b51b9e6b9078bda987cd1c6d54ed5a20a27bbe61d938733e8e864666c249dcce25731480e22ca5d46007cb16e789947828807483163afc0077465";
      };
      opam = "${repo}/packages/iter/iter.1.5/opam";
      depends = [ base-bigarray base-bytes dune dune-configurator ocaml
                  result seq ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    jane-street-headers = {
      name = "jane-street-headers";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/jane-street-headers-v0.15.0.tar.gz";
        sha256 = "34e4a37b26e3827da129c0ac7add26e8c09a21a704d55ca05211a8de17c847e4";
      };
      opam = "${repo}/packages/jane-street-headers/jane-street-headers.v0.15.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    jsonm = {
      name = "jsonm";
      version = "1.0.1";
      src = pkgs.fetchurl {
        url = "http://erratique.ch/software/jsonm/releases/jsonm-1.0.1.tbz";
        sha256 = "1176dcmxb11fnw49b7yysvkjh0kpzx4s48lmdn5psq9vshp5c29w";
      };
      opam = "${repo}/packages/jsonm/jsonm.1.0.1/opam";
      depends = [ ocaml uchar uutf ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    jst-config = {
      name = "jst-config";
      version = "v0.15.1";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/jst-config/archive/refs/tags/v0.15.1.tar.gz";
        sha256 = "7053e5bbb3016b760c1e8f419814ad059625105db25dafa020676fcfc0f3b41b";
      };
      opam = "${repo}/packages/jst-config/jst-config.v0.15.1/opam";
      depends = [ base dune dune-configurator ocaml ppx_assert ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    ke = {
      name = "ke";
      version = "0.6";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ke/releases/download/v0.6/ke-0.6.tbz";
        sha256 = "61217207e2200b04b17759736610ff9208269a647f854cb5ae72cdac0d672305";
      };
      opam = "${repo}/packages/ke/ke.0.6/opam";
      depends = [ dune fmt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    lambda-term = {
      name = "lambda-term";
      version = "3.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-community/lambda-term/releases/download/3.2.0/lambda-term-3.2.0.tar.gz";
        sha512 = "46cd46f47c9f34c0a5e096b96e6eec59667b645bf5201140e498e6d4eb9baba8204a2b30b73c4b2f8140e5cf1972a56e3aa485b27bc5ace25b2c368f713ad7c4";
      };
      opam = "${repo}/packages/lambda-term/lambda-term.3.2.0/opam";
      depends = [ camomile dune lwt lwt_log lwt_react mew_vi ocaml react zed ];
      buildDepends = [ dune ocaml ];
    };
    logs = {
      name = "logs";
      version = "0.7.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/logs/releases/logs-0.7.0.tbz";
        sha256 = "1jnmd675wmsmdwyb5mx5b0ac66g4c6gpv5s4mrx2j6pb0wla1x46";
      };
      opam = "${repo}/packages/logs/logs.0.7.0/opam";
      depends = [ base-threads cmdliner fmt lwt ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    lwt = {
      name = "lwt";
      version = "5.6.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocsigen/lwt/archive/5.6.1.tar.gz";
        sha512 = "698875bd3bfcd5baa47eb48e412f442d289f9972421321541860ebe110b9af1949c3fbc253768495726ec547fe4ba25483cd97ff39bc668496fba95b2ed9edd8";
      };
      opam = "${repo}/packages/lwt/lwt.5.6.1/opam";
      depends = [ base-threads base-unix conf-libev dune dune-configurator
                  ocaml ocplib-endian ];
      buildDepends = [ cppo dune dune-configurator ocaml ];
    };
    lwt_log = {
      name = "lwt_log";
      version = "1.1.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocsigen/lwt_log/archive/1.1.2.tar.gz";
        sha512 = "fb976d89c0f868b57434a9e0907ffae0842fe48fc747ddb860954d20f36722faea315ebb0b4dac202f9bf7203b0a09681614e9619f3bbd0dd59f8dd7bbd50575";
      };
      opam = "${repo}/packages/lwt_log/lwt_log.1.1.2/opam";
      depends = [ dune lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    lwt_ppx = {
      name = "lwt_ppx";
      version = "2.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocsigen/lwt/archive/5.6.0.tar.gz";
        sha512 = "d616389bc9e0da11f25843ab7541ac2d40c9543700a89455f14115b339bbe58cef2b8acf0ae97fd54e15a4cb93149cfe1ebfda301aa93933045f76b7d9344160";
      };
      opam = "${repo}/packages/lwt_ppx/lwt_ppx.2.1.0/opam";
      depends = [ dune lwt ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    lwt_react = {
      name = "lwt_react";
      version = "1.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocsigen/lwt/archive/5.6.0.tar.gz";
        sha512 = "d616389bc9e0da11f25843ab7541ac2d40c9543700a89455f14115b339bbe58cef2b8acf0ae97fd54e15a4cb93149cfe1ebfda301aa93933045f76b7d9344160";
      };
      opam = "${repo}/packages/lwt_react/lwt_react.1.2.0/opam";
      depends = [ dune lwt ocaml react ];
      buildDepends = [ cppo dune ocaml ];
    };
    lwt_ssl = {
      name = "lwt_ssl";
      version = "1.1.3";
      src = pkgs.fetchurl {
        url = "https://github.com/ocsigen/lwt_ssl/archive/1.1.3.tar.gz";
        sha256 = "0dxxkif4a667ndk14sn8ka4x4gck0gvw4sc12jb84rcq5k15jlkp";
      };
      opam = "${repo}/packages/lwt_ssl/lwt_ssl.1.1.3/opam";
      depends = [ base-unix dune lwt ocaml ssl ];
      buildDepends = [ dune ocaml ];
    };
    macaddr = {
      name = "macaddr";
      version = "5.3.1";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ocaml-ipaddr/releases/download/v5.3.1/ipaddr-5.3.1.tbz";
        sha256 = "9820bcbccadb6e6d9e22fe26b2f9a044897c8f47c29d157f464b41a2f191e7d4";
      };
      opam = "${repo}/packages/macaddr/macaddr.5.3.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    magic-mime = {
      name = "magic-mime";
      version = "1.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ocaml-magic-mime/releases/download/v1.2.0/magic-mime-v1.2.0.tbz";
        sha256 = "f121b67500f8dd97e2fc9fd5d01c7325e4c84bc5c0237442779fbd6fa20694f5";
      };
      opam = "${repo}/packages/magic-mime/magic-mime.1.2.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    menhir = {
      name = "menhir";
      version = "20220210";
      src = pkgs.fetchurl {
        url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
        sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
      };
      opam = "${repo}/packages/menhir/menhir.20220210/opam";
      depends = [ dune menhirLib menhirSdk ocaml ];
      buildDepends = [ dune ocaml ];
    };
    menhirLib = {
      name = "menhirLib";
      version = "20220210";
      src = pkgs.fetchurl {
        url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
        sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
      };
      opam = "${repo}/packages/menhirLib/menhirLib.20220210/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    menhirSdk = {
      name = "menhirSdk";
      version = "20220210";
      src = pkgs.fetchurl {
        url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
        sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
      };
      opam = "${repo}/packages/menhirSdk/menhirSdk.20220210/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    mew = {
      name = "mew";
      version = "0.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/kandu/mew/archive/0.1.0.tar.gz";
        sha256 = "1rjri9mgfb9gn9fmjn0ax21y9jd9wkvr7mmx2jrlqmzgabmqrlv4";
      };
      opam = "${repo}/packages/mew/mew.0.1.0/opam";
      depends = [ dune ocaml result trie ];
      buildDepends = [ dune ocaml ];
    };
    mew_vi = {
      name = "mew_vi";
      version = "0.5.0";
      src = pkgs.fetchurl {
        url = "https://github.com/kandu/mew_vi/archive/0.5.0.tar.gz";
        sha256 = "1nmg3cysglgw4115n5zpz4azrfbnfxkn2kvw73chzs69viygm4m6";
      };
      opam = "${repo}/packages/mew_vi/mew_vi.0.5.0/opam";
      depends = [ dune mew ocaml react ];
      buildDepends = [ dune ocaml ];
    };
    mirage = {
      name = "mirage";
      version = "4.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage/releases/download/v4.3.0/mirage-4.3.0.tbz";
        sha256 = "6794212f3351ba3aacdcc4ef1752f97d8049795ffb2df714feb9f0f890f9ad8d";
      };
      opam = "${repo}/packages/mirage/mirage.4.3.0/opam";
      depends = [ astring bos dune functoria ipaddr logs mirage-runtime ocaml
                  opam-monorepo ];
      buildDepends = [ dune ocaml ];
    };
    mirage-clock = {
      name = "mirage-clock";
      version = "4.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage-clock/releases/download/v4.2.0/mirage-clock-4.2.0.tbz";
        sha256 = "fa17d15d5be23c79ba741f5f7cb88ed7112de16a4410cea81c71b98086889847";
      };
      opam = "${repo}/packages/mirage-clock/mirage-clock.4.2.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    mirage-crypto = {
      name = "mirage-crypto";
      version = "0.10.7";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.7/mirage-crypto-0.10.7.tbz";
        sha256 = "3e818a760c235c5b684c7b6b43b1cdd2a7dd04e0105b680d524f836eb988a69c";
      };
      opam = "${repo}/packages/mirage-crypto/mirage-crypto.0.10.7/opam";
      depends = [ cstruct dune dune-configurator eqaf ocaml ];
      buildDepends = [ conf-pkg-config dune dune-configurator ocaml ];
    };
    mirage-crypto-rng = {
      name = "mirage-crypto-rng";
      version = "0.10.7";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage-crypto/releases/download/v0.10.7/mirage-crypto-0.10.7.tbz";
        sha256 = "3e818a760c235c5b684c7b6b43b1cdd2a7dd04e0105b680d524f836eb988a69c";
      };
      opam = "${repo}/packages/mirage-crypto-rng/mirage-crypto-rng.0.10.7/opam";
      depends = [ cstruct dune dune-configurator duration logs lwt
                  mirage-crypto mtime ocaml ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    mirage-runtime = {
      name = "mirage-runtime";
      version = "4.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/mirage/releases/download/v4.3.0/mirage-4.3.0.tbz";
        sha256 = "6794212f3351ba3aacdcc4ef1752f97d8049795ffb2df714feb9f0f890f9ad8d";
      };
      opam = "${repo}/packages/mirage-runtime/mirage-runtime.4.3.0/opam";
      depends = [ dune fmt functoria-runtime ipaddr logs lwt ocaml ];
      buildDepends = [ dune ocaml ];
    };
    mtime = {
      name = "mtime";
      version = "1.4.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/mtime/releases/mtime-1.4.0.tbz";
        sha512 = "0492fa5f5187b909fe2b0550363c7dcb8cffef963d51072272ef3d876b51e1ddf8de4c4e221cffb0144658fccf6a0dc584a5c8094a4b2208156e43bad5b269d4";
      };
      opam = "${repo}/packages/mtime/mtime.1.4.0/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    multipart_form = {
      name = "multipart_form";
      version = "0.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/multipart_form/releases/download/v0.4.1/multipart_form-0.4.1.tbz";
        sha256 = "36268ee6fec4c53273c2c0b977a4a9f441a5c6ce586773d91d28b599b45540db";
      };
      opam = "${repo}/packages/multipart_form/multipart_form.0.4.1/opam";
      depends = [ angstrom base64 bigstringaf dune fmt ke logs ocaml pecu
                  prettym rresult unstrctrd uutf ];
      buildDepends = [ dune ocaml ];
    };
    multipart_form-lwt = {
      name = "multipart_form-lwt";
      version = "0.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/multipart_form/releases/download/v0.4.1/multipart_form-0.4.1.tbz";
        sha256 = "36268ee6fec4c53273c2c0b977a4a9f441a5c6ce586773d91d28b599b45540db";
      };
      opam = "${repo}/packages/multipart_form-lwt/multipart_form-lwt.0.4.1/opam";
      depends = [ angstrom bigstringaf dune ke lwt multipart_form ocaml ];
      buildDepends = [ dune ocaml ];
    };
    num = {
      name = "num";
      version = "1.4";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
        sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
      };
      opam = "${repo}/packages/num/num.1.4/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlfind ];
    };
    ocaml = {
      name = "ocaml";
      version = "4.14.0";
      opam = "${repo}/packages/ocaml/ocaml.4.14.0/opam";
      depends = [ ocaml-config ocaml-system ];
    };
    ocaml-compiler-libs = {
      name = "ocaml-compiler-libs";
      version = "v0.12.4";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.4/ocaml-compiler-libs-v0.12.4.tbz";
        sha256 = "4ec9c9ec35cc45c18c7a143761154ef1d7663036a29297f80381f47981a07760";
      };
      opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.4/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ocaml-config = {
      name = "ocaml-config";
      version = "2";
      opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
      depends = [ ocaml-system ];
    };
    ocaml-lsp-server = {
      name = "ocaml-lsp-server";
      version = "1.13.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/ocaml-lsp/releases/download/1.13.1/lsp-1.13.1.tbz";
        sha256 = "e55f5bd88a5be2ff325fbc3b98eb7317d64de12b3f59d8c812e3ea2824fd0cfc";
      };
      opam = "${repo}/packages/ocaml-lsp-server/ocaml-lsp-server.1.13.1/opam";
      depends = [ chrome-trace csexp dune dune-build-info dune-rpc dyn fiber
                  ocaml ocamlformat-rpc-lib octavius omd ordering pp
                  ppx_yojson_conv_lib re spawn stdune uutf xdg yojson ];
      buildDepends = [ dune ocaml ];
    };
    ocaml-syntax-shims = {
      name = "ocaml-syntax-shims";
      version = "1.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ocaml-syntax-shims/releases/download/1.0.0/ocaml-syntax-shims-1.0.0.tbz";
        sha256 = "89b2e193e90a0c168b6ec5ddf6fef09033681bdcb64e11913c97440a2722e8c8";
      };
      opam = "${repo}/packages/ocaml-syntax-shims/ocaml-syntax-shims.1.0.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ocaml-system = {
      name = "ocaml-system";
      version = "4.14.0";
      opam = "${repo}/packages/ocaml-system/ocaml-system.4.14.0/opam";
      depexts = [ pkgs.ocaml-ng.ocamlPackages_4_14.ocaml ];
    };
    ocaml-version = {
      name = "ocaml-version";
      version = "3.5.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocurrent/ocaml-version/releases/download/v3.5.0/ocaml-version-3.5.0.tbz";
        sha256 = "d63ca1c3970d6b14057f7176bfdae623e6c0176287c6a6e8b78cf50e2f7f635b";
      };
      opam = "${repo}/packages/ocaml-version/ocaml-version.3.5.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ocaml_intrinsics = {
      name = "ocaml_intrinsics";
      version = "v0.15.2";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/ocaml_intrinsics/archive/refs/tags/v0.15.2.tar.gz";
        sha256 = "92064a7fcebf1654d44f4d29abec0a9650505c3929b6d38fb293c2b69e5ca5ca";
      };
      opam = "${repo}/packages/ocaml_intrinsics/ocaml_intrinsics.v0.15.2/opam";
      depends = [ dune dune-configurator ocaml ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    ocamlbuild = {
      name = "ocamlbuild";
      version = "0.14.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
        sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
      };
      opam = "${repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    ocamlfind = {
      name = "ocamlfind";
      version = "1.9.5";
      src = pkgs.fetchurl {
        url = "http://download.camlcity.org/download/findlib-1.9.5.tar.gz";
        sha512 = "03514c618a16b02889db997c6c4789b3436b3ad7d974348d2c6dea53eb78898ab285ce5f10297c074bab4fd2c82931a8b7c5c113b994447a44abb30fca74c715";
      };
      opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.5/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    ocamlformat = {
      name = "ocamlformat";
      version = "0.24.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ocamlformat/releases/download/0.24.1/ocamlformat-0.24.1.tbz";
        sha256 = "023425e9818f80ea50537b2371a4a766c149a9957d05807e88a004d2d5f441ce";
      };
      opam = "${repo}/packages/ocamlformat/ocamlformat.0.24.1/opam";
      depends = [ base cmdliner csexp dune dune-build-info either fix fpath
                  menhir menhirLib menhirSdk ocaml ocaml-version ocp-indent
                  odoc-parser re stdio uuseg uutf ];
      buildDepends = [ dune menhir ocaml ];
    };
    ocamlformat-rpc-lib = {
      name = "ocamlformat-rpc-lib";
      version = "0.24.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ocamlformat/releases/download/0.24.1/ocamlformat-0.24.1.tbz";
        sha256 = "023425e9818f80ea50537b2371a4a766c149a9957d05807e88a004d2d5f441ce";
      };
      opam = "${repo}/packages/ocamlformat-rpc-lib/ocamlformat-rpc-lib.0.24.1/opam";
      depends = [ csexp dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ocamlgraph = {
      name = "ocamlgraph";
      version = "2.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
        sha256 = "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
      };
      opam = "${repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
      depends = [ dune ocaml stdlib-shims ];
      buildDepends = [ dune ocaml ];
    };
    ocp-browser = {
      name = "ocp-browser";
      version = "1.3.4";
      src = pkgs.fetchurl {
        url = "https://github.com/OCamlPro/ocp-index/archive/1.3.4.tar.gz";
        sha512 = "32c800c404ae0f32a6cdb8f5f62bac56b23b017dd27674834e4d063df7d49bca272fc39ba2905b8404b5e3d1b154f1ffd2924705e34e1d1ac56242260b81a5c4";
      };
      opam = "${repo}/packages/ocp-browser/ocp-browser.1.3.4/opam";
      depends = [ cmdliner dune lambda-term ocaml ocp-index zed ];
      buildDepends = [ cppo dune ocaml ];
    };
    ocp-indent = {
      name = "ocp-indent";
      version = "1.8.1";
      src = pkgs.fetchurl {
        url = "https://github.com/OCamlPro/ocp-indent/archive/1.8.1.tar.gz";
        sha512 = "565353de333dd44375366fff75e85a6256c3cd9ff52b3db79803141f975e77cda04dfe32f5e0f2d4c82c59be8f04e9c2bf4d066b113b2cdf267f4c3dcfa401da";
      };
      opam = "${repo}/packages/ocp-indent/ocp-indent.1.8.1/opam";
      depends = [ base-bytes cmdliner dune ocaml ocamlfind ];
      buildDepends = [ dune ocaml ocamlfind ];
    };
    ocp-index = {
      name = "ocp-index";
      version = "1.3.4";
      src = pkgs.fetchurl {
        url = "https://github.com/OCamlPro/ocp-index/archive/1.3.4.tar.gz";
        sha512 = "32c800c404ae0f32a6cdb8f5f62bac56b23b017dd27674834e4d063df7d49bca272fc39ba2905b8404b5e3d1b154f1ffd2924705e34e1d1ac56242260b81a5c4";
      };
      opam = "${repo}/packages/ocp-index/ocp-index.1.3.4/opam";
      depends = [ cmdliner dune ocaml ocp-indent re ];
      buildDepends = [ cppo dune ocaml ];
    };
    ocplib-endian = {
      name = "ocplib-endian";
      version = "1.2";
      src = pkgs.fetchurl {
        url = "https://github.com/OCamlPro/ocplib-endian/archive/refs/tags/1.2.tar.gz";
        sha512 = "2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85";
      };
      opam = "${repo}/packages/ocplib-endian/ocplib-endian.1.2/opam";
      depends = [ base-bytes dune ocaml ];
      buildDepends = [ cppo dune ocaml ];
    };
    octavius = {
      name = "octavius";
      version = "1.2.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-doc/octavius/archive/v1.2.2.tar.gz";
        sha256 = "1bg0fcm7haqxvx5wx2cci0mbbq0gf1vw9fa4kkd6jsriw1611jga";
      };
      opam = "${repo}/packages/octavius/octavius.1.2.2/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    odoc-parser = {
      name = "odoc-parser";
      version = "2.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-doc/odoc-parser/releases/download/2.0.0/odoc-parser-2.0.0.tbz";
        sha256 = "407919fbb0eb95761d6fc6ec6777628d94aa1907343bdca678b1880bafb33922";
      };
      opam = "${repo}/packages/odoc-parser/odoc-parser.2.0.0/opam";
      depends = [ astring camlp-streams dune ocaml result ];
      buildDepends = [ dune ocaml ];
    };
    omd = {
      name = "omd";
      version = "1.3.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/omd/releases/download/1.3.2/omd-1.3.2.tbz";
        sha256 = "6023e1642631f08f678eb5725820879ed7bb5a3ffee777cdedebc28c1f85fadb";
      };
      opam = "${repo}/packages/omd/omd.1.3.2/opam";
      depends = [ base-bigarray base-bytes dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    opam-monorepo = {
      name = "opam-monorepo";
      version = "0.3.3";
      src = pkgs.fetchurl {
        url = "https://github.com/ocamllabs/opam-monorepo/releases/download/0.3.3/opam-monorepo-0.3.3.tbz";
        sha256 = "f08bc18d4b5edca7d4b99bc27bcf2ea9150a709c8c6fcbbd2b203eb7a56c0c08";
      };
      opam = "${repo}/packages/opam-monorepo/opam-monorepo.0.3.3/opam";
      depends = [ conf-pkg-config dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    optint = {
      name = "optint";
      version = "0.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/optint/releases/download/v0.2.0/optint-0.2.0.tbz";
        sha256 = "1dcbe0b6b6031f77db33028c87138fdb3bf90f92915e3b6629ddeb30a0d3000b";
      };
      opam = "${repo}/packages/optint/optint.0.2.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ordering = {
      name = "ordering";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/ordering/ordering.3.4.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    parsexp = {
      name = "parsexp";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/parsexp-v0.15.0.tar.gz";
        sha256 = "d1ee902b12ac7c0c888863025990d06845530fb75328454814e5ce5b6d43d193";
      };
      opam = "${repo}/packages/parsexp/parsexp.v0.15.0/opam";
      depends = [ base dune ocaml sexplib0 ];
      buildDepends = [ dune ocaml ];
    };
    pecu = {
      name = "pecu";
      version = "0.6";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/pecu/releases/download/v0.6/pecu-v0.6.tbz";
        sha256 = "a9d2b7da444c83b20f879f6c3b7fc911d08ac1e6245ad7105437504f9394e5c7";
      };
      opam = "${repo}/packages/pecu/pecu.0.6/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    pp = {
      name = "pp";
      version = "1.1.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-dune/pp/releases/download/1.1.2/pp-1.1.2.tbz";
        sha256 = "e4a4e98d96b1bb76950fcd6da4e938c86d989df4d7e48f02f7a44595f5af1d56";
      };
      opam = "${repo}/packages/pp/pp.1.1.2/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ppx_assert = {
      name = "ppx_assert";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_assert-v0.15.0.tar.gz";
        sha256 = "4e5f653f84232569cd7d8e04d09ebba28b395e4be037c0b1e122e82cbe0f5967";
      };
      opam = "${repo}/packages/ppx_assert/ppx_assert.v0.15.0/opam";
      depends = [ base dune ocaml ppx_cold ppx_compare ppx_here ppx_sexp_conv
                  ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_base = {
      name = "ppx_base";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_base-v0.15.0.tar.gz";
        sha256 = "d6bbad352ea547c9c0a3636abe87287d5a680b46a06ddd70d6126905853f3ca0";
      };
      opam = "${repo}/packages/ppx_base/ppx_base.v0.15.0/opam";
      depends = [ dune ocaml ppx_cold ppx_compare ppx_enumerate ppx_hash
                  ppx_sexp_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_bench = {
      name = "ppx_bench";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_bench-v0.15.0.tar.gz";
        sha256 = "b188c72c3ecd7273fbecece152da206df937263ed5bf0d3163e9a123a8c2e17e";
      };
      opam = "${repo}/packages/ppx_bench/ppx_bench.v0.15.0/opam";
      depends = [ dune ocaml ppx_inline_test ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_bin_prot = {
      name = "ppx_bin_prot";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_bin_prot-v0.15.0.tar.gz";
        sha256 = "b2c8e62211d9a3ae5f91984613b812e0416c73120a2a18b8670d131110154013";
      };
      opam = "${repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.15.0/opam";
      depends = [ base bin_prot dune ocaml ppx_here ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_cold = {
      name = "ppx_cold";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_cold-v0.15.0.tar.gz";
        sha256 = "8b9fae3341332411e46209d6639d75810260caa897aff4945500612db8abf88d";
      };
      opam = "${repo}/packages/ppx_cold/ppx_cold.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_compare = {
      name = "ppx_compare";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_compare-v0.15.0.tar.gz";
        sha256 = "6a0728929a7b591dffa0f1099d989854f871238697c70b34475eb9ffdce17385";
      };
      opam = "${repo}/packages/ppx_compare/ppx_compare.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_custom_printf = {
      name = "ppx_custom_printf";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_custom_printf-v0.15.0.tar.gz";
        sha256 = "ae0ca7773cdbabf8caac90353c953fc4654ad3d988219c7ce6a03b08f2a3a680";
      };
      opam = "${repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.15.0/opam";
      depends = [ base dune ocaml ppx_sexp_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_derivers = {
      name = "ppx_derivers";
      version = "1.2.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
        sha256 = "159vqy616ni18mn0dlv8c2y4h7mb4hahwjn53yrr59yyhzhmwndn";
      };
      opam = "${repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    ppx_deriving = {
      name = "ppx_deriving";
      version = "5.2.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ppx_deriving/releases/download/v5.2.1/ppx_deriving-v5.2.1.tbz";
        sha256 = "e96b5fb25b7632570e4b329e22e097fcd4b8e8680d1e43ef003a8fbd742b0786";
      };
      opam = "${repo}/packages/ppx_deriving/ppx_deriving.5.2.1/opam";
      depends = [ dune ocaml ocamlfind ppx_derivers ppxlib result ];
      buildDepends = [ cppo dune ocaml ocamlfind ];
    };
    ppx_disable_unused_warnings = {
      name = "ppx_disable_unused_warnings";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_disable_unused_warnings-v0.15.0.tar.gz";
        sha256 = "aeab318cb7541f9b22da50268492ff9d161ece9003ed5b1977917da346f6eebe";
      };
      opam = "${repo}/packages/ppx_disable_unused_warnings/ppx_disable_unused_warnings.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_enumerate = {
      name = "ppx_enumerate";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_enumerate-v0.15.0.tar.gz";
        sha256 = "deb5fb9ca12ade3e4fb8093f1cfdf50a03735b9db19a7535ad534331fb98d09b";
      };
      opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_expect = {
      name = "ppx_expect";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_expect-v0.15.0.tar.gz";
        sha256 = "06315a45b43da72f96719bcb183c0177b5198beae8c3ddce357e180a32f9ca7b";
      };
      opam = "${repo}/packages/ppx_expect/ppx_expect.v0.15.0/opam";
      depends = [ base dune ocaml ppx_here ppx_inline_test ppxlib re stdio ];
      buildDepends = [ dune ocaml ];
    };
    ppx_fields_conv = {
      name = "ppx_fields_conv";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_fields_conv-v0.15.0.tar.gz";
        sha256 = "d22ab3b63b043baf67e2bf9f2a7d92da625b46afc0230f925aef732bd1b62e61";
      };
      opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.15.0/opam";
      depends = [ base dune fieldslib ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_fixed_literal = {
      name = "ppx_fixed_literal";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_fixed_literal-v0.15.0.tar.gz";
        sha256 = "f04136ce33f999c08cadb92a17f371b4dcb086a7ae0039e5c2c86b2ce985a9fc";
      };
      opam = "${repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_hash = {
      name = "ppx_hash";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_hash-v0.15.0.tar.gz";
        sha256 = "45bb666a0f93aab5bc120126c4c7d4081d611c64969606799248b2d8418d1711";
      };
      opam = "${repo}/packages/ppx_hash/ppx_hash.v0.15.0/opam";
      depends = [ base dune ocaml ppx_compare ppx_sexp_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_here = {
      name = "ppx_here";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_here-v0.15.0.tar.gz";
        sha256 = "c5bc027c938a4893267c12e5ded6d7391b89851cf69094154ad9d824c3e0cadf";
      };
      opam = "${repo}/packages/ppx_here/ppx_here.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_ignore_instrumentation = {
      name = "ppx_ignore_instrumentation";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_ignore_instrumentation-v0.15.0.tar.gz";
        sha256 = "22441d1be03937f32cb329cd5863fcb2d7d7e3f74bacce73b19bc0fd14a89f02";
      };
      opam = "${repo}/packages/ppx_ignore_instrumentation/ppx_ignore_instrumentation.v0.15.0/opam";
      depends = [ dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_inline_test = {
      name = "ppx_inline_test";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_inline_test-v0.15.0.tar.gz";
        sha256 = "3f78d141abc4a8e2ff69354299f8b2215ad33aa79a36a7f7fb82635e4ea1871b";
      };
      opam = "${repo}/packages/ppx_inline_test/ppx_inline_test.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib time_now ];
      buildDepends = [ dune ocaml ];
    };
    ppx_irmin = {
      name = "ppx_irmin";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/irmin/releases/download/3.4.1/irmin-3.4.1.tbz";
        sha256 = "922836116c30ec68068a38694a09bba521cf47edd0e4ae44e076b9b4963da180";
      };
      opam = "${repo}/packages/ppx_irmin/ppx_irmin.3.4.1/opam";
      depends = [ dune logs ocaml ppx_repr ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_jane = {
      name = "ppx_jane";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_jane-v0.15.0.tar.gz";
        sha256 = "d0fa44d2279adfd24223c7e7a6d2a9be9fccc737810bf53876214181858e8146";
      };
      opam = "${repo}/packages/ppx_jane/ppx_jane.v0.15.0/opam";
      depends = [ base_quickcheck dune ocaml ppx_assert ppx_base ppx_bench
                  ppx_bin_prot ppx_custom_printf ppx_disable_unused_warnings
                  ppx_expect ppx_fields_conv ppx_fixed_literal ppx_here
                  ppx_ignore_instrumentation ppx_inline_test ppx_let ppx_log
                  ppx_module_timer ppx_optcomp ppx_optional ppx_pipebang
                  ppx_sexp_message ppx_sexp_value ppx_stable ppx_string
                  ppx_typerep_conv ppx_variants_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_let = {
      name = "ppx_let";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_let-v0.15.0.tar.gz";
        sha256 = "64742c11eab6d6915a5213b20648af16ea2f65771170887ad91f8f1da38f3655";
      };
      opam = "${repo}/packages/ppx_let/ppx_let.v0.15.0/opam";
      depends = [ base dune ocaml ppx_here ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_log = {
      name = "ppx_log";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_log-v0.15.0.tar.gz";
        sha256 = "037aa3c8c4dca5c7ce9154e981c146c92faeeac456931cf3c9496b4f9698763e";
      };
      opam = "${repo}/packages/ppx_log/ppx_log.v0.15.0/opam";
      depends = [ base dune ocaml ppx_here ppx_sexp_conv ppx_sexp_message
                  ppxlib sexplib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_module_timer = {
      name = "ppx_module_timer";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_module_timer-v0.15.0.tar.gz";
        sha256 = "22a8d0347cb0c7a349a316ff250f059ab90dafd20f14373f08ef04500b967c62";
      };
      opam = "${repo}/packages/ppx_module_timer/ppx_module_timer.v0.15.0/opam";
      depends = [ base dune ocaml ppx_base ppxlib stdio time_now ];
      buildDepends = [ dune ocaml ];
    };
    ppx_optcomp = {
      name = "ppx_optcomp";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_optcomp-v0.15.0.tar.gz";
        sha256 = "c44e70d7b3c80f9e2bf8456da1076d16dc4504fc3e02d8709ca1b2e080caa6ed";
      };
      opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib stdio ];
      buildDepends = [ dune ocaml ];
    };
    ppx_optional = {
      name = "ppx_optional";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_optional-v0.15.0.tar.gz";
        sha256 = "72bb1319fc697c769df15ad659bdd0da2782df286212dd6b004c06e6a057c729";
      };
      opam = "${repo}/packages/ppx_optional/ppx_optional.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_pipebang = {
      name = "ppx_pipebang";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_pipebang-v0.15.0.tar.gz";
        sha256 = "1e56554d86ab61830492cc922b02dab0110cdd7584e90ffef4832dc6335620a8";
      };
      opam = "${repo}/packages/ppx_pipebang/ppx_pipebang.v0.15.0/opam";
      depends = [ dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_repr = {
      name = "ppx_repr";
      version = "0.6.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
        sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
      };
      opam = "${repo}/packages/ppx_repr/ppx_repr.0.6.0/opam";
      depends = [ dune fmt ppx_deriving ppxlib repr ];
      buildDepends = [ dune ];
    };
    ppx_sexp_conv = {
      name = "ppx_sexp_conv";
      version = "v0.15.1";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/ppx_sexp_conv/archive/refs/tags/v0.15.1.tar.gz";
        sha256 = "e34647850c58992a463f29b11b863f9b1322adc0a98d3b16028012507e0c2e9d";
      };
      opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.15.1/opam";
      depends = [ base dune ocaml ppxlib sexplib0 ];
      buildDepends = [ dune ocaml ];
    };
    ppx_sexp_message = {
      name = "ppx_sexp_message";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_sexp_message-v0.15.0.tar.gz";
        sha256 = "0d94785f80e45b97269e2e34b762a0909eba6a46e55c383cf8c1bdb8ffffdaba";
      };
      opam = "${repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.15.0/opam";
      depends = [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_sexp_value = {
      name = "ppx_sexp_value";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_sexp_value-v0.15.0.tar.gz";
        sha256 = "376ed3dcfb2f98b22d0c3a41a2adec3255ace7c93b8b72a8b3a46154395b558d";
      };
      opam = "${repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.15.0/opam";
      depends = [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_stable = {
      name = "ppx_stable";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_stable-v0.15.0.tar.gz";
        sha256 = "90b4e87a590c695938db2b148aeb4a6543d32525ee826432812034470c012bb3";
      };
      opam = "${repo}/packages/ppx_stable/ppx_stable.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_string = {
      name = "ppx_string";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_string-v0.15.0.tar.gz";
        sha256 = "f33d4956792fd022c63f8eef4269fcbf77aa06402d7b17df80cb493482b71393";
      };
      opam = "${repo}/packages/ppx_string/ppx_string.v0.15.0/opam";
      depends = [ base dune ocaml ppx_base ppxlib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_typerep_conv = {
      name = "ppx_typerep_conv";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_typerep_conv-v0.15.0.tar.gz";
        sha256 = "e71729ed13a3cafd8f541056340bf167e8b510f3090ff5825402ed61af3b5e9f";
      };
      opam = "${repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib typerep ];
      buildDepends = [ dune ocaml ];
    };
    ppx_variants_conv = {
      name = "ppx_variants_conv";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_variants_conv-v0.15.0.tar.gz";
        sha256 = "6e7096f6e7b6c2fa916e85d2b526a4574234f72185b40f7d409d08f339dfac9c";
      };
      opam = "${repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.15.0/opam";
      depends = [ base dune ocaml ppxlib variantslib ];
      buildDepends = [ dune ocaml ];
    };
    ppx_yojson_conv_lib = {
      name = "ppx_yojson_conv_lib";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_yojson_conv_lib-v0.15.0.tar.gz";
        sha256 = "f9d2c5eff4566ec1f1f379b186ed22c8ddd6be0909a160bc5a9ac7abc6a6b684";
      };
      opam = "${repo}/packages/ppx_yojson_conv_lib/ppx_yojson_conv_lib.v0.15.0/opam";
      depends = [ dune ocaml yojson ];
      buildDepends = [ dune ocaml ];
    };
    ppxlib = {
      name = "ppxlib";
      version = "0.27.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.27.0/ppxlib-0.27.0.tbz";
        sha256 = "764b96121d6ffd6a73820e0ec5235176bfc42b94cf2ff97e32d068a5c4b28c62";
      };
      opam = "${repo}/packages/ppxlib/ppxlib.0.27.0/opam";
      depends = [ dune ocaml ocaml-compiler-libs ppx_derivers sexplib0
                  stdlib-shims ];
      buildDepends = [ dune ocaml ];
    };
    prettym = {
      name = "prettym";
      version = "0.0.3";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/prettym/releases/download/0.0.3/prettym-0.0.3.tbz";
        sha256 = "9170f1a11ade7f4d98a584a5be52bb6b91415f971c6e75894331b46b18b98f09";
      };
      opam = "${repo}/packages/prettym/prettym.0.0.3/opam";
      depends = [ bigarray-overlap bigstringaf dune fmt ke ocaml ];
      buildDepends = [ dune ocaml ];
    };
    psq = {
      name = "psq";
      version = "0.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/pqwy/psq/releases/download/v0.2.0/psq-v0.2.0.tbz";
        sha256 = "1j4lqkq17rskhgcrpgr4n1m1a2b1x35mlxj6f9g05rhpmgvgvknk";
      };
      opam = "${repo}/packages/psq/psq.0.2.0/opam";
      depends = [ dune ocaml seq ];
      buildDepends = [ dune ocaml ];
    };
    ptime = {
      name = "ptime";
      version = "1.0.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/ptime/releases/ptime-1.0.0.tbz";
        sha512 = "df2410d9cc25a33083fe968a584b8fb4d68ad5c077f3356da0a20427e6cd8756a5b946b921e5cf8ed4097f2c506e93345d9dca63b113be644d5a7cc0753d1534";
      };
      opam = "${repo}/packages/ptime/ptime.1.0.0/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    re = {
      name = "re";
      version = "1.10.4";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/ocaml-re/releases/download/1.10.4/re-1.10.4.tbz";
        sha256 = "83eb3e4300aa9b1dc7820749010f4362ea83524742130524d78c20ce99ca747c";
      };
      opam = "${repo}/packages/re/re.1.10.4/opam";
      depends = [ dune ocaml seq ];
      buildDepends = [ dune ocaml ];
    };
    react = {
      name = "react";
      version = "1.2.2";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/react/releases/react-1.2.2.tbz";
        sha512 = "18cdd544d484222ba02db6bd9351571516532e7a1c107b59bbe39193837298f5c745eab6754f8bc6ff125b387be7018c6d6e6ac99f91925a5e4f53af688522b1";
      };
      opam = "${repo}/packages/react/react.1.2.2/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    repr = {
      name = "repr";
      version = "0.6.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/repr/releases/download/0.6.0/repr-fuzz-0.6.0.tbz";
        sha256 = "bb8a0f94df002fc19dcb598834271eaddeffa1d57041491ff3d2b9e3e80d075e";
      };
      opam = "${repo}/packages/repr/repr.0.6.0/opam";
      depends = [ base64 dune either fmt jsonm ocaml optint uutf ];
      buildDepends = [ dune ocaml ];
    };
    result = {
      name = "result";
      version = "1.5";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
        sha256 = "0cpfp35fdwnv3p30a06wd0py3805qxmq3jmcynjc3x2qhlimwfkw";
      };
      opam = "${repo}/packages/result/result.1.5/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    rresult = {
      name = "rresult";
      version = "0.7.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/rresult/releases/rresult-0.7.0.tbz";
        sha512 = "f1bb631c986996388e9686d49d5ae4d8aaf14034f6865c62a88fb58c48ce19ad2eb785327d69ca27c032f835984e0bd2efd969b415438628a31f3e84ec4551d3";
      };
      opam = "${repo}/packages/rresult/rresult.0.7.0/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    seq = {
      name = "seq";
      version = "base";
      opam = "${repo}/packages/seq/seq.base/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    sexp_pretty = {
      name = "sexp_pretty";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/sexp_pretty-v0.15.0.tar.gz";
        sha256 = "99e8643bc2bf9d0201702b165acccc9195bbb481093dc16ccb95c9fdfe015df1";
      };
      opam = "${repo}/packages/sexp_pretty/sexp_pretty.v0.15.0/opam";
      depends = [ base dune ocaml ppx_base re sexplib ];
      buildDepends = [ dune ocaml ];
    };
    sexplib = {
      name = "sexplib";
      version = "v0.15.1";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/sexplib/archive/refs/tags/v0.15.1.tar.gz";
        sha256 = "75da7d290d92d758c01f441f9589ccce031e11301563efde1c19149d39edbcbc";
      };
      opam = "${repo}/packages/sexplib/sexplib.v0.15.1/opam";
      depends = [ dune num ocaml parsexp sexplib0 ];
      buildDepends = [ dune ocaml ];
    };
    sexplib0 = {
      name = "sexplib0";
      version = "v0.15.1";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/sexplib0/archive/refs/tags/v0.15.1.tar.gz";
        sha256 = "1cv78931di97av82khqwmx5s51mrn9d2b82z0si88gxwndz83kg8";
      };
      opam = "${repo}/packages/sexplib0/sexplib0.v0.15.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    spawn = {
      name = "spawn";
      version = "v0.15.1";
      src = pkgs.fetchurl {
        url = "https://github.com/janestreet/spawn/archive/v0.15.1.tar.gz";
        sha256 = "9afdee314fab6c3fcd689ab6eb5608d6b78078e6dede3953a47debde06c19d50";
      };
      opam = "${repo}/packages/spawn/spawn.v0.15.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    splittable_random = {
      name = "splittable_random";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/splittable_random-v0.15.0.tar.gz";
        sha256 = "9ff8e6c85fb5c39f45ca8bcf499a8bc3f419a18e759091d3a8d82b2aabeedb00";
      };
      opam = "${repo}/packages/splittable_random/splittable_random.v0.15.0/opam";
      depends = [ base dune ocaml ppx_assert ppx_bench ppx_inline_test
                  ppx_sexp_message ];
      buildDepends = [ dune ocaml ];
    };
    ssl = {
      name = "ssl";
      version = "0.5.12";
      src = pkgs.fetchurl {
        url = "https://github.com/savonet/ocaml-ssl/releases/download/0.5.12/ssl-0.5.12.tbz";
        sha256 = "e60c4dc60636516d82db785e5533ddbaabca5f96483f04a0d6aa6f43b5e9e79e";
      };
      opam = "${repo}/packages/ssl/ssl.0.5.12/opam";
      depends = [ base-unix conf-libssl dune dune-configurator ocaml ];
      buildDepends = [ dune dune-configurator ocaml ];
    };
    stdio = {
      name = "stdio";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/stdio-v0.15.0.tar.gz";
        sha256 = "c37292921dc6a88425f773eba6bdbeac1dedacd1f55917fa4bcd9c4b25795e4b";
      };
      opam = "${repo}/packages/stdio/stdio.v0.15.0/opam";
      depends = [ base dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    stdlib-shims = {
      name = "stdlib-shims";
      version = "0.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
        sha256 = "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
      };
      opam = "${repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    stdune = {
      name = "stdune";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/stdune/stdune.3.4.1/opam";
      depends = [ base-unix csexp dune dyn ocaml ordering pp ];
      buildDepends = [ dune ocaml ];
    };
    streaming = {
      name = "streaming";
      version = "0.8.0";
      src = pkgs.fetchurl {
        url = "https://github.com/odis-labs/streaming/releases/download/0.8.0/streaming-0.8.0.tbz";
        sha256 = "5bedc6619a6c2e3d529d086e4a68d7762ffce5f31a8d6a73e1bef1e56d1b9c9b";
      };
      opam = "${repo}/packages/streaming/streaming.0.8.0/opam";
      depends = [ dune ocaml stdlib-shims ];
      buildDepends = [ dune ocaml ];
    };
    stringext = {
      name = "stringext";
      version = "1.6.0";
      src = pkgs.fetchurl {
        url = "https://github.com/rgrinberg/stringext/releases/download/1.6.0/stringext-1.6.0.tbz";
        sha256 = "db41f5d52e9eab17615f110b899dfeb27dd7e7f89cd35ae43827c5119db206ea";
      };
      opam = "${repo}/packages/stringext/stringext.1.6.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    textutils = {
      name = "textutils";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/textutils-v0.15.0.tar.gz";
        sha256 = "c0368fb6ad18727cd69fbfb20dd734fb7f7189707107d1f88d8de15837dc22df";
      };
      opam = "${repo}/packages/textutils/textutils.v0.15.0/opam";
      depends = [ core core_kernel core_unix dune ocaml ppx_jane
                  textutils_kernel uutf ];
      buildDepends = [ dune ocaml ];
    };
    textutils_kernel = {
      name = "textutils_kernel";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/textutils_kernel-v0.15.0.tar.gz";
        sha256 = "acac915dc3240a0888141e89dc9fcc8fe696c25003f331ca0f014bcbeb57fa37";
      };
      opam = "${repo}/packages/textutils_kernel/textutils_kernel.v0.15.0/opam";
      depends = [ core dune ocaml ppx_jane uutf ];
      buildDepends = [ dune ocaml ];
    };
    time_now = {
      name = "time_now";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/time_now-v0.15.0.tar.gz";
        sha256 = "13b353305da2d349fce3bb47be24307a7163318872238eda0a91f15a8a0bcba8";
      };
      opam = "${repo}/packages/time_now/time_now.v0.15.0/opam";
      depends = [ base dune jane-street-headers jst-config ocaml ppx_base
                  ppx_optcomp ];
      buildDepends = [ dune ocaml ];
    };
    timezone = {
      name = "timezone";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/timezone-v0.15.0.tar.gz";
        sha256 = "a5fecedd06c779a7a6c0b910e2a1bfc7119049a57e8f6c59bf18752c1271410d";
      };
      opam = "${repo}/packages/timezone/timezone.v0.15.0/opam";
      depends = [ core dune ocaml ppx_jane ];
      buildDepends = [ dune ocaml ];
    };
    topkg = {
      name = "topkg";
      version = "1.0.5";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
        sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
      };
      opam = "${repo}/packages/topkg/topkg.1.0.5/opam";
      depends = [ ocaml ocamlbuild ];
      buildDepends = [ ocaml ocamlbuild ocamlfind ];
    };
    trie = {
      name = "trie";
      version = "1.0.0";
      src = pkgs.fetchurl {
        url = "https://github.com/kandu/trie/archive/1.0.0.tar.gz";
        sha256 = "1slq4kiwnc723dsaw15ms7xxpqz061v8zck1m6iyc5j2li70by62";
      };
      opam = "${repo}/packages/trie/trie.1.0.0/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    typerep = {
      name = "typerep";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/typerep-v0.15.0.tar.gz";
        sha256 = "26c8d37db41440a417593fcb389aaebafdf2e33e62bd762e1f148875a7a3183e";
      };
      opam = "${repo}/packages/typerep/typerep.v0.15.0/opam";
      depends = [ base dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    uchar = {
      name = "uchar";
      version = "0.0.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/uchar/releases/download/v0.0.2/uchar-0.0.2.tbz";
        sha256 = "1w2saw7zanf9m9ffvz2lvcxvlm118pws2x1wym526xmydhqpyfa7";
      };
      opam = "${repo}/packages/uchar/uchar.0.0.2/opam";
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ];
    };
    universe = {
      name = "universe";
      version = "root";
      src = ./.;
      opam = "${universe.src}/universe.opam";
      depends = [ alcotest benchmark caqti containers core_bench dream dune
                  fmt gen irmin iter lwt mirage ocaml ocaml-lsp-server
                  ocamlformat ocp-browser ppxlib ptime seq streaming utop
                  yojson ];
      buildDepends = [ dune ocaml ];
    };
    unstrctrd = {
      name = "unstrctrd";
      version = "0.3";
      src = pkgs.fetchurl {
        url = "https://github.com/dinosaure/unstrctrd/releases/download/v0.3/unstrctrd-v0.3.tbz";
        sha256 = "7355b1e9a6b977608641c88f9f136fff309ef64e174818c7ccadc8a2a78ded5b";
      };
      opam = "${repo}/packages/unstrctrd/unstrctrd.0.3/opam";
      depends = [ angstrom dune ocaml uutf ];
      buildDepends = [ dune ocaml ];
    };
    uri = {
      name = "uri";
      version = "4.2.0";
      src = pkgs.fetchurl {
        url = "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
        sha256 = "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
      };
      opam = "${repo}/packages/uri/uri.4.2.0/opam";
      depends = [ angstrom dune ocaml stringext ];
      buildDepends = [ dune ocaml ];
    };
    utop = {
      name = "utop";
      version = "2.9.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-community/utop/releases/download/2.9.2/utop-2.9.2.tbz";
        sha512 = "db97275aa4bd7725a9eeec6d9155c239f3e48adf8d34b73f55caa2de32fde98862480db5e05dffc89e98efd12eb60e08d89ad34b9a92a8de0d37ccb32af07ddf";
      };
      opam = "${repo}/packages/utop/utop.2.9.2/opam";
      depends = [ base-threads base-unix camomile dune lambda-term lwt
                  lwt_react ocaml ocamlfind react ];
      buildDepends = [ cppo dune ocaml ocamlfind ];
    };
    uucp = {
      name = "uucp";
      version = "15.0.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/uucp/releases/uucp-15.0.0.tbz";
        sha512 = "ee4acff5666961766321e85e287fb9d5b8d50533319f22bf6f4eceb943242df2d0e0f4e775c4a140f68ca142837938eaa5926e22362215a3365ffe7f8768923b";
      };
      opam = "${repo}/packages/uucp/uucp.15.0.0/opam";
      depends = [ cmdliner ocaml uutf ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    uuseg = {
      name = "uuseg";
      version = "15.0.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/uuseg/releases/uuseg-15.0.0.tbz";
        sha512 = "37ea83b582dd779a026cfae11f08f5d67ef79fce65a2cf03f2a9aabc7eb5de60c8e812524fa7531e4ff6e22a3b18228e3438a0143ce43be95f23237cc283576f";
      };
      opam = "${repo}/packages/uuseg/uuseg.15.0.0/opam";
      depends = [ cmdliner ocaml uucp uutf ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    uutf = {
      name = "uutf";
      version = "1.0.3";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/uutf/releases/uutf-1.0.3.tbz";
        sha512 = "50cc4486021da46fb08156e9daec0d57b4ca469b07309c508d5a9a41e9dbcf1f32dec2ed7be027326544453dcaf9c2534919395fd826dc7768efc6cc4bfcc9f8";
      };
      opam = "${repo}/packages/uutf/uutf.1.0.3/opam";
      depends = [ cmdliner ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    variantslib = {
      name = "variantslib";
      version = "v0.15.0";
      src = pkgs.fetchurl {
        url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/variantslib-v0.15.0.tar.gz";
        sha256 = "e5d87438e439877d8580ed209b17c0ba5e36e1405fcf9ddd972f1bbf48d7ba89";
      };
      opam = "${repo}/packages/variantslib/variantslib.v0.15.0/opam";
      depends = [ base dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    xdg = {
      name = "xdg";
      version = "3.4.1";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
        sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
      };
      opam = "${repo}/packages/xdg/xdg.3.4.1/opam";
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    yojson = {
      name = "yojson";
      version = "2.0.2";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-community/yojson/releases/download/2.0.2/yojson-2.0.2.tbz";
        sha256 = "876bb6f38af73a84a29438a3da35e4857c60a14556a606525b148c6fdbe5461b";
      };
      opam = "${repo}/packages/yojson/yojson.2.0.2/opam";
      depends = [ dune ocaml seq ];
      buildDepends = [ cppo dune ocaml ];
    };
    zed = {
      name = "zed";
      version = "3.1.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ocaml-community/zed/archive/3.1.0.tar.gz";
        sha256 = "1z95fs49hi00xy078a83m0vfdqwjb5953rwr15lfpirldi4v11y3";
      };
      opam = "${repo}/packages/zed/zed.3.1.0/opam";
      depends = [ base-bytes camomile charInfo_width dune ocaml react ];
      buildDepends = [ dune ocaml ];
    };
  };
}
