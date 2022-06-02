{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base = {
    name = "base";
    version = "v0.9.4";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base/archive/v0.9.4.tar.gz";
      sha256 = "099jm6jwz53ccgm37q6nzic014bi1sm2qx0k3lxlm1kb0j7a874l";
    };
    opam = "${repo}/packages/base/base.v0.9.4/opam";
    depends = with self; [ jbuilder ocaml sexplib
                           (self.base-native-int63 or null) ];
    buildDepends = with self; [ ocaml ];
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  base-num = {
    name = "base-num";
    version = "base";
    opam = "${repo}/packages/base-num/base-num.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-base64/releases/download/v2.3.0/base64-v2.3.0.tbz";
      sha256 = "17dy2mgd8qbjlf0mzxbf0cg2gwy7w2lfxanvpg1s17jxssy1ghks";
    };
    opam = "${repo}/packages/base64/base64.2.3.0/opam";
    depends = with self; [ base-bytes dune ];
    buildDepends = with self; [ dune ];
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
  camlp4 = {
    name = "camlp4";
    version = "4.05+1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/camlp4/archive/4.05+1.tar.gz";
      sha256 = "0awfgvymp1xycg4ab6674qg59ipy5cqyy840w55qb961lp3va6cq";
    };
    opam = "${repo}/packages/camlp4/camlp4.4.05+1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
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
  cohttp = {
    name = "cohttp";
    version = "0.22.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/archive/v0.22.0.tar.gz";
      sha256 = "0y3n9v5q5756wx3bcc9bdxsji4dpbblsb11ipyszxsacnm8khskh";
    };
    opam = "${repo}/packages/cohttp/cohttp.0.22.0/opam";
    depends = with self; [ base-bytes base64 conduit fieldslib fmt logs
                           magic-mime ocaml ppx_deriving ppx_fields_conv
                           ppx_sexp_conv re sexplib stringext uri
                           (self.async or null) (self.js_of_ocaml or null)
                           (self.lwt or null) ];
    buildDepends = with self; [ cmdliner ocaml ocamlbuild ocamlfind ];
  };
  conduit = {
    name = "conduit";
    version = "0.15.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/archive/v0.15.4.tar.gz";
      sha256 = "1mxjqggdgq1i6fg9dmw3gk83038h2qd0a9ll487qwksb0g6y262w";
    };
    opam = "${repo}/packages/conduit/conduit.0.15.4/opam";
    depends = with self; [ ipaddr logs ocaml ppx_deriving ppx_optcomp
                           ppx_sexp_conv result sexplib stringext uri
                           (self.async or null) (self.async_ssl or null)
                           (self.launchd or null) (self.lwt or null)
                           (self.lwt_ssl or null) (self.mirage-dns or null)
                           (self.mirage-flow-lwt or null)
                           (self.mirage-types-lwt or null) (self.ssl or null)
                           (self.tls or null) (self.vchan or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ppx_driver ];
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
  cppo_ocamlbuild = {
    name = "cppo_ocamlbuild";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo_ocamlbuild/cppo_ocamlbuild.1.6.9/opam";
    depends = with self; [ dune ocaml ocamlbuild ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlbuild ocamlfind ];
  };
  dune = {
    name = "dune";
    version = "1.11.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.11.4/dune-build-info-1.11.4.tbz";
      sha256 = "77cb5f483221b266ded2b85fc84173ae0089a25134a086be922e82c131456ce6";
    };
    opam = "${repo}/packages/dune/dune.1.11.4/opam";
    depends = with self; [ base-threads base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "1.0.0";
    opam = "${repo}/packages/dune-configurator/dune-configurator.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
  };
  easy-format = {
    name = "easy-format";
    version = "1.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mjambon/easy-format/releases/download/1.3.2/easy-format-1.3.2.tbz";
      sha256 = "3440c2b882d537ae5e9011eb06abb53f5667e651ea4bb3b460ea8230fa8c1926";
    };
    opam = "${repo}/packages/easy-format/easy-format.1.3.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fieldslib = {
    name = "fieldslib";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/fieldslib-v0.9.0.tar.gz";
      sha256 = "11982y0vwmlpq5ba4jxqjv59v4bgakn3bf5493xm51bq6qr2lqiy";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.v0.9.0/opam";
    depends = with self; [ base jbuilder ocaml ocaml-migrate-parsetree
                           ppx_driver ];
    buildDepends = with self; [ ocaml ];
  };
  fmt = {
    name = "fmt";
    version = "0.8.9";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fmt/releases/fmt-0.8.9.tbz";
      sha256 = "0gkkkj4x678vxdda4xaw2dd44qjacavsvn5nx8gydfwah6pjbkxk";
    };
    opam = "${repo}/packages/fmt/fmt.0.8.9/opam";
    depends = with self; [ ocaml seq stdlib-shims (self.base-unix or null)
                           (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  ipaddr = {
    name = "ipaddr";
    version = "2.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-ipaddr/releases/download/2.9.0/ipaddr-2.9.0.tbz";
      sha256 = "1jamvfark2dvgpljlcm92gjhiwjj8h17k0f7b337r4djn2i9yph4";
    };
    opam = "${repo}/packages/ipaddr/ipaddr.2.9.0/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ppx_sexp_conv
                           sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  jbuilder = {
    name = "jbuilder";
    version = "transition";
    opam = "${repo}/packages/jbuilder/jbuilder.transition/opam";
    depends = with self; [ dune ocaml ];
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
    version = "3.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/3.0.0.tar.gz";
      sha256 = "0i3x7mg4pjpjik627vqzl4k6d4v4f9gf1xlky2083m7x0sxm85pw";
    };
    opam = "${repo}/packages/lwt/lwt.3.0.0/opam";
    depends = with self; [ base-no-ppx ocaml result
                           (self.base-threads or null)
                           (self.base-unix or null) (self.camlp4 or null)
                           (self.conf-libev or null) ];
    buildDepends = with self; [ cppo cppo_ocamlbuild ocaml ocamlbuild
                                ocamlfind (self.base-no-ppx or null)
                                (self.ppx_tools or null) ];
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
  num = {
    name = "num";
    version = "0";
    opam = "${repo}/packages/num/num.0/opam";
    depends = with self; [ base-num ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.05.0";
    opam = "${repo}/packages/ocaml/ocaml.4.05.0/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.05.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.05.0.tar.gz";
      sha256 = "0gzav1y7636w857p6ywzj80nv5n30v5wzbyqfc25h30257vadn75";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.05.0/opam";
  };
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ocaml-compiler-libs-v0.9.0.tar.gz";
      sha256 = "0ipi56vg227924ahi9vv926jn16br9zfipm6a3xd4xrl5pxkvzaz";
    };
    opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.9.0/opam";
    depends = with self; [ jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
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
  ppx_ast = {
    name = "ppx_ast";
    version = "v0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_ast/archive/v0.9.1.tar.gz";
      sha256 = "1j0l2dih3ddhhnhb8f25ym5hrsd2l97im1w6k47fnvi2hd1qrq32";
    };
    opam = "${repo}/packages/ppx_ast/ppx_ast.v0.9.1/opam";
    depends = with self; [ jbuilder ocaml ocaml-compiler-libs
                           ocaml-migrate-parsetree ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_core = {
    name = "ppx_core";
    version = "v0.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_core/archive/v0.9.3.tar.gz";
      sha256 = "02l47gdd7n7a87vixdhn6szr5l27zkgz58sd1c1fn5537gx5mbpb";
    };
    opam = "${repo}/packages/ppx_core/ppx_core.v0.9.3/opam";
    depends = with self; [ base jbuilder ocaml ocaml-compiler-libs ppx_ast
                           ppx_traverse_builtins stdio ];
    buildDepends = with self; [ ocaml ];
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
    version = "4.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/archive/v4.2.1.tar.gz";
      sha256 = "16ri15vvf1k0sf8rdcpzccmrm9r7nj1a6gp629gvh6v42gk073vk";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.4.2.1/opam";
    depends = with self; [ ocaml ocaml-migrate-parsetree ppx_derivers
                           ppx_tools result ];
    buildDepends = with self; [ cppo cppo_ocamlbuild ocaml ocamlbuild
                                ocamlfind ];
  };
  ppx_driver = {
    name = "ppx_driver";
    version = "v0.9.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_driver/archive/v0.9.2.tar.gz";
      sha256 = "0w0rs5bjbqhimdysbf3p21v22fmc01r89l30d5w5nycnnk98ggi2";
    };
    opam = "${repo}/packages/ppx_driver/ppx_driver.v0.9.2/opam";
    depends = with self; [ jbuilder ocaml ocaml-migrate-parsetree ocamlbuild
                           ppx_core ppx_optcomp ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  ppx_fields_conv = {
    name = "ppx_fields_conv";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ppx_fields_conv-v0.9.0.tar.gz";
      sha256 = "0icddl80rvrnj5k5npv5xywp4cfgqvxbpsnward14s0bjyd9drqk";
    };
    opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.9.0/opam";
    depends = with self; [ fieldslib jbuilder ocaml ocaml-migrate-parsetree
                           ppx_core ppx_driver ppx_metaquot ppx_type_conv ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_metaquot = {
    name = "ppx_metaquot";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ppx_metaquot-v0.9.0.tar.gz";
      sha256 = "1716vrrmgq7pphgmbmb1mksvw7kvvd9m5rkk5baj0hw334pkpsq0";
    };
    opam = "${repo}/packages/ppx_metaquot/ppx_metaquot.v0.9.0/opam";
    depends = with self; [ jbuilder ocaml ocaml-migrate-parsetree ppx_core
                           ppx_driver ppx_traverse_builtins ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_optcomp = {
    name = "ppx_optcomp";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ppx_optcomp-v0.9.0.tar.gz";
      sha256 = "1chkbbryz4fgc55d3lzv2y640cxzy7ymwmib8dgpqcwcqib0k2ad";
    };
    opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.9.0/opam";
    depends = with self; [ jbuilder ocaml ppx_core ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ppx_sexp_conv-v0.9.0.tar.gz";
      sha256 = "1rq86758fs982h55hj6nh2ph55a7rlkzsxvl136y7gqwcrw2rmzn";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.9.0/opam";
    depends = with self; [ jbuilder ocaml ocaml-migrate-parsetree ppx_core
                           ppx_driver ppx_metaquot ppx_type_conv sexplib ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_tools = {
    name = "ppx_tools";
    version = "5.0+4.05.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools/archive/5.0+4.05.0.tar.gz";
      sha256 = "1dv3llvmxw1adphfqkw0l74b11p1ca9g207z5i0pmmwgz7i0a7h3";
    };
    opam = "${repo}/packages/ppx_tools/ppx_tools.5.0+4.05.0/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ppx_traverse_builtins = {
    name = "ppx_traverse_builtins";
    version = "v0.9.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.9/files/ppx_traverse_builtins-v0.9.0.tar.gz";
      sha256 = "0zmf9kybll0xn8dsj10v260l0zwjyykimqml9rl7xqyjyl1rmnx6";
    };
    opam = "${repo}/packages/ppx_traverse_builtins/ppx_traverse_builtins.v0.9.0/opam";
    depends = with self; [ jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  ppx_type_conv = {
    name = "ppx_type_conv";
    version = "v0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_type_conv/archive/v0.9.1.tar.gz";
      sha256 = "0fcf4br1jg5bag8ijq0y47jb3qc6fqi6rmvz1320r61h5sa2mmla";
    };
    opam = "${repo}/packages/ppx_type_conv/ppx_type_conv.v0.9.1/opam";
    depends = with self; [ jbuilder ocaml ocaml-migrate-parsetree ppx_core
                           ppx_derivers ppx_driver ppx_metaquot ];
    buildDepends = with self; [ ocaml ];
  };
  re = {
    name = "re";
    version = "1.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-re/releases/download/1.9.0/re-1.9.0.tbz";
      sha256 = "1gas4ky49zgxph3870nffzkr6y41kkpqp4nj38pz1gh49zcf12aj";
    };
    opam = "${repo}/packages/re/re.1.9.0/opam";
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
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/seq/archive/0.2.2.tar.gz";
      sha512 = "cab0eb4cb6d9788b7cbd7acbefefc15689d706c97ff7f75dd97faf3c21e466af4d0ff110541a24729db587e7172b1a30a3c2967e17ec2e49cbd923360052c07c";
    };
    opam = "${repo}/packages/seq/seq.0.2.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib = {
    name = "sexplib";
    version = "v0.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/sexplib/archive/v0.9.3.tar.gz";
      sha256 = "021nbnw1plbcv9zwaq2bqrm514hif5mv6sskj3393mnms1haw093";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.9.3/opam";
    depends = with self; [ jbuilder num ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  slacko = {
    name = "slacko";
    version = "0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Leonidas-from-XIV/slacko/releases/download/0.9.1/slacko-0.9.1.tar.gz";
      sha256 = "1wj53zbcjwq1cxlj6zvm06xr9cchfjy8yg9i7sg92sl02h6wxk8i";
    };
    opam = "${repo}/packages/slacko/slacko.0.9.1/opam";
    depends = with self; [ camlp4 cmdliner cohttp lwt ocaml ocamlfind ssl
                           yojson ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ssl = {
    name = "ssl";
    version = "0.5.9";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ssl/archive/0.5.9.tar.gz";
      sha512 = "6826e5a6ab9f51013e8d097900f443d091e085e3d2d232a315a0e3a90ca334c9b9779d20dcae267f9ed961bc4a08fcb80372e669389c59a22d5c7706d37fcd5f";
    };
    opam = "${repo}/packages/ssl/ssl.0.5.9/opam";
    depends = with self; [ base-unix conf-libssl dune dune-configurator ocaml ];
    buildDepends = with self; [ dune dune-configurator ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/stdio/archive/v0.9.1.tar.gz";
      sha256 = "0d4i7v57bn186dldwxx6jcrwsljw43idkb81w7jlvpfiki3gpsa5";
    };
    opam = "${repo}/packages/stdio/stdio.v0.9.1/opam";
    depends = with self; [ base jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
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
    version = "1.9.7";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/releases/download/v1.9.7/uri-1.9.7.tbz";
      sha256 = "1a42nvc1f3fkda4ma1sl07w7nn12yh0a4bnvn0bk7q1j8aj6max7";
    };
    opam = "${repo}/packages/uri/uri.1.9.7/opam";
    depends = with self; [ jbuilder ocaml ocaml-migrate-parsetree
                           ppx_sexp_conv re sexplib stringext ];
    buildDepends = with self; [ ocaml ];
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
