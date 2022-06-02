{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  async = {
    name = "async";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/async-v0.14.0.tar.gz";
      sha256 = "0r6w2df5wn4xjhkhscnxrriwg19qwlxcss3srj4j5fg33jqbgwkl";
    };
    opam = "${repo}/packages/async/async.v0.14.0/opam";
    depends = with self; [ async_kernel async_rpc_kernel async_unix core
                           core_kernel dune ocaml ppx_jane textutils ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_kernel = {
    name = "async_kernel";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/async_kernel-v0.14.0.tar.gz";
      sha256 = "13k0dsbvw69jl6ckqrvigdvjffcqy778nish3370kl9lkmp0c49m";
    };
    opam = "${repo}/packages/async_kernel/async_kernel.v0.14.0/opam";
    depends = with self; [ core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_rpc_kernel = {
    name = "async_rpc_kernel";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/async_rpc_kernel-v0.14.0.tar.gz";
      sha256 = "1xrrpmhwhav3prr382q088h8sn7dax2s58hkwcv4ilcwx4zbmyk8";
    };
    opam = "${repo}/packages/async_rpc_kernel/async_rpc_kernel.v0.14.0/opam";
    depends = with self; [ async_kernel core_kernel dune ocaml ppx_jane
                           protocol_version_header ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_unix = {
    name = "async_unix";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/async_unix-v0.14.0.tar.gz";
      sha256 = "1f9jv97xs3lgw4n7p7b95nixldh47gpbh6shcnsf0ccjxgnwx5xf";
    };
    opam = "${repo}/packages/async_unix/async_unix.v0.14.0/opam";
    depends = with self; [ async_kernel core core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
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
  base_bigstring = {
    name = "base_bigstring";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/base_bigstring-v0.14.0.tar.gz";
      sha256 = "1fhldk58w56ixkin763kpic512xvkkf9b4mrnjfsbm8in75kzndq";
    };
    opam = "${repo}/packages/base_bigstring/base_bigstring.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  base_quickcheck = {
    name = "base_quickcheck";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base_quickcheck/archive/v0.14.1.tar.gz";
      sha256 = "0n5h0ysn593awvz4crkvzf5r800hd1c55bx9mm9vbqs906zii6mn";
    };
    opam = "${repo}/packages/base_quickcheck/base_quickcheck.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                           ppx_sexp_message ppx_sexp_value ppxlib
                           splittable_random ];
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
  bin_prot = {
    name = "bin_prot";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/bin_prot-v0.14.0.tar.gz";
      sha256 = "1f1ng6cixi3ci0nb765yfzqk9b3s752hy1i3702kh59gni1psycp";
    };
    opam = "${repo}/packages/bin_prot/bin_prot.v0.14.0/opam";
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
    opam = "${repo}/packages/biniou/biniou.1.2.1/opam";
    depends = with self; [ dune easy-format ocaml ];
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
  core = {
    name = "core";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/core/archive/v0.14.1.tar.gz";
      sha256 = "1862zsk85i00vsv2chgb156b1chp8f7p508hsz6sadjx6h98q5cc";
    };
    opam = "${repo}/packages/core/core.v0.14.1/opam";
    depends = with self; [ base-threads core_kernel dune jst-config ocaml
                           ppx_jane sexplib spawn timezone ];
    buildDepends = with self; [ dune ocaml ];
    depexts = with pkgs; [ (pkgs.linux-headers or null) ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/core_kernel/archive/v0.14.2.tar.gz";
      sha256 = "0jyf08i9wzg3yf32f158i6n9gm751bk8zj7xqx79jnnkchwkbxb6";
    };
    opam = "${repo}/packages/core_kernel/core_kernel.v0.14.2/opam";
    depends = with self; [ base base_bigstring base_quickcheck bin_prot dune
                           fieldslib jane-street-headers jst-config ocaml
                           ppx_assert ppx_base ppx_hash ppx_inline_test
                           ppx_jane ppx_optcomp ppx_sexp_conv
                           ppx_sexp_message sexplib splittable_random stdio
                           time_now typerep variantslib ];
    buildDepends = with self; [ dune ocaml ];
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
  fieldslib = {
    name = "fieldslib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/fieldslib-v0.14.0.tar.gz";
      sha256 = "10n5y376fb5jgqk9h8vq158rm1b36h9lzh6p11q33h6xgvb1v6n3";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  jane-street-headers = {
    name = "jane-street-headers";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/jane-street-headers-v0.14.0.tar.gz";
      sha256 = "028yxb4h3iy025iy89v8653m5brh7flrjshghs4x99pd690pmfs7";
    };
    opam = "${repo}/packages/jane-street-headers/jane-street-headers.v0.14.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml = {
    name = "js_of_ocaml";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/4.0.0/js_of_ocaml-4.0.0.tbz";
      sha256 = "df02f819e5b2f48234af2b3e3e7c9781afa8212f8bece7ebcfbd8358b394495e";
    };
    opam = "${repo}/packages/js_of_ocaml/js_of_ocaml.4.0.0/opam";
    depends = with self; [ dune js_of_ocaml-compiler ocaml ppxlib uchar ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml-compiler = {
    name = "js_of_ocaml-compiler";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/4.0.0/js_of_ocaml-4.0.0.tbz";
      sha256 = "df02f819e5b2f48234af2b3e3e7c9781afa8212f8bece7ebcfbd8358b394495e";
    };
    opam = "${repo}/packages/js_of_ocaml-compiler/js_of_ocaml-compiler.4.0.0/opam";
    depends = with self; [ cmdliner dune menhir menhirLib menhirSdk ocaml
                           ppxlib yojson (self.ocamlfind or null) ];
    buildDepends = with self; [ dune ocaml (self.ocamlfind or null) ];
  };
  js_of_ocaml-lwt = {
    name = "js_of_ocaml-lwt";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/4.0.0/js_of_ocaml-4.0.0.tbz";
      sha256 = "df02f819e5b2f48234af2b3e3e7c9781afa8212f8bece7ebcfbd8358b394495e";
    };
    opam = "${repo}/packages/js_of_ocaml-lwt/js_of_ocaml-lwt.4.0.0/opam";
    depends = with self; [ dune js_of_ocaml js_of_ocaml-ppx lwt ocaml
                           (self.graphics or null) (self.lwt_log or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml-ppx = {
    name = "js_of_ocaml-ppx";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/4.0.0/js_of_ocaml-4.0.0.tbz";
      sha256 = "df02f819e5b2f48234af2b3e3e7c9781afa8212f8bece7ebcfbd8358b394495e";
    };
    opam = "${repo}/packages/js_of_ocaml-ppx/js_of_ocaml-ppx.4.0.0/opam";
    depends = with self; [ dune js_of_ocaml ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml-webidl = {
    name = "js_of_ocaml-webidl";
    version = "0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/tari3x/webgpu/releases/download/0.2/js_of_ocaml-webgpu-0.2.tbz";
      sha256 = "3b1f3ba2420ad3b35abf04b2d99d807868a3aafc8b437c2ef4589fe8ddf76cde";
    };
    opam = "${repo}/packages/js_of_ocaml-webidl/js_of_ocaml-webidl.0.2/opam";
    depends = with self; [ async core dune js_of_ocaml js_of_ocaml-lwt
                           js_of_ocaml-ppx ocaml ppx_deriving ppx_jane webidl ];
    buildDepends = with self; [ dune menhir ocaml ];
  };
  jst-config = {
    name = "jst-config";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/jst-config/archive/refs/tags/v0.14.1.tar.gz";
      sha256 = "0wdjs0lvc5wbggh27cf490jarfibrrb5xxsrigg41m32kjkbijm4";
    };
    opam = "${repo}/packages/jst-config/jst-config.v0.14.1/opam";
    depends = with self; [ base dune dune-configurator ocaml ppx_assert stdio ];
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
  menhir = {
    name = "menhir";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhir/menhir.20211128/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20211128/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20211128/opam";
    depends = with self; [ dune ocaml ];
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
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/parsexp/archive/refs/tags/v0.14.2.tar.gz";
      sha256 = "f6e17e4e08dcdce08a6372485a381dcdb3fda0f71b4506d7be982b87b5a1f230";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.14.2/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_assert = {
    name = "ppx_assert";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_assert-v0.14.0.tar.gz";
      sha256 = "1l2rr4jz2q5b35ryn2z146z7m9v6k8krp5gpn8ilib66mnz5zx15";
    };
    opam = "${repo}/packages/ppx_assert/ppx_assert.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_cold ppx_compare ppx_here
                           ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_base = {
    name = "ppx_base";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_base-v0.14.0.tar.gz";
      sha256 = "0b7a3fmi90jk8paz0g36yzaq670fbnrbi1j8r5ibh9wbcfli7ji6";
    };
    opam = "${repo}/packages/ppx_base/ppx_base.v0.14.0/opam";
    depends = with self; [ dune ocaml ppx_cold ppx_compare ppx_enumerate
                           ppx_hash ppx_js_style ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bench = {
    name = "ppx_bench";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_bench/archive/v0.14.1.tar.gz";
      sha256 = "1jr3cf4zsk894x64c8ir9ap9l412q35b2605pr7flrlxbm4vkf3f";
    };
    opam = "${repo}/packages/ppx_bench/ppx_bench.v0.14.1/opam";
    depends = with self; [ dune ocaml ppx_inline_test ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bin_prot = {
    name = "ppx_bin_prot";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_bin_prot-v0.14.0.tar.gz";
      sha256 = "0wa2jmvm2k88b37pbcafy1mdf5iaip0yxg5dw774sbh28nm08m2s";
    };
    opam = "${repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.14.0/opam";
    depends = with self; [ base bin_prot dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cold = {
    name = "ppx_cold";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_cold-v0.14.0.tar.gz";
      sha256 = "1madfzhpir9amnxmg530n70vll0jrl59vyp71miji73i6b9sy6n2";
    };
    opam = "${repo}/packages/ppx_cold/ppx_cold.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_compare = {
    name = "ppx_compare";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_compare-v0.14.0.tar.gz";
      sha256 = "0mqxa2s194nif7x4fjn1p5gd9i3bakr8nv27gf8x1g5nmi8q9pmp";
    };
    opam = "${repo}/packages/ppx_compare/ppx_compare.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_custom_printf = {
    name = "ppx_custom_printf";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_custom_printf/archive/v0.14.1.tar.gz";
      sha256 = "0kzbckbvhfn3s9an1hq01qd5iac7wgirw182ablpqxc6r3dmijrl";
    };
    opam = "${repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.14.1/opam";
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
  ppx_enumerate = {
    name = "ppx_enumerate";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_enumerate-v0.14.0.tar.gz";
      sha256 = "1ij6sffgqhnjwnj9brhrrw1c6xgxlh0s6r17x1qkgnyrc73gfsz8";
    };
    opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_expect = {
    name = "ppx_expect";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_expect/archive/v0.14.2.tar.gz";
      sha256 = "1gcjlya6knnsrl60sd3vlgp7arj39xm5fjjfk5sick4z66agm2n5";
    };
    opam = "${repo}/packages/ppx_expect/ppx_expect.v0.14.2/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_inline_test ppxlib re
                           stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fields_conv = {
    name = "ppx_fields_conv";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_fields_conv/archive/v0.14.2.tar.gz";
      sha256 = "0r7d51j54r1za6bwqsmhmhhfab8n10zyk5zznhkm91f20dx9ddip";
    };
    opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.14.2/opam";
    depends = with self; [ base dune fieldslib ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fixed_literal = {
    name = "ppx_fixed_literal";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_fixed_literal-v0.14.0.tar.gz";
      sha256 = "0w0a06143mhmczbpr0lfb66r6im7075gck4p0idbcari63sximqj";
    };
    opam = "${repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_hash = {
    name = "ppx_hash";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_hash-v0.14.0.tar.gz";
      sha256 = "0x4wgdvhgd8a49bzari52jpkykxpv6ncgp5ncda3xgg0a9r49s8n";
    };
    opam = "${repo}/packages/ppx_hash/ppx_hash.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_here = {
    name = "ppx_here";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_here-v0.14.0.tar.gz";
      sha256 = "0b444djy68v6ji0ypwv5l02pkl151qzrgg96lyhl8dxfrzvj1zkj";
    };
    opam = "${repo}/packages/ppx_here/ppx_here.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_inline_test = {
    name = "ppx_inline_test";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_inline_test/archive/v0.14.1.tar.gz";
      sha256 = "0qzvm8rg07annl8zpqlhzx1z8ahrrf02r1brd43ykqas5sww3rfp";
    };
    opam = "${repo}/packages/ppx_inline_test/ppx_inline_test.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_jane = {
    name = "ppx_jane";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_jane-v0.14.0.tar.gz";
      sha256 = "18js98xdqf8d54sjn1gccjkwbv2p56qy7bhvjgk94pr3fipfz0v7";
    };
    opam = "${repo}/packages/ppx_jane/ppx_jane.v0.14.0/opam";
    depends = with self; [ base_quickcheck dune ocaml ppx_assert ppx_base
                           ppx_bench ppx_bin_prot ppx_custom_printf
                           ppx_expect ppx_fields_conv ppx_fixed_literal
                           ppx_here ppx_inline_test ppx_let ppx_module_timer
                           ppx_optcomp ppx_optional ppx_pipebang
                           ppx_sexp_message ppx_sexp_value ppx_stable
                           ppx_string ppx_typerep_conv ppx_variants_conv
                           ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_js_style = {
    name = "ppx_js_style";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_js_style/archive/refs/tags/v0.14.1.tar.gz";
      sha256 = "1nq4rj659f34dc28pj7ir2szqbpky4nzs9qfw0am6sf36jwispiw";
    };
    opam = "${repo}/packages/ppx_js_style/ppx_js_style.v0.14.1/opam";
    depends = with self; [ base dune ocaml octavius ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_let = {
    name = "ppx_let";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_let-v0.14.0.tar.gz";
      sha256 = "1qcrnd86pbr1di5m6z4ps4p15qawwa02jxwz3xfd82hdbjmdwf1s";
    };
    opam = "${repo}/packages/ppx_let/ppx_let.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_module_timer = {
    name = "ppx_module_timer";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_module_timer-v0.14.0.tar.gz";
      sha256 = "04a7vzk4s3jn6wj94q0hn8kd9vxlzkpcq5ifpvz3bdfgmypjks5z";
    };
    opam = "${repo}/packages/ppx_module_timer/ppx_module_timer.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optcomp = {
    name = "ppx_optcomp";
    version = "v0.14.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_optcomp/archive/v0.14.3.tar.gz";
      sha256 = "0bxzh0pm3zdiadrd37jjzp7zm2qn28mx25ahk0shgfb73vya809n";
    };
    opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.14.3/opam";
    depends = with self; [ base dune ocaml ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optional = {
    name = "ppx_optional";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_optional-v0.14.0.tar.gz";
      sha256 = "1hh6ivlp1qpvyn8l0vhrahkkcp3scf7km254sgplprmk10wnyidz";
    };
    opam = "${repo}/packages/ppx_optional/ppx_optional.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pipebang = {
    name = "ppx_pipebang";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_pipebang-v0.14.0.tar.gz";
      sha256 = "19afbbvy72i1347prvkpy3ms75xnk7kl2hn83h40p6yh27100hky";
    };
    opam = "${repo}/packages/ppx_pipebang/ppx_pipebang.v0.14.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
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
  ppx_sexp_message = {
    name = "ppx_sexp_message";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_message/archive/v0.14.1.tar.gz";
      sha256 = "06d1cx8nh6chgx09lqjgsagc02lfsvv18fydrviqjvydx52m2qjf";
    };
    opam = "${repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_value = {
    name = "ppx_sexp_value";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_sexp_value-v0.14.0.tar.gz";
      sha256 = "0yc6i1yx9mb8pwjkswy09aqg5kz1hgrpjyniq2v6whfjvxl1qrkj";
    };
    opam = "${repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_stable = {
    name = "ppx_stable";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_stable/archive/v0.14.1.tar.gz";
      sha256 = "1dw8ilrvi5lssxnbflnzskmyi3k93ij2kbyz49y93agv0b8dsq01";
    };
    opam = "${repo}/packages/ppx_stable/ppx_stable.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_string = {
    name = "ppx_string";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_string/archive/v0.14.1.tar.gz";
      sha256 = "1a8f7bplbxvwm4lh0m57j89jkwkxfm9r5ndcvvlj5v6py8pv69wj";
    };
    opam = "${repo}/packages/ppx_string/ppx_string.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_typerep_conv = {
    name = "ppx_typerep_conv";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_typerep_conv/archive/v0.14.2.tar.gz";
      sha256 = "1g1sb3prscpa7jwnk08f50idcgyiiv0b9amkl0kymj5cghkdqw0n";
    };
    opam = "${repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.14.2/opam";
    depends = with self; [ base dune ocaml ppxlib typerep ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_variants_conv = {
    name = "ppx_variants_conv";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_variants_conv/archive/v0.14.2.tar.gz";
      sha256 = "06d63vi2ijzqa3wqnywwqywldq72karss39zi47d544y10rq4rid";
    };
    opam = "${repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.14.2/opam";
    depends = with self; [ base dune ocaml ppxlib variantslib ];
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
  protocol_version_header = {
    name = "protocol_version_header";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/protocol_version_header-v0.14.0.tar.gz";
      sha256 = "033xdykhlnpywh0bk6z5dzb5s8gf8h694pgdvnr1l50906vr7np8";
    };
    opam = "${repo}/packages/protocol_version_header/protocol_version_header.v0.14.0/opam";
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
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/splittable_random-v0.14.0.tar.gz";
      sha256 = "185rpmdnrzs80br138pnjbx9hfp1046zvj1ap0brq1sxdwzak6lf";
    };
    opam = "${repo}/packages/splittable_random/splittable_random.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_bench
                           ppx_inline_test ppx_sexp_message ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/stdio-v0.14.0.tar.gz";
      sha256 = "1hj5hraprqy2i90a690l11yjszvb99j818q3d684ryx6p2lddk0l";
    };
    opam = "${repo}/packages/stdio/stdio.v0.14.0/opam";
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
  textutils = {
    name = "textutils";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/textutils-v0.14.0.tar.gz";
      sha256 = "1ss956gfk2pch3nsqis4x7z79j2d6q002bf8z8xw9z2r64wzi8hl";
    };
    opam = "${repo}/packages/textutils/textutils.v0.14.0/opam";
    depends = with self; [ core core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  time_now = {
    name = "time_now";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/time_now-v0.14.0.tar.gz";
      sha256 = "0hkn2jw4dz5gflnsblskl5wp6z7zbrahwjmaxmsskfviwjg82cqh";
    };
    opam = "${repo}/packages/time_now/time_now.v0.14.0/opam";
    depends = with self; [ base dune jane-street-headers jst-config ocaml
                           ppx_base ppx_optcomp ];
    buildDepends = with self; [ dune ocaml ];
  };
  timezone = {
    name = "timezone";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/timezone-v0.14.0.tar.gz";
      sha256 = "095xni0szjqqax2r9zh9820l72ixfga2pl0njnarp3795vkw0rdp";
    };
    opam = "${repo}/packages/timezone/timezone.v0.14.0/opam";
    depends = with self; [ core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  typerep = {
    name = "typerep";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/typerep-v0.14.0.tar.gz";
      sha256 = "0rmp5jsjg6sgn5yx0pcvch0phs7nak2fg1d48g5sjcyyyj8n1279";
    };
    opam = "${repo}/packages/typerep/typerep.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  variantslib = {
    name = "variantslib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/variantslib-v0.14.0.tar.gz";
      sha256 = "11zp27gh282dx9ifbhcp6i7fkc97fvk8amaj58mf1g1hwklc0lm3";
    };
    opam = "${repo}/packages/variantslib/variantslib.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  webidl = {
    name = "webidl";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/0zat/webidl/archive/v1.4.zip";
      sha256 = "0nsqs4b0zig8xzwdvgnvpkwapmd17a1w6p56xdinficqw087w11w";
    };
    opam = "${repo}/packages/webidl/webidl.1.4/opam";
    depends = with self; [ ocaml ppx_deriving ];
    buildDepends = with self; [ menhir ocaml ocamlbuild ocamlfind ];
    depexts = with pkgs; [ unzip ];
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
}
