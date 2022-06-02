{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  csv = {
    name = "csv";
    version = "2.4";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/ocaml-csv/releases/download/2.4/csv-2.4.tbz";
      sha256 = "13fec48177f2658c4c62edf04f5edd055962fbf2abb4c3e372d268dd2ab2a98e";
    };
    opam = "${repo}/packages/csv/csv.2.4/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dataframe = {
    name = "dataframe";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/LaurentMazare/ocaml-dataframe/archive/0.1b.tar.gz";
      sha512 = "4d568304629225424d40bd2c2beff93839dbcdb2bc512d00a1551bbe929c12b5085397b6565a285dd71c4d6c0b8a66efc682a38767f5566f15bdb3f17a7dda8a";
    };
    opam = "${repo}/packages/dataframe/dataframe.0.1/opam";
    depends = with self; [ base csv dune ocaml ocaml-compiler-libs ppx_expect
                           ppx_let stdio ];
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
