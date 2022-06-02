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
  async = {
    name = "async";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/async-v0.13.0.tar.gz";
      sha256 = "1avikhx3d4fv0ara2x21inxahr6n3a4vg4k29y0dfnga8biypygy";
    };
    opam = "${repo}/packages/async/async.v0.13.0/opam";
    depends = with self; [ async_kernel async_rpc_kernel async_unix core
                           core_kernel dune ocaml ppx_jane textutils ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_kernel = {
    name = "async_kernel";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/async_kernel-v0.13.0.tar.gz";
      sha256 = "0racal74lw9b462gks1zf2dwjzinhic52i3n6nwfrakais5jr8sm";
    };
    opam = "${repo}/packages/async_kernel/async_kernel.v0.13.0/opam";
    depends = with self; [ core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_rpc_kernel = {
    name = "async_rpc_kernel";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/async_rpc_kernel-v0.13.0.tar.gz";
      sha256 = "0gvzplq1cscshc81vdmq96b206cczshl9bii6kvh2yb8m2g81skr";
    };
    opam = "${repo}/packages/async_rpc_kernel/async_rpc_kernel.v0.13.0/opam";
    depends = with self; [ async_kernel core_kernel dune ocaml ppx_jane
                           protocol_version_header ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_unix = {
    name = "async_unix";
    version = "v0.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/async_unix/archive/v0.13.1.tar.gz";
      sha256 = "1h2hlv2m9695nnwqd9qarah9b6h4smb6g3hfl9vcbfisdpbciaw0";
    };
    opam = "${repo}/packages/async_unix/async_unix.v0.13.1/opam";
    depends = with self; [ async_kernel core core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
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
  base_bigstring = {
    name = "base_bigstring";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/base_bigstring-v0.13.0.tar.gz";
      sha256 = "0hy4kp85av7h7s23h6drbd8lkcdlc74crylbsn9q8wmn7hs5y1qn";
    };
    opam = "${repo}/packages/base_bigstring/base_bigstring.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  base_quickcheck = {
    name = "base_quickcheck";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/base_quickcheck-v0.13.0.tar.gz";
      sha256 = "1rcr4z6w9vr0371z4xk4l299yv0ilgpf8lky4zlph584p810jx18";
    };
    opam = "${repo}/packages/base_quickcheck/base_quickcheck.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                           ppx_sexp_message ppxlib splittable_random ];
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
  bin_prot = {
    name = "bin_prot";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/bin_prot-v0.13.0.tar.gz";
      sha256 = "196hl160ns6knilb1b9sbl62zvxpcyli1vy77i3pb50938fcmvip";
    };
    opam = "${repo}/packages/bin_prot/bin_prot.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_custom_printf
                           ppx_fields_conv ppx_sexp_conv ppx_variants_conv
                           (self.mirage-xen-ocaml or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  core = {
    name = "core";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/core-v0.13.0.tar.gz";
      sha256 = "0ngm97m1a71d1q8gj7dpj9fvrh720lbw9zwvr1m0g40z8jxfpkpl";
    };
    opam = "${repo}/packages/core/core.v0.13.0/opam";
    depends = with self; [ base-threads core_kernel dune jst-config ocaml
                           ppx_jane sexplib spawn ];
    buildDepends = with self; [ dune ocaml ];
    depexts = with pkgs; [ (pkgs.linux-headers or null) ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "v0.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/core_kernel/archive/v0.13.1.tar.gz";
      sha256 = "055jsshmsh3ifw4xp66m50lvi2g3s7pyhjnj7bx0a6hvrwvyr79f";
    };
    opam = "${repo}/packages/core_kernel/core_kernel.v0.13.1/opam";
    depends = with self; [ base base_bigstring base_quickcheck bin_prot dune
                           fieldslib jane-street-headers jst-config ocaml
                           ppx_assert ppx_base ppx_hash ppx_inline_test
                           ppx_jane ppx_sexp_conv ppx_sexp_message sexplib
                           splittable_random stdio time_now typerep
                           variantslib ];
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
  faraday-async = {
    name = "faraday-async";
    version = "0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/faraday/archive/0.7.1.tar.gz";
      sha256 = "1qayh9vba6xw2x2zpgzldbjmjsadp8fnkf24k62fyg651sf8066m";
    };
    opam = "${repo}/packages/faraday-async/faraday-async.0.7.1/opam";
    depends = with self; [ async dune faraday ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fieldslib = {
    name = "fieldslib";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/fieldslib-v0.13.0.tar.gz";
      sha256 = "07bpb1bi5rlim7lfkfd5m2k7n222grslbzh9hjpy7dhq7nm8fy0p";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.v0.13.0/opam";
    depends = with self; [ base dune ocaml ];
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
  httpaf-async = {
    name = "httpaf-async";
    version = "0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/httpaf/archive/0.7.1.tar.gz";
      sha256 = "19baxlf0kmhc5dnpz9962wp41yxj0gsi6893pqqkkc54wbs9fbpa";
    };
    opam = "${repo}/packages/httpaf-async/httpaf-async.0.7.1/opam";
    depends = with self; [ async dune faraday-async httpaf ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  httpaf_caged = {
    name = "httpaf_caged";
    version = "1.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/thedufer/httpaf_caged/releases/download/1.0.1/httpaf_caged-1.0.1.tbz";
      sha256 = "f3f36a664cebaa727325ef20c3ec10653fd36a48717f54c587e3e4149c853f3e";
    };
    opam = "${repo}/packages/httpaf_caged/httpaf_caged.1.0.1/opam";
    depends = with self; [ angstrom async core dune httpaf-async ppx_jane uri ];
    buildDepends = with self; [ dune ];
  };
  jane-street-headers = {
    name = "jane-street-headers";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/jane-street-headers-v0.13.0.tar.gz";
      sha256 = "1b2yjwr31qyhs9sv29a5jkrsiqxm8nzm9474qpnnd5lzb7cdccds";
    };
    opam = "${repo}/packages/jane-street-headers/jane-street-headers.v0.13.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  jst-config = {
    name = "jst-config";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/jst-config-v0.13.0.tar.gz";
      sha256 = "0f50pbj3aka0x65gv3fv9silm8p4fnj0k8yxm97318gq82s1ggbn";
    };
    opam = "${repo}/packages/jst-config/jst-config.v0.13.0/opam";
    depends = with self; [ base dune dune-configurator ocaml ppx_assert stdio ];
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
  octavius = {
    name = "octavius";
    version = "1.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-doc/octavius/archive/v1.2.2.tar.gz";
      sha256 = "1bg0fcm7haqxvx5wx2cci0mbbq0gf1vw9fa4kkd6jsriw1611jga";
    };
    opam = "${repo}/packages/octavius/octavius.1.2.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ppx_assert = {
    name = "ppx_assert";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_assert-v0.13.0.tar.gz";
      sha256 = "13xhq75bfj23acvx74dg21vq8vgkqaxlamz4k07v8z5jjdkspafj";
    };
    opam = "${repo}/packages/ppx_assert/ppx_assert.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_cold ppx_compare ppx_here
                           ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_base = {
    name = "ppx_base";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_base-v0.13.0.tar.gz";
      sha256 = "0yx71ncj1r2ip71r57y5qsjir9qf2rnaqd8ixlxsxf5s3w3s4jk4";
    };
    opam = "${repo}/packages/ppx_base/ppx_base.v0.13.0/opam";
    depends = with self; [ dune ocaml ppx_cold ppx_compare ppx_enumerate
                           ppx_hash ppx_js_style ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bench = {
    name = "ppx_bench";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_bench-v0.13.0.tar.gz";
      sha256 = "0jwqsw62rwb75mdnlahd3iknxvb6hfr5jh90917595c5j8g8advg";
    };
    opam = "${repo}/packages/ppx_bench/ppx_bench.v0.13.0/opam";
    depends = with self; [ dune ocaml ppx_inline_test ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bin_prot = {
    name = "ppx_bin_prot";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_bin_prot-v0.13.0.tar.gz";
      sha256 = "02ak0zb2sh3v34v855vg8cxyvkxsi22b2yzb02p43mzrq6ig2w6i";
    };
    opam = "${repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.13.0/opam";
    depends = with self; [ base bin_prot dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cold = {
    name = "ppx_cold";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_cold-v0.13.0.tar.gz";
      sha256 = "1jh2c7s1bxy8r9xa81bvchnfbmnc5r7kdclv8314sbqg6wspd0ni";
    };
    opam = "${repo}/packages/ppx_cold/ppx_cold.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_compare = {
    name = "ppx_compare";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_compare-v0.13.0.tar.gz";
      sha256 = "1h25qw93a4xhqi0cs8axivnimcprdkkw46cix09aldbfi6fw955j";
    };
    opam = "${repo}/packages/ppx_compare/ppx_compare.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_custom_printf = {
    name = "ppx_custom_printf";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_custom_printf-v0.13.0.tar.gz";
      sha256 = "17rn0qkh7hhz3s57ya4dbc4m64cb1w2lg3vqi87kf8c0vzq0jnq6";
    };
    opam = "${repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_sexp_conv ppxlib ];
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
  ppx_enumerate = {
    name = "ppx_enumerate";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_enumerate-v0.13.0.tar.gz";
      sha256 = "0ks1vqp6bpq5ad0fqrkhjy4fqj69dh4hv63vs7dk7sq5jf0kr7a4";
    };
    opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_expect = {
    name = "ppx_expect";
    version = "v0.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_expect/archive/v0.13.1.tar.gz";
      sha256 = "1q923yiqzs9zfrmc69d94hkjywi9zmvp2iych7jivwnfglfmf6ad";
    };
    opam = "${repo}/packages/ppx_expect/ppx_expect.v0.13.1/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_compare
                           ppx_custom_printf ppx_fields_conv ppx_here
                           ppx_inline_test ppx_sexp_conv ppx_variants_conv
                           ppxlib re stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fail = {
    name = "ppx_fail";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_fail-v0.13.0.tar.gz";
      sha256 = "0vmsyv0x734sn6dvsq1cappiyjwp9cwa3s85w3mcdpnwyp8g3xf6";
    };
    opam = "${repo}/packages/ppx_fail/ppx_fail.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fields_conv = {
    name = "ppx_fields_conv";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_fields_conv-v0.13.0.tar.gz";
      sha256 = "03j9vmbs60ivga1w2qcnjn2d149yzkns2q341ni3qqa570lcwzsj";
    };
    opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.13.0/opam";
    depends = with self; [ base dune fieldslib ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_hash = {
    name = "ppx_hash";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_hash-v0.13.0.tar.gz";
      sha256 = "164j6y77984wcl2vswvgz5cyk9fxc33f96ysw1hmd2x12rfrm490";
    };
    opam = "${repo}/packages/ppx_hash/ppx_hash.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_here = {
    name = "ppx_here";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_here-v0.13.0.tar.gz";
      sha256 = "003l1ljzqcp5958fs8sd6r24r6b9s4mgxkfl5292c2nkmi2kg258";
    };
    opam = "${repo}/packages/ppx_here/ppx_here.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_inline_test = {
    name = "ppx_inline_test";
    version = "v0.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_inline_test/releases/download/v0.13.1/ppx_inline_test-v0.13.1.tbz";
      sha256 = "e75c9df9b33e20655fd2f728df5e332794bdd9a2f5a62fc08e44fb6ca1beda6c";
    };
    opam = "${repo}/packages/ppx_inline_test/ppx_inline_test.v0.13.1/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_jane = {
    name = "ppx_jane";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_jane-v0.13.0.tar.gz";
      sha256 = "0j6fl4x8nka5h9kb70jsvwkg5x15slpbwdw57mjx026p0nm2yn9k";
    };
    opam = "${repo}/packages/ppx_jane/ppx_jane.v0.13.0/opam";
    depends = with self; [ base_quickcheck dune ocaml ppx_assert ppx_base
                           ppx_bench ppx_bin_prot ppx_custom_printf
                           ppx_expect ppx_fail ppx_fields_conv ppx_here
                           ppx_inline_test ppx_let ppx_module_timer
                           ppx_optcomp ppx_optional ppx_pipebang
                           ppx_sexp_message ppx_sexp_value ppx_stable
                           ppx_typerep_conv ppx_variants_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_js_style = {
    name = "ppx_js_style";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_js_style-v0.13.0.tar.gz";
      sha256 = "0fh112ir9sc3zgs0hvwcd3rx33xvl8cxabkzbxc9qphz1i4afwl4";
    };
    opam = "${repo}/packages/ppx_js_style/ppx_js_style.v0.13.0/opam";
    depends = with self; [ base dune ocaml octavius ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_let = {
    name = "ppx_let";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_let-v0.13.0.tar.gz";
      sha256 = "03i52nff0c441ng7bv3w457jj1gk7q2478zx8vbhrpdag607x9v3";
    };
    opam = "${repo}/packages/ppx_let/ppx_let.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_module_timer = {
    name = "ppx_module_timer";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_module_timer-v0.13.0.tar.gz";
      sha256 = "1smwp4pajh9mgz6dqmr2b7w54f1lsrks9bq4azsv5h7hw3vqv4s9";
    };
    opam = "${repo}/packages/ppx_module_timer/ppx_module_timer.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optcomp = {
    name = "ppx_optcomp";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_optcomp-v0.13.0.tar.gz";
      sha256 = "02paivbgpxz4asl8kcm15hkz53ha7jd9f4mc0c97j8lkz460zrm0";
    };
    opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optional = {
    name = "ppx_optional";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_optional-v0.13.0.tar.gz";
      sha256 = "1axc3i7brjainh63l94qnwinf8bg32a7njqwkf73s154y41gifbq";
    };
    opam = "${repo}/packages/ppx_optional/ppx_optional.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pipebang = {
    name = "ppx_pipebang";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_pipebang-v0.13.0.tar.gz";
      sha256 = "1rgl4wa1dkqdb2qvd64xf7zngdrl9fgizac82qswc17lzhymw9l5";
    };
    opam = "${repo}/packages/ppx_pipebang/ppx_pipebang.v0.13.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
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
  ppx_sexp_message = {
    name = "ppx_sexp_message";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_sexp_message-v0.13.0.tar.gz";
      sha256 = "1pkh6njzj5q7wjf7zcivkyzsp6l179wmj7bvylhsa8h1kxw2flnz";
    };
    opam = "${repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_value = {
    name = "ppx_sexp_value";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_sexp_value-v0.13.0.tar.gz";
      sha256 = "04li9rkqb3nl6iiiw14vcgzhcgya033vyhn72kr7pdvi9js2wp2v";
    };
    opam = "${repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_stable = {
    name = "ppx_stable";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_stable-v0.13.0.tar.gz";
      sha256 = "0iw3w5fwsw6832ii7bhzah2iqbyvccjfa11rsd71x0rqpcv5agg6";
    };
    opam = "${repo}/packages/ppx_stable/ppx_stable.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_typerep_conv = {
    name = "ppx_typerep_conv";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_typerep_conv-v0.13.0.tar.gz";
      sha256 = "1chd982ybk2rxygnkmwkxfc24grgnhwca50arq9kh0pl0csggk09";
    };
    opam = "${repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib typerep ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_variants_conv = {
    name = "ppx_variants_conv";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/ppx_variants_conv-v0.13.0.tar.gz";
      sha256 = "084qqrphwdlvgvygq1h8z0agbs2w7ws46z2im2l2zi09wd9bnd3y";
    };
    opam = "${repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppxlib variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.13.0/ppxlib-0.13.0.tbz";
      sha256 = "81e1f3d308500e0e7f6108d5b0dda2b879640a5c21ef3dc4a9bd90381cee39d9";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.13.0/opam";
    depends = with self; [ base dune ocaml ocaml-compiler-libs
                           ocaml-migrate-parsetree ppx_derivers stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  protocol_version_header = {
    name = "protocol_version_header";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/protocol_version_header-v0.13.0.tar.gz";
      sha256 = "0vf831wjwswfah2andli1aqlj31xmd3lg1m9d404nvimz3hmdx7k";
    };
    opam = "${repo}/packages/protocol_version_header/protocol_version_header.v0.13.0/opam";
    depends = with self; [ core_kernel dune ocaml ppx_jane ];
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
  spawn = {
    name = "spawn";
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/spawn/archive/v0.15.1.tar.gz";
      sha256 = "9afdee314fab6c3fcd689ab6eb5608d6b78078e6dede3953a47debde06c19d50";
    };
    opam = "${repo}/packages/spawn/spawn.v0.15.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  splittable_random = {
    name = "splittable_random";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/splittable_random-v0.13.0.tar.gz";
      sha256 = "0mpjp455qzfy82r0q2y4ibw8v1yqxknhz3yf121clxafyjfqmdcc";
    };
    opam = "${repo}/packages/splittable_random/splittable_random.v0.13.0/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_bench
                           ppx_inline_test ppx_sexp_message ];
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
  textutils = {
    name = "textutils";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/textutils-v0.13.0.tar.gz";
      sha256 = "0h3vwlhg15dsjqsnpznzy7fz60qwgqlfd5n970xfzym9mvvw27z6";
    };
    opam = "${repo}/packages/textutils/textutils.v0.13.0/opam";
    depends = with self; [ core dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  time_now = {
    name = "time_now";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/time_now-v0.13.0.tar.gz";
      sha256 = "09754pam6xs7wh7v0gqv7g3pi67py7va6ly38mpl5yf1i90qhmpa";
    };
    opam = "${repo}/packages/time_now/time_now.v0.13.0/opam";
    depends = with self; [ base dune jane-street-headers jst-config ocaml
                           ppx_base ppx_optcomp ];
    buildDepends = with self; [ dune ocaml ];
  };
  typerep = {
    name = "typerep";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/typerep-v0.13.0.tar.gz";
      sha256 = "0m4v409hf9xgr2nzn2kh2bzw55fw7ghjni60wk0rqaqnyfi991xz";
    };
    opam = "${repo}/packages/typerep/typerep.v0.13.0/opam";
    depends = with self; [ base dune ocaml ];
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
  variantslib = {
    name = "variantslib";
    version = "v0.13.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.13/files/variantslib-v0.13.0.tar.gz";
      sha256 = "1d4q4awxa5gyy26d9mh45083av3xgdpzvfiyad13r31r4l2r5gvf";
    };
    opam = "${repo}/packages/variantslib/variantslib.v0.13.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
