{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  alcotest = {
    name = "alcotest";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/alcotest/releases/download/1.5.0/alcotest-js-1.5.0.tbz";
      sha256 = "54281907e02d78995df246dc2e10ed182828294ad2059347a1e3a13354848f6c";
    };
    opam = "${repo}/packages/alcotest/alcotest.1.5.0/opam";
    depends = with self; [ astring cmdliner dune fmt ocaml ocaml-syntax-shims
                           re stdlib-shims uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  alcotest-lwt = {
    name = "alcotest-lwt";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/alcotest/releases/download/1.5.0/alcotest-js-1.5.0.tbz";
      sha256 = "54281907e02d78995df246dc2e10ed182828294ad2059347a1e3a13354848f6c";
    };
    opam = "${repo}/packages/alcotest-lwt/alcotest-lwt.1.5.0/opam";
    depends = with self; [ alcotest dune fmt logs lwt ocaml ];
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
  bigstring = {
    name = "bigstring";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-bigstring/archive/0.3.tar.gz";
      sha512 = "d0c530603e9bb37a704d736137953e4f2a1b1e16517587010f2fb323a5c3e4d887f558775349231ea15a98d3c085ed9daaf0a7603f165cdd0097ff2548ce790a";
    };
    opam = "${repo}/packages/bigstring/bigstring.0.3/opam";
    depends = with self; [ base-bigarray base-bytes dune ocaml ];
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
  bls12-381 = {
    name = "bls12-381";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/2.0.1/ocaml-bls12-381-2.0.1.tar.bz2";
      sha512 = "994ac11cb76b0d83592cfb6b7a6d6f488a5d9c525d9bc1ccd81e797ee56c0e0b9a00d889118b4e5a01282d332d63d94d32ccbb6e063a28c1c53fecbea23dbef6";
    };
    opam = "${repo}/packages/bls12-381/bls12-381.2.0.1/opam";
    depends = with self; [ dune ff-sig ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  bls12-381-unix = {
    name = "bls12-381-unix";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/2.0.1/ocaml-bls12-381-2.0.1.tar.bz2";
      sha512 = "994ac11cb76b0d83592cfb6b7a6d6f488a5d9c525d9bc1ccd81e797ee56c0e0b9a00d889118b4e5a01282d332d63d94d32ccbb6e063a28c1c53fecbea23dbef6";
    };
    opam = "${repo}/packages/bls12-381-unix/bls12-381-unix.2.0.1/opam";
    depends = with self; [ bls12-381 dune hex integers ocaml zarith ];
    buildDepends = with self; [ dune dune-configurator ocaml ];
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
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-libev = {
    name = "conf-libev";
    version = "4+12";
    opam = "${repo}/packages/conf-libev/conf-libev.4-12/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ libev ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
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
  data-encoding = {
    name = "data-encoding";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/data-encoding/-/archive/v0.4/data-encoding-v0.4.tar.gz";
      sha512 = "65e33b1a56e9058a2e9c7f3dc18cb72c21270e0e5b9584fe856285d16e4cb8e98adac826373d4109a5e080486ec31cdd9870b402249ac5d55c7b0de6ffb68b0a";
    };
    opam = "${repo}/packages/data-encoding/data-encoding.0.4/opam";
    depends = with self; [ dune ezjsonm hex json-data-encoding
                           json-data-encoding-bson ocaml zarith ];
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
  ezjsonm = {
    name = "ezjsonm";
    version = "1.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ezjsonm/releases/download/v1.3.0/ezjsonm-1.3.0.tbz";
      sha256 = "08633e0f0e767a8ae81935ca7e74f1693b85a79c4502d568eedff5170f0cd77b";
    };
    opam = "${repo}/packages/ezjsonm/ezjsonm.1.3.0/opam";
    depends = with self; [ dune hex jsonm ocaml sexplib0 uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  ff-sig = {
    name = "ff-sig";
    version = "0.6.2";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-ff/-/archive/0.6.2/ocaml-ff-0.6.2.tar.gz";
      sha512 = "2046126f30704c16bd2dcd735b7eb9b8a6c8751892f895e6c992b0ebb921f7d2c824b9507b74368e3b66b53330dc70a57e70633105b642d021710b34fbc54a5c";
    };
    opam = "${repo}/packages/ff-sig/ff-sig.0.6.2/opam";
    depends = with self; [ dune ocaml zarith ];
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
  hacl-star = {
    name = "hacl-star";
    version = "0.4.5";
    src = pkgs.fetchurl {
      url = "https://github.com/project-everest/hacl-star/releases/download/ocaml-v0.4.5/hacl-star.0.4.5.tar.gz";
      sha256 = "47bf253f804ec369b2fbc76c892ba89275fde17d7444d291d5eb5c179a05e174";
    };
    opam = "${repo}/packages/hacl-star/hacl-star.0.4.5/opam";
    depends = with self; [ dune hacl-star-raw ocaml zarith ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  hacl-star-raw = {
    name = "hacl-star-raw";
    version = "0.4.5";
    src = pkgs.fetchurl {
      url = "https://github.com/project-everest/hacl-star/releases/download/ocaml-v0.4.5/hacl-star.0.4.5.tar.gz";
      sha256 = "47bf253f804ec369b2fbc76c892ba89275fde17d7444d291d5eb5c179a05e174";
    };
    opam = "${repo}/packages/hacl-star-raw/hacl-star-raw.0.4.5/opam";
    depends = with self; [ ctypes ocaml ];
    buildDepends = with self; [ conf-which ocaml ocamlfind ];
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
  json-data-encoding = {
    name = "json-data-encoding";
    version = "0.11";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/json-data-encoding/-/archive/0.11/json-data-encoding-0.11.tar.gz";
      sha512 = "63894b9fa49b450445bbe125f81e0336dd0e59e23e6875cab4344c727ef454ee126b4344815d653332ccca7e8b9e80b0f272e5d407091d0b4f59426dc46a7994";
    };
    opam = "${repo}/packages/json-data-encoding/json-data-encoding.0.11/opam";
    depends = with self; [ dune ocaml uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  json-data-encoding-bson = {
    name = "json-data-encoding-bson";
    version = "0.11";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/json-data-encoding/-/archive/0.11/json-data-encoding-0.11.tar.gz";
      sha512 = "63894b9fa49b450445bbe125f81e0336dd0e59e23e6875cab4344c727ef454ee126b4344815d653332ccca7e8b9e80b0f272e5d407091d0b4f59426dc46a7994";
    };
    opam = "${repo}/packages/json-data-encoding-bson/json-data-encoding-bson.0.11/opam";
    depends = with self; [ dune json-data-encoding ocaml ocplib-endian ];
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
  lwt-canceler = {
    name = "lwt-canceler";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/lwt-canceler/-/archive/v0.3/lwt-canceler-v0.3.tar.gz";
      sha512 = "fc82d131f6b32396da906d88ea5ac21f432e7859577cc078eb48bdb619eceea0f899fb4e6aaf601e428667ab3cd4235ccd8afb4f75b03b3f2fe8c6017aa8a779";
    };
    opam = "${repo}/packages/lwt-canceler/lwt-canceler.0.3/opam";
    depends = with self; [ dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  lwt_log = {
    name = "lwt_log";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/lwt_log/archive/1.1.1.tar.gz";
      sha256 = "0gszc8nvk2hpfq47plb36qahlnyfq28sa9mhicnf6mg5c7n1kyql";
    };
    opam = "${repo}/packages/lwt_log/lwt_log.1.1.1/opam";
    depends = with self; [ dune lwt ];
    buildDepends = with self; [ dune ];
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
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/ppx_enumerate-v0.15.0.tar.gz";
      sha256 = "deb5fb9ca12ade3e4fb8093f1cfdf50a03735b9db19a7535ad534331fb98d09b";
    };
    opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.15.0/opam";
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
  pure-splitmix = {
    name = "pure-splitmix";
    version = "0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/Lysxia/pure-splitmix/archive/0.2.tar.gz";
      sha256 = "0lr1ybyd9r9n68f827d85qrahxw7pk3pvxxv6q61rikpai1ks76y";
    };
    opam = "${repo}/packages/pure-splitmix/pure-splitmix.0.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  qcheck-alcotest = {
    name = "qcheck-alcotest";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck-alcotest/qcheck-alcotest.0.18.1/opam";
    depends = with self; [ alcotest base-bytes base-unix dune ocaml
                           qcheck-core ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-core = {
    name = "qcheck-core";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck-core/qcheck-core.0.18.1/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
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
  resto = {
    name = "resto";
    version = "0.6.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/resto/-/archive/v0.6.1/resto-v0.6.1.tar.gz";
      sha512 = "f362893693e75df8021365a7b3291874ad38f928054e16fc48f9040545d7dcfc60f9c19bd7f00f8e89b3c2c72bea916a425d769b41331da08a222a81968954e9";
    };
    opam = "${repo}/packages/resto/resto.0.6.1/opam";
    depends = with self; [ dune ocaml uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  resto-directory = {
    name = "resto-directory";
    version = "0.6.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/resto/-/archive/v0.6.1/resto-v0.6.1.tar.gz";
      sha512 = "f362893693e75df8021365a7b3291874ad38f928054e16fc48f9040545d7dcfc60f9c19bd7f00f8e89b3c2c72bea916a425d769b41331da08a222a81968954e9";
    };
    opam = "${repo}/packages/resto-directory/resto-directory.0.6.1/opam";
    depends = with self; [ dune lwt ocaml resto ];
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
  ringo = {
    name = "ringo";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/ringo/-/archive/v0.5/ringo-v0.5.tar.gz";
      sha512 = "612838fe7bd2bc31c4cd541ca1821ac2d30520edda5345fcf1d90d687eba8a98103298e05682954c903de015ee4f2905d3e74181932b57c1cfc93a807a8b3b21";
    };
    opam = "${repo}/packages/ringo/ringo.0.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  secp256k1-internal = {
    name = "secp256k1-internal";
    version = "0.3.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/ocaml-secp256k1-internal/-/archive/0.3/ocaml-secp256k1-internal-0.3.tar.bz2";
      sha256 = "cc9c1f7ed70f30c17bddd45b2f95a83ab96d347432930856477709dc67643a63";
    };
    opam = "${repo}/packages/secp256k1-internal/secp256k1-internal.0.3.1/opam";
    depends = with self; [ bigstring conf-pkg-config cstruct dune
                           dune-configurator ocaml ];
    buildDepends = with self; [ conf-gmp dune ocaml ];
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
  tezos-base = {
    name = "tezos-base";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-base/tezos-base.12.3/opam";
    depends = with self; [ bls12-381-unix dune ipaddr ptime tezos-clic
                           tezos-crypto tezos-hacl-glue-unix tezos-micheline ];
    buildDepends = with self; [ dune ];
  };
  tezos-base-test-helpers = {
    name = "tezos-base-test-helpers";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-base-test-helpers/tezos-base-test-helpers.12.3/opam";
    depends = with self; [ alcotest alcotest-lwt dune tezos-base
                           tezos-event-logging-test-helpers ];
    buildDepends = with self; [ dune ];
  };
  tezos-clic = {
    name = "tezos-clic";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-clic/tezos-clic.12.3/opam";
    depends = with self; [ dune tezos-stdlib-unix ];
    buildDepends = with self; [ dune ];
  };
  tezos-crypto = {
    name = "tezos-crypto";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-crypto/tezos-crypto.12.3/opam";
    depends = with self; [ dune ringo secp256k1-internal tezos-hacl-glue
                           tezos-rpc ];
    buildDepends = with self; [ dune ];
  };
  tezos-error-monad = {
    name = "tezos-error-monad";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-error-monad/tezos-error-monad.12.3/opam";
    depends = with self; [ data-encoding dune lwt-canceler
                           tezos-lwt-result-stdlib tezos-stdlib ];
    buildDepends = with self; [ dune ];
  };
  tezos-event-logging = {
    name = "tezos-event-logging";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-event-logging/tezos-event-logging.12.3/opam";
    depends = with self; [ dune lwt_log tezos-error-monad ];
    buildDepends = with self; [ dune ];
  };
  tezos-event-logging-test-helpers = {
    name = "tezos-event-logging-test-helpers";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-event-logging-test-helpers/tezos-event-logging-test-helpers.12.3/opam";
    depends = with self; [ alcotest dune tezos-event-logging
                           tezos-test-helpers ];
    buildDepends = with self; [ dune ];
  };
  tezos-hacl-glue = {
    name = "tezos-hacl-glue";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-hacl-glue/tezos-hacl-glue.12.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-hacl-glue-unix = {
    name = "tezos-hacl-glue-unix";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-hacl-glue-unix/tezos-hacl-glue-unix.12.3/opam";
    depends = with self; [ dune hacl-star tezos-hacl-glue ];
    buildDepends = with self; [ dune ];
  };
  tezos-lwt-result-stdlib = {
    name = "tezos-lwt-result-stdlib";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-lwt-result-stdlib/tezos-lwt-result-stdlib.12.3/opam";
    depends = with self; [ dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-micheline = {
    name = "tezos-micheline";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-micheline/tezos-micheline.12.3/opam";
    depends = with self; [ dune ppx_inline_test tezos-error-monad uutf ];
    buildDepends = with self; [ dune ];
  };
  tezos-rpc = {
    name = "tezos-rpc";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-rpc/tezos-rpc.12.3/opam";
    depends = with self; [ dune resto resto-directory tezos-error-monad ];
    buildDepends = with self; [ dune ];
  };
  tezos-stdlib = {
    name = "tezos-stdlib";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-stdlib/tezos-stdlib.12.3/opam";
    depends = with self; [ dune hex lwt ocaml ppx_inline_test zarith
                           zarith_stubs_js ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-stdlib-unix = {
    name = "tezos-stdlib-unix";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-stdlib-unix/tezos-stdlib-unix.12.3/opam";
    depends = with self; [ base-unix conf-libev dune ezjsonm ipaddr mtime
                           ptime re tezos-event-logging ];
    buildDepends = with self; [ dune ];
  };
  tezos-test-helpers = {
    name = "tezos-test-helpers";
    version = "12.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v12.3/tezos-v12.3.tar.bz2";
      sha256 = "296bb5674bc6050afe6330326fbdd0dfc2255d414bfd6b79cc7666ac6b39316d";
    };
    opam = "${repo}/packages/tezos-test-helpers/tezos-test-helpers.12.3/opam";
    depends = with self; [ alcotest dune fmt lwt ocaml pure-splitmix
                           qcheck-alcotest uri ];
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
  zarith_stubs_js = {
    name = "zarith_stubs_js";
    version = "v0.15.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.15/files/zarith_stubs_js-v0.15.0.tar.gz";
      sha256 = "fa5e32f883d677e2a84eed124ed17f078fe28217238009c8c1fd7123b922530f";
    };
    opam = "${repo}/packages/zarith_stubs_js/zarith_stubs_js.v0.15.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
