{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  async = {
    name = "async";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/async-112.35.00.tar.gz";
      sha256 = "11ax28b1nmh145f1yvck123sb4cwil0bhc3mag1z21x8pfa8h8lm";
    };
    opam = "${repo}/packages/async/async.112.35.00/opam";
    depends = with self; [ async_extra async_kernel async_unix camlp4 ocaml
                           ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  async_extra = {
    name = "async_extra";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/async_extra-112.35.00.tar.gz";
      sha256 = "0g3kllmcs47d9wsdcyisydrkj9d9hpccpv89zbsh14cgd8y6icrb";
    };
    opam = "${repo}/packages/async_extra/async_extra.112.35.00/opam";
    depends = with self; [ async_kernel async_rpc_kernel async_unix bin_prot
                           camlp4 core fieldslib ocaml ocamlfind pa_ounit
                           pipebang sexplib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  async_kernel = {
    name = "async_kernel";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/async_kernel-112.35.00.tar.gz";
      sha256 = "0j7l8k9gzvg5anj9ak12wh5ggv4irh7g8kybsik6fvcbrb3mkf3b";
    };
    opam = "${repo}/packages/async_kernel/async_kernel.112.35.00/opam";
    depends = with self; [ bin_prot camlp4 core_kernel fieldslib herelib
                           ocaml ocamlfind pa_ounit pa_test sexplib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  async_rpc_kernel = {
    name = "async_rpc_kernel";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/async_rpc_kernel-112.35.00.tar.gz";
      sha256 = "0hmmlj9rcwd5ipm82l3v1z12kh2nw8f1ghr4pc8rlwg6lfdcn90y";
    };
    opam = "${repo}/packages/async_rpc_kernel/async_rpc_kernel.112.35.00/opam";
    depends = with self; [ async_kernel bin_prot camlp4 comparelib
                           core_kernel fieldslib herelib ocaml ocamlfind
                           pa_ounit pa_test sexplib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  async_unix = {
    name = "async_unix";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/async_unix-112.35.00.tar.gz";
      sha256 = "1i03nc0w7zgfxxvaaz0wr727ani7asjkzwhy2knbb9269fckh7hi";
    };
    opam = "${repo}/packages/async_unix/async_unix.112.35.00/opam";
    depends = with self; [ async_kernel bin_prot camlp4 comparelib core
                           fieldslib herelib ocaml ocamlfind pa_ounit pa_test
                           pipebang sexplib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  base-ocamlbuild = {
    name = "base-ocamlbuild";
    version = "base";
    opam = "${repo}/packages/base-ocamlbuild/base-ocamlbuild.base/opam";
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
  bin_prot = {
    name = "bin_prot";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/bin_prot-112.35.00.tar.gz";
      sha256 = "1gxv6ppxsy0fns4p6abh1xfn8alma8dnyf0drkg6k9lgaklk8w79";
    };
    opam = "${repo}/packages/bin_prot/bin_prot.112.35.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  camlp4 = {
    name = "camlp4";
    version = "4.02+7";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/camlp4/archive/4.02+7.tar.gz";
      sha256 = "0x7pi5sgj2ya2mgqk7p4vq3534xdzhzmasp6wmpvv5cmrnfw004s";
    };
    opam = "${repo}/packages/camlp4/camlp4.4.02+7/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ conf-which ocaml ocamlbuild ];
  };
  cohttp = {
    name = "cohttp";
    version = "0.11.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cohttp/archive/v0.11.2.tar.gz";
      sha256 = "1cy075f4pk1mm4wk06rgamv4hicxj5j07wh7s7gkk2b2239yimgg";
    };
    opam = "${repo}/packages/cohttp/cohttp.0.11.2/opam";
    depends = with self; [ conduit fieldslib ocaml ocamlfind ounit re sexplib
                           stringext uri (self.async or null)
                           (self.lwt or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  comparelib = {
    name = "comparelib";
    version = "109.60.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/109.60.00/individual/comparelib-109.60.00.tar.gz";
      sha256 = "0znvyn8vlf7bqy8q8mkpvkmlrjxj68zidxnh3bvr1qniw02znx8h";
    };
    opam = "${repo}/packages/comparelib/comparelib.109.60.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  conduit = {
    name = "conduit";
    version = "0.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-conduit/archive/v0.5.1.tar.gz";
      sha256 = "0ibxi5cxmvq6dfa78ar3xkl3cgv0fsnrdnpc0k3lb0yg4zyqn72v";
    };
    opam = "${repo}/packages/conduit/conduit.0.5.1/opam";
    depends = with self; [ ocaml ocamlfind sexplib type_conv
                           (self.async or null) (self.async_ssl or null)
                           (self.lwt or null) (self.ssl or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  core = {
    name = "core";
    version = "112.35.01";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/core-112.35.01.tar.gz";
      sha256 = "19njha0b3a22div28bi8x45prf1b327p817pd8i3h7b7c336vld0";
    };
    opam = "${repo}/packages/core/core.112.35.01/opam";
    depends = with self; [ bin_prot camlp4 comparelib core_kernel
                           custom_printf enumerate fieldslib herelib ocaml
                           ocamlfind pa_bench pa_ounit pa_structural_sexp
                           pa_test pipebang sexplib variantslib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/core_kernel-112.35.00.tar.gz";
      sha256 = "0qpn1vz2nwdifw06vf0dhla8gw78kghqjmd21wn0qn7s0v5h68vr";
    };
    opam = "${repo}/packages/core_kernel/core_kernel.112.35.00/opam";
    depends = with self; [ bin_prot camlp4 comparelib custom_printf enumerate
                           fieldslib herelib ocaml ocamlfind pa_bench
                           pa_ounit pa_test pipebang sexplib typerep
                           variantslib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  cow = {
    name = "cow";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cow/releases/download/v2.2.0/cow-2.2.0.tbz";
      sha256 = "1ms2dsr2zm2y2ljny4488132n0x1iiav1flall87yzcnxypz8ama";
    };
    opam = "${repo}/packages/cow/cow.2.2.0/opam";
    depends = with self; [ ezjsonm ocaml omd uri xmlm ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  cstruct = {
    name = "cstruct";
    version = "3.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v3.0.2/cstruct-3.0.2.tbz";
      sha256 = "03caxcyzfjmbnnwa15zy9s1ckkl4sc834d1qkgi4jcs3zqchvd8z";
    };
    opam = "${repo}/packages/cstruct/cstruct.3.0.2/opam";
    depends = with self; [ base-bytes jbuilder ocaml ocplib-endian sexplib ];
    buildDepends = with self; [ ocaml ];
  };
  custom_printf = {
    name = "custom_printf";
    version = "112.24.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.24/files/custom_printf-112.24.tar.gz";
      sha256 = "1yd8mk68xn8fl4clhzc5175v2z3nqic97k0jrkxyhlrcx6nazlys";
    };
    opam = "${repo}/packages/custom_printf/custom_printf.112.24.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind pa_ounit sexplib type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
  enumerate = {
    name = "enumerate";
    version = "111.08.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/111.08.00/individual/enumerate-111.08.00.tar.gz";
      sha256 = "0b6mx5p01lcpimvak4wx6aj2119707wsfzd83rwgb91bhpgzh156";
    };
    opam = "${repo}/packages/enumerate/enumerate.111.08.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ezjsonm = {
    name = "ezjsonm";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ezjsonm/releases/download/v1.0.0/ezjsonm-v1.0.0.tbz";
      sha256 = "1ihi80mrmjmp0nplk4mph7h49x5215a192lhc93lvbvppnkrf7n5";
    };
    opam = "${repo}/packages/ezjsonm/ezjsonm.1.0.0/opam";
    depends = with self; [ dune hex jsonm ocaml sexplib ];
    buildDepends = with self; [ dune ocaml ];
  };
  fieldslib = {
    name = "fieldslib";
    version = "109.20.03";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/109.20.00/individual/fieldslib-109.20.03.tar.gz";
      sha256 = "1dkzk0wf26rhvji80dz1r56dp6x9zqrnp87wldd4pj56jli94vir";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.109.20.03/opam";
    depends = with self; [ camlp4 ocaml ocamlfind type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  herelib = {
    name = "herelib";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/herelib-112.35.00.tar.gz";
      sha256 = "03rrlpjmnd8d1rzzmd112355m7a5bwn3vf90xkbc6gkxlad9cxbs";
    };
    opam = "${repo}/packages/herelib/herelib.112.35.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  hex = {
    name = "hex";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-hex/releases/download/v1.3.0/hex-v1.3.0.tbz";
      sha256 = "193567pn58df3b824vmfanncdfgf9cxzl7q3rq39zl9szvzhvkja";
    };
    opam = "${repo}/packages/hex/hex.1.3.0/opam";
    depends = with self; [ cstruct dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  humane-re = {
    name = "humane-re";
    version = "0.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/rgrinberg/humane-re/archive/v0.1.1.tar.gz";
      sha256 = "170ack44skvdz52lmxfwplj3hyd65xiccj95wg7khiw66n0fyblk";
    };
    opam = "${repo}/packages/humane-re/humane-re.0.1.1/opam";
    depends = with self; [ ocaml re ];
    buildDepends = with self; [ oasis ocaml ocamlbuild ocamlfind ];
  };
  jbuilder = {
    name = "jbuilder";
    version = "transition";
    opam = "${repo}/packages/jbuilder/jbuilder.transition/opam";
    depends = with self; [ dune ocaml ];
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
  oasis = {
    name = "oasis";
    version = "0.4.11";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/oasis/oasis/0.4.11/oasis-0.4.11.tar.gz";
      sha256 = "0bn13mzfa98dq3y0jwzzndl55mnywaxv693z6f1rlvpdykp3vdqq";
    };
    opam = "${repo}/packages/oasis/oasis.0.4.11/opam";
    depends = with self; [ base-unix ocaml ocamlbuild
                           (self.benchmark or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ocamlify ocamlmod ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.02.3";
    opam = "${repo}/packages/ocaml/ocaml.4.02.3/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.02.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.02.3.tar.gz";
      sha256 = "0ymy4v7638j0wa13mwba6zq3ggackkyygzb2gy7mk9x7vd72506b";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.02.3/opam";
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0";
    opam = "${repo}/packages/ocamlbuild/ocamlbuild.0/opam";
    depends = with self; [ base-ocamlbuild ocaml ];
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
  ocamlify = {
    name = "ocamlify";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlify/ocamlify/0.0.1/ocamlify-0.0.1.tar.gz";
      sha256 = "1j9nb3vjqbdsx3d6jazixgrh776051zkrc06nsc5q5ilp1jhrwkm";
    };
    opam = "${repo}/packages/ocamlify/ocamlify.0.0.1/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocamlmod = {
    name = "ocamlmod";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlmod/ocamlmod/0.0.9/ocamlmod-0.0.9.tar.gz";
      sha256 = "0cgp9qqrq7ayyhddrmqmq1affvfqcn722qiakjq4dkywvp67h4aa";
    };
    opam = "${repo}/packages/ocamlmod/ocamlmod.0.0.9/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocplib-endian = {
    name = "ocplib-endian";
    version = "1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocplib-endian/archive/1.1.tar.gz";
      sha512 = "39351c666d1394770696fa89ac62f7c137ad1697d99888bfba2cc8de2c61df05dd8b3aa327c117bf38f3e29e081026d2c575c5ad0022bde92b3d43aba577d3f9";
    };
    opam = "${repo}/packages/ocplib-endian/ocplib-endian.1.1/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  omd = {
    name = "omd";
    version = "1.3.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Chris00/omd/releases/download/1.3.1/omd-1.3.1.tar.gz";
      sha256 = "1sgdgzpx96br7npj8mh91cli5mqmzsjpngwm7x4212n3k1d0ivwa";
    };
    opam = "${repo}/packages/omd/omd.1.3.1/opam";
    depends = with self; [ base-bigarray base-bytes ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  opium = {
    name = "opium";
    version = "0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/rgrinberg/opium/archive/v0.9.1.tar.gz";
      sha256 = "10ja943sd1ylq4fi4652hbzpzkniybn0kap2c3yri15ma6rqjnyc";
    };
    opam = "${repo}/packages/opium/opium.0.9.1/opam";
    depends = with self; [ async cohttp core cow fieldslib humane-re oasis
                           ocaml ocamlfind sexplib ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ounit = {
    name = "ounit";
    version = "2.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.2/ounit-v2.2.2.tbz";
      sha256 = "53439ae8958d4016afd596d7afbe0b613163533761253e8c781d7afe3d6b9dc0";
    };
    opam = "${repo}/packages/ounit/ounit.2.2.2/opam";
    depends = with self; [ ounit2 ];
    buildDepends = with self; [ ocamlfind ];
  };
  ounit2 = {
    name = "ounit2";
    version = "2.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.2/ounit-v2.2.2.tbz";
      sha256 = "53439ae8958d4016afd596d7afbe0b613163533761253e8c781d7afe3d6b9dc0";
    };
    opam = "${repo}/packages/ounit2/ounit2.2.2.2/opam";
    depends = with self; [ base-bytes base-unix dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  pa_bench = {
    name = "pa_bench";
    version = "112.06.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.06.00/individual/pa_bench-112.06.00.tar.gz";
      sha256 = "0w08ahfsysb9naz3prnypsqgxkpzs29a2ipxaywsrm6ky4viwh73";
    };
    opam = "${repo}/packages/pa_bench/pa_bench.112.06.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind pa_ounit type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  pa_ounit = {
    name = "pa_ounit";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/pa_ounit-112.35.00.tar.gz";
      sha256 = "14wsp9n4y1pg4kl1h1c3pc50cvjqm7w42ljd15srs404p9m6q0db";
    };
    opam = "${repo}/packages/pa_ounit/pa_ounit.112.35.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind ounit type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  pa_structural_sexp = {
    name = "pa_structural_sexp";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/pa_structural_sexp-112.35.00.tar.gz";
      sha256 = "08878c1w5snmh54xk37vwwz8qc78kiqva8b5p7px3lmgb7fvq9c4";
    };
    opam = "${repo}/packages/pa_structural_sexp/pa_structural_sexp.112.35.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind sexplib type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  pa_test = {
    name = "pa_test";
    version = "112.24.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.24/files/pa_test-112.24.tar.gz";
      sha256 = "1mih7scs2lrv1m1isy79hc7ic0jjjs6i1mq7qnqs9aczpk116gdh";
    };
    opam = "${repo}/packages/pa_test/pa_test.112.24.00/opam";
    depends = with self; [ camlp4 comparelib herelib ocaml ocamlfind sexplib
                           type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  pipebang = {
    name = "pipebang";
    version = "110.01.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/110.01.00/individual/pipebang-110.01.00.tar.gz";
      sha256 = "15lh68w1vvvng9yk82n89xrdx4cd1h3bx5jifw5dyp610yb8v1d8";
    };
    opam = "${repo}/packages/pipebang/pipebang.110.01.00/opam";
    depends = with self; [ camlp4 ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/sexplib-112.35.00.tar.gz";
      sha256 = "1kzjgplnlycgkrhy54gzg2ddrrfz100mbsrj6wnlvzv49rjlm55k";
    };
    opam = "${repo}/packages/sexplib/sexplib.112.35.00/opam";
    depends = with self; [ ocaml ocamlfind (self.camlp4 or null)
                           (self.type_conv or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/topkg/releases/topkg-1.0.0.tbz";
      sha256 = "1df61vw6v5bg2mys045682ggv058yqkqb67w7r2gz85crs04d5fw";
    };
    opam = "${repo}/packages/topkg/topkg.1.0.0/opam";
    depends = with self; [ ocaml ocamlbuild result ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  type_conv = {
    name = "type_conv";
    version = "112.01.02";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.01.00/individual/type_conv-112.01.02.tar.gz";
      sha256 = "141qgyvfn5yqfxaz3sq9x3x5vwmy4hbf9j24j9rr9m528cd28ail";
    };
    opam = "${repo}/packages/type_conv/type_conv.112.01.02/opam";
    depends = with self; [ camlp4 ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  typerep = {
    name = "typerep";
    version = "112.35.00";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/112.35/files/typerep-112.35.00.tar.gz";
      sha256 = "0i614iv6mg3bc4pszry35rlkj81mzhy883cqmsxxh9xy55nnykd1";
    };
    opam = "${repo}/packages/typerep/typerep.112.35.00/opam";
    depends = with self; [ bin_prot camlp4 ocaml ocamlfind sexplib type_conv ];
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
    version = "1.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/archive/v1.9.1.tar.gz";
      sha256 = "00j40g7clnslalvdwz12m3l0bak9n6fi2j3dapmyqrxza0qzbsg7";
    };
    opam = "${repo}/packages/uri/uri.1.9.1/opam";
    depends = with self; [ base-bytes ocaml re sexplib stringext type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  uutf = {
    name = "uutf";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/uutf/releases/uutf-1.0.2.tbz";
      sha256 = "1nx1rly3qj23jzn9yk3x6fwqimcxjd84kv5859vvhdg56psq26p6";
    };
    opam = "${repo}/packages/uutf/uutf.1.0.2/opam";
    depends = with self; [ ocaml uchar (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  variantslib = {
    name = "variantslib";
    version = "109.15.03";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/109.15.00/individual/variantslib-109.15.03.tar.gz";
      sha256 = "0mc0y45p90jd6zm5frbc4yzh7nx96xp6nf260vz8cix59kfxqj59";
    };
    opam = "${repo}/packages/variantslib/variantslib.109.15.03/opam";
    depends = with self; [ camlp4 ocaml ocamlfind type_conv ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  xmlm = {
    name = "xmlm";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/xmlm/releases/xmlm-1.3.0.tbz";
      sha256 = "1rrdxg5kh9zaqmgapy9bhdqyxbbvxxib3bdfg1vhw4rrkp1z0x8n";
    };
    opam = "${repo}/packages/xmlm/xmlm.1.3.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
}
