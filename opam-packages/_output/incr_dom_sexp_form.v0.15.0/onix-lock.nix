{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  abstract_algebra = {
    name = "abstract_algebra";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/abstract_algebra-v0.15.0.tar.gz";
      sha256 = "59bcb3c852d33111adfb177070e2353ad08ea67f9c92b8dcf217cfb40c908961";
    };
    opam = "${repo}/packages/abstract_algebra/abstract_algebra.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
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
  async_js = {
    name = "async_js";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/async_js-v0.15.0.tar.gz";
      sha256 = "00c87a78c03fc4482b65717a89adf6214ef67dfa75e7c16994ab795cc6f118fc";
    };
    opam = "${repo}/packages/async_js/async_js.v0.15.0/opam";
    depends = with self; [ async_kernel async_rpc_kernel dune js_of_ocaml
                           js_of_ocaml-ppx ocaml ppx_jane uri uri-sexp ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_kernel = {
    name = "async_kernel";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/async_kernel-v0.15.0.tar.gz";
      sha256 = "30753e014bb0b127ee59f10b1073b8ae476468fb2f07dc8c99dbe2ef312fc696";
    };
    opam = "${repo}/packages/async_kernel/async_kernel.v0.15.0/opam";
    depends = with self; [ core core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  async_rpc_kernel = {
    name = "async_rpc_kernel";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/async_rpc_kernel-v0.15.0.tar.gz";
      sha256 = "a791e99ccc8205ed34c7eda94ad522eb14fe33802df3acf4f0ce6316be4b581d";
    };
    opam = "${repo}/packages/async_rpc_kernel/async_rpc_kernel.v0.15.0/opam";
    depends = with self; [ async_kernel core dune ocaml ppx_jane
                           protocol_version_header ];
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
  base_bigstring = {
    name = "base_bigstring";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/base_bigstring-v0.15.0.tar.gz";
      sha256 = "ff75f1748baf83b0244aeba4e1bfff7f2da3f3ab5a992bb8a21ab832cea1d56b";
    };
    opam = "${repo}/packages/base_bigstring/base_bigstring.v0.15.0/opam";
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
    opam = "${repo}/packages/base_quickcheck/base_quickcheck.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                           ppx_sexp_message ppx_sexp_value ppxlib
                           splittable_random ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/bin_prot-v0.15.0.tar.gz";
      sha256 = "7a4ba0daeacfb87e9cb7e8f49afac43a9bbb64dee4801fd789f1f188059d3690";
    };
    opam = "${repo}/packages/bin_prot/bin_prot.v0.15.0/opam";
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
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  core = {
    name = "core";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core-v0.15.0.tar.gz";
      sha256 = "3a656f2b8605dd052da6459ad8dace3263d21efe15ef2b3bd36aaa8f8ce85e1f";
    };
    opam = "${repo}/packages/core/core.v0.15.0/opam";
    depends = with self; [ base base_bigstring base_quickcheck bin_prot dune
                           fieldslib jane-street-headers jst-config ocaml
                           ppx_assert ppx_base ppx_hash ppx_inline_test
                           ppx_jane ppx_sexp_conv ppx_sexp_message sexplib
                           splittable_random stdio time_now typerep
                           variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/core_kernel-v0.15.0.tar.gz";
      sha256 = "34a0288f16027c6b90e4ad16cb5cc677d7063d310faf918748ce70f1745116c0";
    };
    opam = "${repo}/packages/core_kernel/core_kernel.v0.15.0/opam";
    depends = with self; [ base base-threads core dune int_repr ocaml
                           ppx_jane ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/fieldslib-v0.15.0.tar.gz";
      sha256 = "050afd7327840c63483616f9781c6ec127e0e48d270f237f89f56f5290fb7120";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  gen_js_api = {
    name = "gen_js_api";
    version = "1.0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/LexiFi/gen_js_api/archive/v1.0.9.tar.gz";
      sha512 = "ed066c0e18d3a5412536f7ded18bb2056c1e9c1a3d1dbd4e914baa730fc7bbc286d93ffe2db2bb4db2e8961e79a4e1fceee9bb301e7984179e3442b762bd01f5";
    };
    opam = "${repo}/packages/gen_js_api/gen_js_api.1.0.9/opam";
    depends = with self; [ dune ocaml ojs ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  incr_dom = {
    name = "incr_dom";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incr_dom-v0.15.0.tar.gz";
      sha256 = "e79e64efca79b5def4e636b84225710f982bf5f5dda31fcab8e6b4bfab583d10";
    };
    opam = "${repo}/packages/incr_dom/incr_dom.v0.15.0/opam";
    depends = with self; [ async_js async_kernel core dune incr_map
                           incr_select incremental js_of_ocaml
                           js_of_ocaml-ppx ocaml ppx_jane virtual_dom ];
    buildDepends = with self; [ dune ocaml ];
  };
  incr_dom_interactive = {
    name = "incr_dom_interactive";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incr_dom_interactive-v0.15.0.tar.gz";
      sha256 = "d2a539b528004eee6b424df33ee36abfc4454eb9e9ce8b5688de68c2629b9e80";
    };
    opam = "${repo}/packages/incr_dom_interactive/incr_dom_interactive.v0.15.0/opam";
    depends = with self; [ async_js async_kernel dune incr_dom incr_map
                           incr_select incremental js_of_ocaml
                           js_of_ocaml-ppx ocaml ppx_jane splay_tree
                           virtual_dom ];
    buildDepends = with self; [ dune ocaml ];
  };
  incr_dom_sexp_form = {
    name = "incr_dom_sexp_form";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incr_dom_sexp_form-v0.15.0.tar.gz";
      sha256 = "737423594c4b6f3efd9bc71d3d0c07da8cd40f62eb1ae53df2ceab3e2eab6e33";
    };
    opam = "${repo}/packages/incr_dom_sexp_form/incr_dom_sexp_form.v0.15.0/opam";
    depends = with self; [ dune incr_dom incr_dom_interactive incr_map
                           incr_select incremental js_of_ocaml
                           js_of_ocaml-ppx ocaml ppx_jane splay_tree
                           virtual_dom ];
    buildDepends = with self; [ dune ocaml ];
  };
  incr_map = {
    name = "incr_map";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incr_map-v0.15.0.tar.gz";
      sha256 = "c28546d5ec4eb224d7ab513f700cef8e3f3ed18991164685792bc2510f874158";
    };
    opam = "${repo}/packages/incr_map/incr_map.v0.15.0/opam";
    depends = with self; [ abstract_algebra core dune incremental ocaml
                           ppx_jane ppx_pattern_bind ];
    buildDepends = with self; [ dune ocaml ];
  };
  incr_select = {
    name = "incr_select";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incr_select-v0.15.0.tar.gz";
      sha256 = "d49a3b150941ae9457e8bf2f42bdab23cb49d51d124ead9926d65716a8220fe5";
    };
    opam = "${repo}/packages/incr_select/incr_select.v0.15.0/opam";
    depends = with self; [ core dune incremental ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  incremental = {
    name = "incremental";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/incremental-v0.15.0.tar.gz";
      sha256 = "8dc7e111fe3e52068b60300d72a744a63b40a1df79c67b835b364bdceb321b36";
    };
    opam = "${repo}/packages/incremental/incremental.v0.15.0/opam";
    depends = with self; [ core core_kernel dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  int_repr = {
    name = "int_repr";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/int_repr-v0.15.0.tar.gz";
      sha256 = "5d357b58914bcaa183432f2cfafc726ecccaa36f42cab982ab32e8b1c1ed6719";
    };
    opam = "${repo}/packages/int_repr/int_repr.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  jane-street-headers = {
    name = "jane-street-headers";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/jane-street-headers-v0.15.0.tar.gz";
      sha256 = "34e4a37b26e3827da129c0ac7add26e8c09a21a704d55ca05211a8de17c847e4";
    };
    opam = "${repo}/packages/jane-street-headers/jane-street-headers.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml = {
    name = "js_of_ocaml";
    version = "3.11.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/3.11.0/js_of_ocaml-3.11.0.tbz";
      sha256 = "158dafe7271ac79157981d1c3f5f177ec78a0099c38f861ae14e7ac06bd29c3a";
    };
    opam = "${repo}/packages/js_of_ocaml/js_of_ocaml.3.11.0/opam";
    depends = with self; [ dune js_of_ocaml-compiler ocaml ppxlib uchar ];
    buildDepends = with self; [ dune ocaml ];
  };
  js_of_ocaml-compiler = {
    name = "js_of_ocaml-compiler";
    version = "3.11.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/3.11.0/js_of_ocaml-3.11.0.tbz";
      sha256 = "158dafe7271ac79157981d1c3f5f177ec78a0099c38f861ae14e7ac06bd29c3a";
    };
    opam = "${repo}/packages/js_of_ocaml-compiler/js_of_ocaml-compiler.3.11.0/opam";
    depends = with self; [ cmdliner dune menhir menhirLib menhirSdk ocaml
                           ppxlib yojson (self.ocamlfind or null) ];
    buildDepends = with self; [ dune ocaml (self.ocamlfind or null) ];
  };
  js_of_ocaml-ppx = {
    name = "js_of_ocaml-ppx";
    version = "3.11.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/js_of_ocaml/releases/download/3.11.0/js_of_ocaml-3.11.0.tbz";
      sha256 = "158dafe7271ac79157981d1c3f5f177ec78a0099c38f861ae14e7ac06bd29c3a";
    };
    opam = "${repo}/packages/js_of_ocaml-ppx/js_of_ocaml-ppx.3.11.0/opam";
    depends = with self; [ dune js_of_ocaml ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  jst-config = {
    name = "jst-config";
    version = "v0.15.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/jst-config/archive/refs/tags/v0.15.1.tar.gz";
      sha256 = "7053e5bbb3016b760c1e8f419814ad059625105db25dafa020676fcfc0f3b41b";
    };
    opam = "${repo}/packages/jst-config/jst-config.v0.15.1/opam";
    depends = with self; [ base dune dune-configurator ocaml ppx_assert ];
    buildDepends = with self; [ dune ocaml ];
  };
  lambdasoup = {
    name = "lambdasoup";
    version = "0.7.3";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/lambdasoup/archive/0.7.3.tar.gz";
      sha256 = "1phndl9w3b790gf3cqh589h3zhwy12xwrh5x7km96k90ba35ahih";
    };
    opam = "${repo}/packages/lambdasoup/lambdasoup.0.7.3/opam";
    depends = with self; [ dune markup ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  markup = {
    name = "markup";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/markup.ml/archive/1.0.3.tar.gz";
      sha256 = "1dbfh21x7gc3irz0xywg4cjb2lid2j3qflp2wrx7vhxgl03gs9lm";
    };
    opam = "${repo}/packages/markup/markup.1.0.3/opam";
    depends = with self; [ dune ocaml uchar uutf ];
    buildDepends = with self; [ dune ocaml ];
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
    version = "4.13.1";
    opam = "${repo}/packages/ocaml/ocaml.4.13.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.13.1.tar.gz";
      sha256 = "194c7988cc1fd1c64f53f32f2f7551e5309e44d914d6efc7e2e4d002296aeac4";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.13.1/opam";
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
  ojs = {
    name = "ojs";
    version = "1.0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/LexiFi/gen_js_api/archive/v1.0.9.tar.gz";
      sha512 = "ed066c0e18d3a5412536f7ded18bb2056c1e9c1a3d1dbd4e914baa730fc7bbc286d93ffe2db2bb4db2e8961e79a4e1fceee9bb301e7984179e3442b762bd01f5";
    };
    opam = "${repo}/packages/ojs/ojs.1.0.9/opam";
    depends = with self; [ dune ocaml ];
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
  ppx_assert = {
    name = "ppx_assert";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_assert-v0.15.0.tar.gz";
      sha256 = "4e5f653f84232569cd7d8e04d09ebba28b395e4be037c0b1e122e82cbe0f5967";
    };
    opam = "${repo}/packages/ppx_assert/ppx_assert.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_base/ppx_base.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_bench/ppx_bench.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_cold/ppx_cold.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_compare/ppx_compare.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.15.0/opam";
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
  ppx_disable_unused_warnings = {
    name = "ppx_disable_unused_warnings";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_disable_unused_warnings-v0.15.0.tar.gz";
      sha256 = "aeab318cb7541f9b22da50268492ff9d161ece9003ed5b1977917da346f6eebe";
    };
    opam = "${repo}/packages/ppx_disable_unused_warnings/ppx_disable_unused_warnings.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_expect/ppx_expect.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_hash/ppx_hash.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_here/ppx_here.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_ignore_instrumentation/ppx_ignore_instrumentation.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_inline_test/ppx_inline_test.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_jane = {
    name = "ppx_jane";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_jane-v0.15.0.tar.gz";
      sha256 = "d0fa44d2279adfd24223c7e7a6d2a9be9fccc737810bf53876214181858e8146";
    };
    opam = "${repo}/packages/ppx_jane/ppx_jane.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_let/ppx_let.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_log/ppx_log.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_module_timer/ppx_module_timer.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_optional/ppx_optional.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pattern_bind = {
    name = "ppx_pattern_bind";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_pattern_bind-v0.15.0.tar.gz";
      sha256 = "15e24a49e914f64e8edda235894c995ed83b1734521e46d314b8761a492035b0";
    };
    opam = "${repo}/packages/ppx_pattern_bind/ppx_pattern_bind.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_let ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pipebang = {
    name = "ppx_pipebang";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_pipebang-v0.15.0.tar.gz";
      sha256 = "1e56554d86ab61830492cc922b02dab0110cdd7584e90ffef4832dc6335620a8";
    };
    opam = "${repo}/packages/ppx_pipebang/ppx_pipebang.v0.15.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
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
  ppx_sexp_message = {
    name = "ppx_sexp_message";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_sexp_message-v0.15.0.tar.gz";
      sha256 = "0d94785f80e45b97269e2e34b762a0909eba6a46e55c383cf8c1bdb8ffffdaba";
    };
    opam = "${repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_stable/ppx_stable.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_string/ppx_string.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.15.0/opam";
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
    opam = "${repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppxlib variantslib ];
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
  protocol_version_header = {
    name = "protocol_version_header";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/protocol_version_header-v0.15.0.tar.gz";
      sha256 = "d0c4e467bacc4bfb71dbd9575828634b222d4579b6ecc86b978f34dca1d1f3c7";
    };
    opam = "${repo}/packages/protocol_version_header/protocol_version_header.v0.15.0/opam";
    depends = with self; [ core dune ocaml ppx_jane ];
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
  splay_tree = {
    name = "splay_tree";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/splay_tree-v0.15.0.tar.gz";
      sha256 = "0fa105bb09ea3eae1ec7d81e1326608a502c1bc3af0670afb564a9897efcd2e2";
    };
    opam = "${repo}/packages/splay_tree/splay_tree.v0.15.0/opam";
    depends = with self; [ core dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  splittable_random = {
    name = "splittable_random";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/splittable_random-v0.15.0.tar.gz";
      sha256 = "9ff8e6c85fb5c39f45ca8bcf499a8bc3f419a18e759091d3a8d82b2aabeedb00";
    };
    opam = "${repo}/packages/splittable_random/splittable_random.v0.15.0/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_bench
                           ppx_inline_test ppx_sexp_message ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/stdio-v0.15.0.tar.gz";
      sha256 = "c37292921dc6a88425f773eba6bdbeac1dedacd1f55917fa4bcd9c4b25795e4b";
    };
    opam = "${repo}/packages/stdio/stdio.v0.15.0/opam";
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
  time_now = {
    name = "time_now";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/time_now-v0.15.0.tar.gz";
      sha256 = "13b353305da2d349fce3bb47be24307a7163318872238eda0a91f15a8a0bcba8";
    };
    opam = "${repo}/packages/time_now/time_now.v0.15.0/opam";
    depends = with self; [ base dune jane-street-headers jst-config ocaml
                           ppx_base ppx_optcomp ];
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
  typerep = {
    name = "typerep";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/typerep-v0.15.0.tar.gz";
      sha256 = "26c8d37db41440a417593fcb389aaebafdf2e33e62bd762e1f148875a7a3183e";
    };
    opam = "${repo}/packages/typerep/typerep.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  variantslib = {
    name = "variantslib";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/variantslib-v0.15.0.tar.gz";
      sha256 = "e5d87438e439877d8580ed209b17c0ba5e36e1405fcf9ddd972f1bbf48d7ba89";
    };
    opam = "${repo}/packages/variantslib/variantslib.v0.15.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  virtual_dom = {
    name = "virtual_dom";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/virtual_dom-v0.15.0.tar.gz";
      sha256 = "c32029907c0667369a500091533e2121c050e2392cfae7f07f2289e87c797390";
    };
    opam = "${repo}/packages/virtual_dom/virtual_dom.v0.15.0/opam";
    depends = with self; [ base core dune gen_js_api js_of_ocaml
                           js_of_ocaml-ppx lambdasoup ocaml ppx_jane tyxml ];
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
}
