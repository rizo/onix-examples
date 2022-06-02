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
  cohttp-async = {
    name = "cohttp-async";
    version = "5.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/releases/download/v5.0.0/cohttp-5.0.0.tbz";
      sha256 = "fd6ff4b86c818355d61b3a08628596dbf517d6a7da6e8edec481bb0653ca5a05";
    };
    opam = "${repo}/packages/cohttp-async/cohttp-async.5.0.0/opam";
    depends = with self; [ async async_kernel async_unix base cohttp
                           conduit-async core_unix dune fmt ipaddr logs
                           magic-mime ocaml ppx_sexp_conv sexplib0 uri
                           uri-sexp ];
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
  conduit-async = {
    name = "conduit-async";
    version = "5.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/releases/download/v5.1.0/conduit-5.1.0.tbz";
      sha256 = "e51c8c3e879cbbe9e09989b00595093832dc86642088072e03e5a59a2a2391cd";
    };
    opam = "${repo}/packages/conduit-async/conduit-async.5.1.0/opam";
    depends = with self; [ async conduit core dune ipaddr ipaddr-sexp ocaml
                           ppx_here ppx_sexp_conv sexplib uri
                           (self.async_ssl or null) ];
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
  core_unix = {
    name = "core_unix";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/core_unix/archive/v0.14.0.tar.gz";
      sha512 = "d020db759cde35c0e9d9919dee2c0ea5bb5b7a5ee75515be922d816f28eb9f74dba37e6e424a636e362eab5120b2c1e672f4e5ba798f2dac7974c0e135f80faf";
    };
    opam = "${repo}/packages/core_unix/core_unix.v0.14.0/opam";
    depends = with self; [ core dune ocaml ];
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
  ethernet = {
    name = "ethernet";
    version = "2.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ethernet/releases/download/v2.2.1/ethernet-2.2.1.tbz";
      sha256 = "57d99f643d9b7974fb4ddd62d9c393c4184cc333d7120d1cec79ba7b315609f6";
    };
    opam = "${repo}/packages/ethernet/ethernet.2.2.1/opam";
    depends = with self; [ cstruct dune logs lwt macaddr mirage-net
                           mirage-profile mirage-protocols ocaml ppx_cstruct ];
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
  frenetic = {
    name = "frenetic";
    version = "5.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/frenetic-lang/frenetic/archive/5.0.5.tar.gz";
      sha512 = "80140900e7009ccab14b25e244fe7edab87d858676f8a4b3799b4fea16825013cf68363fe5faec71dd54ba825bb4ea2f812c2c666390948ab217ffa75d9cbd29";
    };
    opam = "${repo}/packages/frenetic/frenetic.5.0.5/opam";
    depends = with self; [ async base64 cohttp cohttp-async core cstruct
                           cstruct-sexp dune ipaddr menhir mparser mparser-re
                           ocaml ocamlgraph open ppx_cstruct ppx_deriving
                           ppx_jane sedlex sexplib tcpip yojson ];
    buildDepends = with self; [ dune ocaml ];
  };
  gen = {
    name = "gen";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/gen/archive/v1.0.tar.gz";
      sha512 = "fb4ec2ab35a1aba0dcc8439b11f14a0a785d939f661f505aec88a6f2ca6ca87e14ddfda860d9c180b215190b76690de87040c144582f069224f7e58d37ef48a0";
    };
    opam = "${repo}/packages/gen/gen.1.0/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml seq ];
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
  jbuilder = {
    name = "jbuilder";
    version = "1.0+beta20.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.0%2Bbeta20.2/jbuilder-1.0+beta20.2.tbz";
      sha256 = "1516rq0x0481bfg9436k1c74346y8nw45shizsnkwylfdj9p8p65";
    };
    opam = "${repo}/packages/jbuilder/jbuilder.1.0+beta20.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
    version = "7.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-protocols/releases/download/v7.0.0/mirage-protocols-v7.0.0.tbz";
      sha256 = "5659c450015b05b97448f1ee394858e383d62e26ffd88fd4fd0c5c4cd376c0f0";
    };
    opam = "${repo}/packages/mirage-protocols/mirage-protocols.7.0.0/opam";
    depends = with self; [ cstruct dune duration fmt ipaddr lwt macaddr
                           mirage-flow ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-stack/releases/download/v3.0.0/mirage-stack-v3.0.0.tbz";
      sha256 = "d222aa0aadbb7287decd8429be01573d876202d8d1399a9fc5e9f8226252fd77";
    };
    opam = "${repo}/packages/mirage-stack/mirage-stack.3.0.0/opam";
    depends = with self; [ dune fmt lwt mirage-protocols ocaml ];
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
  mparser = {
    name = "mparser";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/murmour/mparser/archive/1.3.tar.gz";
      sha256 = "1n6hychv1sbhcxyrxhdra9xvygiya70py6rhhppmqhr33v8kfwf1";
    };
    opam = "${repo}/packages/mparser/mparser.1.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mparser-re = {
    name = "mparser-re";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/murmour/mparser/archive/1.3.tar.gz";
      sha256 = "1n6hychv1sbhcxyrxhdra9xvygiya70py6rhhppmqhr33v8kfwf1";
    };
    opam = "${repo}/packages/mparser-re/mparser-re.1.3/opam";
    depends = with self; [ dune mparser ocaml re ];
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
  open = {
    name = "open";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/smolkaj/ocaml-open/archive/v0.2.1.tar.gz";
      sha256 = "1ix8nwwxvih257ig3inkzbws9prif0ysfbzcvmhk2an9fwcvi1c4";
    };
    opam = "${repo}/packages/open/open.0.2.1/opam";
    depends = with self; [ jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
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
  sedlex = {
    name = "sedlex";
    version = "2.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/sedlex/archive/v2.5.tar.gz";
      sha512 = "5c511a89e43999b34e50cc820a4ac71ecd0315ef144da2af1653077d7497b2ce3658898b723a7c558693766e6bc57369349cdf78c4a4b962a23d4528161b78ef";
    };
    opam = "${repo}/packages/sedlex/sedlex.2.5/opam";
    depends = with self; [ dune gen ocaml ppxlib uchar ];
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
    version = "6.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mirage-tcpip/releases/download/v6.4.0/tcpip-v6.4.0.tbz";
      sha256 = "6e32bf540d291e9b7325cb3dd00df2f695533e009c46ea534d5518b9492c7348";
    };
    opam = "${repo}/packages/tcpip/tcpip.6.4.0/opam";
    depends = with self; [ cstruct cstruct-lwt dune duration ethernet fmt
                           ipaddr logs lru lwt lwt-dllist macaddr
                           macaddr-cstruct metrics mirage-clock mirage-net
                           mirage-profile mirage-protocols mirage-random
                           mirage-stack mirage-time ocaml ppx_cstruct
                           randomconv (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
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
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/variantslib-v0.14.0.tar.gz";
      sha256 = "11zp27gh282dx9ifbhcp6i7fkc97fvk8amaj58mf1g1hwklc0lm3";
    };
    opam = "${repo}/packages/variantslib/variantslib.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
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
