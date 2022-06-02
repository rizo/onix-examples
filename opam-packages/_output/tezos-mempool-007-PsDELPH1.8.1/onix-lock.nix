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
    version = "0.3.15";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/0.3.15/ocaml-bls12-381-0.3.15.tar.gz";
      sha512 = "88282ebaf59aa722ce7499e71e24e5313c7933a137c15f95cce58becd50ed30c4df8ca5eb6b00ee98ed4af6aa4412f6e620e23328b381a4372b2d516122464cc";
    };
    opam = "${repo}/packages/bls12-381/bls12-381.0.3.15/opam";
    depends = with self; [ ctypes ctypes-foreign dune ff ocaml
                           tezos-rust-libs zarith ];
    buildDepends = with self; [ conf-rust dune dune-configurator ocaml ];
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
  conf-libffi = {
    name = "conf-libffi";
    version = "2.0.0";
    opam = "${repo}/packages/conf-libffi/conf-libffi.2.0.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libffi ];
  };
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-rust = {
    name = "conf-rust";
    version = "0.1";
    opam = "${repo}/packages/conf-rust/conf-rust.0.1/opam";
    depexts = with pkgs; [ cargo rustc ];
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
    version = "0.17.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-ctypes/archive/0.17.1.tar.gz";
      sha256 = "1sd74bcsln51bnz11c82v6h6fv23dczfyfqqvv9rxa9wp4p3qrs1";
    };
    opam = "${repo}/packages/ctypes/ctypes.0.17.1/opam";
    depends = with self; [ integers ocaml (self.ctypes-foreign or null)
                           (self.mirage-xen or null) ];
    buildDepends = with self; [ conf-pkg-config ocaml ocamlfind ];
  };
  ctypes-foreign = {
    name = "ctypes-foreign";
    version = "0.18.0";
    opam = "${repo}/packages/ctypes-foreign/ctypes-foreign.0.18.0/opam";
    depends = with self; [ conf-libffi ];
    buildDepends = with self; [ conf-pkg-config ];
  };
  data-encoding = {
    name = "data-encoding";
    version = "0.2";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/data-encoding/-/archive/0.2/data-encoding-0.2.tar.gz";
      sha512 = "d9b95c0b4655930d590a78288edad50fbb845dfff1d2378c11e7f7b2499a70380af2edf289f24145f58c92091195f8326bf51efdb980cd221c22357f9919c37c";
    };
    opam = "${repo}/packages/data-encoding/data-encoding.0.2/opam";
    depends = with self; [ dune ezjsonm hex json-data-encoding
                           json-data-encoding-bson ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  digestif = {
    name = "digestif";
    version = "1.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/digestif/releases/download/v1.1.2/digestif-1.1.2.tbz";
      sha256 = "79d34ce513b114857e380aabdf6f1473218f1b05dd7e51d03890779ed01b4666";
    };
    opam = "${repo}/packages/digestif/digestif.1.1.2/opam";
    depends = with self; [ dune eqaf ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  domain-name = {
    name = "domain-name";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/domain-name/releases/download/v0.3.0/domain-name-v0.3.0.tbz";
      sha256 = "4dd9ed1bc619886d1adcaff14edfb503dedb77fc0b7a28d88d213aa1c44d6c8a";
    };
    opam = "${repo}/packages/domain-name/domain-name.0.3.0/opam";
    depends = with self; [ astring dune fmt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune/dune.2.9.3/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.2.9.3/opam";
    depends = with self; [ csexp dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  eqaf = {
    name = "eqaf";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/eqaf/releases/download/v0.8/eqaf-v0.8.tbz";
      sha256 = "1145a160107437d7943e02e486df6bd233d3937ec1a597d7fa39edb9471cf875";
    };
    opam = "${repo}/packages/eqaf/eqaf.0.8/opam";
    depends = with self; [ cstruct dune ocaml ];
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
  ff = {
    name = "ff";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-ff/-/archive/0.4.0/ocaml-ff-0.4.0.tar.gz";
      sha512 = "b20e5f114adbcd4d4e9dbf7b8a937776b07787052f6e6b965ffeaa3e3319f4ab9051d64e30a1a34d55f9f08509382b9aabc012988a2f704f3d770a65db48304d";
    };
    opam = "${repo}/packages/ff/ff.0.4.0/opam";
    depends = with self; [ dune zarith ];
    buildDepends = with self; [ dune ];
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
    version = "0.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/project-everest/hacl-star/releases/download/ocaml-v0.3.2/hacl-star.0.3.2.tar.gz";
      sha512 = "272070750040651742f81ee7ef64e4aab5421e65e5e66030341fb60cf134273f79f8cf81d75cc62056d523b184e75866e01a40d332b418c3a9071c4f87d21710";
    };
    opam = "${repo}/packages/hacl-star/hacl-star.0.3.2/opam";
    depends = with self; [ dune hacl-star-raw ocaml zarith ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  hacl-star-raw = {
    name = "hacl-star-raw";
    version = "0.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/project-everest/hacl-star/releases/download/ocaml-v0.3.2/hacl-star.0.3.2.tar.gz";
      sha512 = "272070750040651742f81ee7ef64e4aab5421e65e5e66030341fb60cf134273f79f8cf81d75cc62056d523b184e75866e01a40d332b418c3a9071c4f87d21710";
    };
    opam = "${repo}/packages/hacl-star-raw/hacl-star-raw.0.3.2/opam";
    depends = with self; [ ctypes ctypes-foreign ocaml ];
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
  index = {
    name = "index";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/index/releases/download/1.2.1/index-1.2.1.tbz";
      sha256 = "cd80c43fd046b3d405b567eed237ad25450140e931d1eef5015ee6af74362ba9";
    };
    opam = "${repo}/packages/index/index.1.2.1/opam";
    depends = with self; [ dune fmt logs mtime ocaml stdlib-shims ];
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
  irmin = {
    name = "irmin";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/2.2.0/irmin-2.2.0.tbz";
      sha256 = "a44e018495336e0f632433fcae7b4e84699938a7110212da9e3818b35048fc3f";
    };
    opam = "${repo}/packages/irmin/irmin.2.2.0/opam";
    depends = with self; [ astring base64 digestif dune fmt jsonm logs lwt
                           ocaml ocamlgraph uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  irmin-pack = {
    name = "irmin-pack";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/irmin/releases/download/2.2.0/irmin-2.2.0.tbz";
      sha256 = "a44e018495336e0f632433fcae7b4e84699938a7110212da9e3818b35048fc3f";
    };
    opam = "${repo}/packages/irmin-pack/irmin-pack.2.2.0/opam";
    depends = with self; [ dune index irmin lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  json-data-encoding = {
    name = "json-data-encoding";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/json-data-encoding/-/archive/v0.8/json-data-encoding-v0.8.tar.gz";
      sha512 = "f6d2a00008a0cd88bfae2458f56dde8f45c4e209ece9805d3e8d2c74401e4a5f9e12f99d5318f58a30a4579d9c9e9f204a75269c2110bb16a3e1036b2599b7a5";
    };
    opam = "${repo}/packages/json-data-encoding/json-data-encoding.0.8/opam";
    depends = with self; [ dune ocaml uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  json-data-encoding-bson = {
    name = "json-data-encoding-bson";
    version = "0.8";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/json-data-encoding/-/archive/v0.8/json-data-encoding-v0.8.tar.gz";
      sha512 = "f6d2a00008a0cd88bfae2458f56dde8f45c4e209ece9805d3e8d2c74401e4a5f9e12f99d5318f58a30a4579d9c9e9f204a75269c2110bb16a3e1036b2599b7a5";
    };
    opam = "${repo}/packages/json-data-encoding-bson/json-data-encoding-bson.0.8/opam";
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
    version = "0.2";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/lwt-canceler/-/archive/v0.2/lwt-canceler-v0.2.tar.gz";
      sha512 = "b3c23f82ee293cc4299be1cf41b94ac6592ce8d3124cb8ef1380ac258bd3c8ca5635387943b6ce03048c163d76d0157097c26a7c6dd2139c78dde27d1c622296";
    };
    opam = "${repo}/packages/lwt-canceler/lwt-canceler.0.2/opam";
    depends = with self; [ dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  lwt-watcher = {
    name = "lwt-watcher";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/lwt-watcher/-/archive/v0.1/lwt-watcher-v0.1.tar.gz";
      sha512 = "7a93368ab6133e17fdf8512c28380fdba5bd0eb397deac9c7018278138b4fa4e4d65b5f32af624a0c725087640ae105be890d93d9019ca90352c36fb43183b14";
    };
    opam = "${repo}/packages/lwt-watcher/lwt-watcher.0.1/opam";
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
  ocaml-config = {
    name = "ocaml-config";
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
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
  ocp-ocamlres = {
    name = "ocp-ocamlres";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocp-ocamlres/archive/v0.4.tar.gz";
      sha256 = "0ycn2wkw16rs02c2pb4i1mivi5lcy0qx83r92qxf9q97w282k335";
    };
    opam = "${repo}/packages/ocp-ocamlres/ocp-ocamlres.0.4/opam";
    depends = with self; [ astring base-unix ocaml ocamlfind pprint ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
  pprint = {
    name = "pprint";
    version = "20220103";
    src = pkgs.fetchurl {
      url = "https://github.com/fpottier/pprint/archive/20220103.tar.gz";
      sha512 = "1c4d85e529414dc2d52602fae7e44ca036d2d35e9ce1906fd88b0f8a8d0ba1527042b0e5117fdeb51237b2311020a711065a917cc158b63e2ac932c97fa28406";
    };
    opam = "${repo}/packages/pprint/pprint.20220103/opam";
    depends = with self; [ dune ocaml ];
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
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/resto/-/archive/v0.5/resto-v0.5.tar.gz";
      sha512 = "394e45360d125de22018cd7de3fa9828ffa47e9235937d7a5b12a96ff57534db6006f3ef919410c5c7197931c8828a1f78f96e976e17e6e2bc127d111c367126";
    };
    opam = "${repo}/packages/resto/resto.0.5/opam";
    depends = with self; [ dune ocaml uri ];
    buildDepends = with self; [ dune ocaml ];
  };
  resto-directory = {
    name = "resto-directory";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/resto/-/archive/v0.5/resto-v0.5.tar.gz";
      sha512 = "394e45360d125de22018cd7de3fa9828ffa47e9235937d7a5b12a96ff57534db6006f3ef919410c5c7197931c8828a1f78f96e976e17e6e2bc127d111c367126";
    };
    opam = "${repo}/packages/resto-directory/resto-directory.0.5/opam";
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
  rresult = {
    name = "rresult";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/rresult/releases/rresult-0.7.0.tbz";
      sha512 = "f1bb631c986996388e9686d49d5ae4d8aaf14034f6865c62a88fb58c48ce19ad2eb785327d69ca27c032f835984e0bd2efd969b415438628a31f3e84ec4551d3";
    };
    opam = "${repo}/packages/rresult/rresult.0.7.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-base/tezos-base.8.1/opam";
    depends = with self; [ dune ezjsonm ipaddr ptime tezos-crypto
                           tezos-micheline ];
    buildDepends = with self; [ dune ];
  };
  tezos-clic = {
    name = "tezos-clic";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-clic/tezos-clic.8.1/opam";
    depends = with self; [ dune tezos-stdlib-unix ];
    buildDepends = with self; [ dune ];
  };
  tezos-crypto = {
    name = "tezos-crypto";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-crypto/tezos-crypto.8.1/opam";
    depends = with self; [ bls12-381 dune hacl-star ringo secp256k1-internal
                           tezos-clic tezos-rpc uecc ];
    buildDepends = with self; [ dune ];
  };
  tezos-embedded-protocol-007-PsDELPH1 = {
    name = "tezos-embedded-protocol-007-PsDELPH1";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-embedded-protocol-007-PsDELPH1/tezos-embedded-protocol-007-PsDELPH1.8.1/opam";
    depends = with self; [ dune tezos-protocol-007-PsDELPH1
                           tezos-protocol-updater ];
    buildDepends = with self; [ dune ];
  };
  tezos-error-monad = {
    name = "tezos-error-monad";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-error-monad/tezos-error-monad.8.1/opam";
    depends = with self; [ data-encoding dune lwt lwt-canceler tezos-stdlib ];
    buildDepends = with self; [ dune ];
  };
  tezos-event-logging = {
    name = "tezos-event-logging";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-event-logging/tezos-event-logging.8.1/opam";
    depends = with self; [ dune lwt_log tezos-lwt-result-stdlib ];
    buildDepends = with self; [ dune ];
  };
  tezos-lmdb = {
    name = "tezos-lmdb";
    version = "7.4";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos/-/archive/v7.4/tezos-v7.4.tar.bz2";
      sha256 = "72665376e177d3530c2ad26d12215c237fa511484c577b8ee21ced2ba62613a4";
    };
    opam = "${repo}/packages/tezos-lmdb/tezos-lmdb.7.4/opam";
    depends = with self; [ dune rresult ];
    buildDepends = with self; [ dune ];
  };
  tezos-lwt-result-stdlib = {
    name = "tezos-lwt-result-stdlib";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-lwt-result-stdlib/tezos-lwt-result-stdlib.8.1/opam";
    depends = with self; [ dune ocaml tezos-error-monad ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-mempool-007-PsDELPH1 = {
    name = "tezos-mempool-007-PsDELPH1";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-mempool-007-PsDELPH1/tezos-mempool-007-PsDELPH1.8.1/opam";
    depends = with self; [ dune tezos-embedded-protocol-007-PsDELPH1
                           tezos-shell ];
    buildDepends = with self; [ dune ];
  };
  tezos-micheline = {
    name = "tezos-micheline";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-micheline/tezos-micheline.8.1/opam";
    depends = with self; [ dune tezos-error-monad uutf ];
    buildDepends = with self; [ dune ];
  };
  tezos-p2p = {
    name = "tezos-p2p";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-p2p/tezos-p2p.8.1/opam";
    depends = with self; [ dune lwt-watcher tezos-p2p-services ];
    buildDepends = with self; [ dune ];
  };
  tezos-p2p-services = {
    name = "tezos-p2p-services";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-p2p-services/tezos-p2p-services.8.1/opam";
    depends = with self; [ dune tezos-base ];
    buildDepends = with self; [ dune ];
  };
  tezos-protocol-007-PsDELPH1 = {
    name = "tezos-protocol-007-PsDELPH1";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-007-PsDELPH1/tezos-protocol-007-PsDELPH1.8.1/opam";
    depends = with self; [ dune tezos-protocol-compiler ];
    buildDepends = with self; [ dune ];
  };
  tezos-protocol-compiler = {
    name = "tezos-protocol-compiler";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-compiler/tezos-protocol-compiler.8.1/opam";
    depends = with self; [ dune ocaml ocp-ocamlres tezos-protocol-environment ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-protocol-environment = {
    name = "tezos-protocol-environment";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-environment/tezos-protocol-environment.8.1/opam";
    depends = with self; [ dune tezos-base tezos-protocol-environment-sigs
                           tezos-protocol-environment-structs tezos-sapling
                           zarith ];
    buildDepends = with self; [ dune ];
  };
  tezos-protocol-environment-packer = {
    name = "tezos-protocol-environment-packer";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-environment-packer/tezos-protocol-environment-packer.8.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-protocol-environment-sigs = {
    name = "tezos-protocol-environment-sigs";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-environment-sigs/tezos-protocol-environment-sigs.8.1/opam";
    depends = with self; [ dune tezos-protocol-environment-packer ];
    buildDepends = with self; [ dune ];
  };
  tezos-protocol-environment-structs = {
    name = "tezos-protocol-environment-structs";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-environment-structs/tezos-protocol-environment-structs.8.1/opam";
    depends = with self; [ dune tezos-crypto
                           tezos-protocol-environment-packer ];
    buildDepends = with self; [ dune ];
  };
  tezos-protocol-updater = {
    name = "tezos-protocol-updater";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-protocol-updater/tezos-protocol-updater.8.1/opam";
    depends = with self; [ dune tezos-protocol-compiler tezos-shell-context ];
    buildDepends = with self; [ dune ];
  };
  tezos-requester = {
    name = "tezos-requester";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-requester/tezos-requester.8.1/opam";
    depends = with self; [ dune lwt-watcher tezos-base ];
    buildDepends = with self; [ dune ];
  };
  tezos-rpc = {
    name = "tezos-rpc";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-rpc/tezos-rpc.8.1/opam";
    depends = with self; [ dune resto resto-directory tezos-error-monad ];
    buildDepends = with self; [ dune ];
  };
  tezos-rust-libs = {
    name = "tezos-rust-libs";
    version = "1.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/tezos/tezos-rust-libs/-/archive/v1.0/tezos-rust-libs-v1.0.tar.bz2";
      sha256 = "f2c81f65a8ab5bfd57e8d793f3abd0f1e696ba896dee73c6c88f33b9b130d7bd";
    };
    opam = "${repo}/packages/tezos-rust-libs/tezos-rust-libs.1.0/opam";
    depends = with self; [ conf-rust ];
  };
  tezos-sapling = {
    name = "tezos-sapling";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-sapling/tezos-sapling.8.1/opam";
    depends = with self; [ dune tezos-crypto ];
    buildDepends = with self; [ dune ];
  };
  tezos-shell = {
    name = "tezos-shell";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-shell/tezos-shell.8.1/opam";
    depends = with self; [ dune tezos-p2p tezos-requester tezos-validation ];
    buildDepends = with self; [ dune ];
  };
  tezos-shell-context = {
    name = "tezos-shell-context";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-shell-context/tezos-shell-context.8.1/opam";
    depends = with self; [ dune tezos-protocol-environment tezos-storage ];
    buildDepends = with self; [ dune ];
  };
  tezos-shell-services = {
    name = "tezos-shell-services";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-shell-services/tezos-shell-services.8.1/opam";
    depends = with self; [ dune tezos-p2p-services tezos-version
                           tezos-workers ];
    buildDepends = with self; [ dune ];
  };
  tezos-stdlib = {
    name = "tezos-stdlib";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-stdlib/tezos-stdlib.8.1/opam";
    depends = with self; [ dune hex lwt ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  tezos-stdlib-unix = {
    name = "tezos-stdlib-unix";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-stdlib-unix/tezos-stdlib-unix.8.1/opam";
    depends = with self; [ base-unix conf-libev dune ezjsonm fmt ipaddr lwt
                           mtime ptime re tezos-event-logging ];
    buildDepends = with self; [ dune ];
  };
  tezos-storage = {
    name = "tezos-storage";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-storage/tezos-storage.8.1/opam";
    depends = with self; [ digestif dune irmin irmin-pack tezos-lmdb
                           tezos-shell-services ];
    buildDepends = with self; [ dune ];
  };
  tezos-validation = {
    name = "tezos-validation";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-validation/tezos-validation.8.1/opam";
    depends = with self; [ dune tezos-protocol-updater ];
    buildDepends = with self; [ dune ];
  };
  tezos-version = {
    name = "tezos-version";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-version/tezos-version.8.1/opam";
    depends = with self; [ dune tezos-base ];
    buildDepends = with self; [ dune ];
  };
  tezos-workers = {
    name = "tezos-workers";
    version = "8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-source-archives/raw/main/tezos-v8.1.tar.bz2";
      sha256 = "a86de0cc02108a4d2defb67b3774c4ba9c645280908e3695d465e194bbd9dad9";
    };
    opam = "${repo}/packages/tezos-workers/tezos-workers.8.1/opam";
    depends = with self; [ dune tezos-base ];
    buildDepends = with self; [ dune ];
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
  uecc = {
    name = "uecc";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/ocaml-uecc/-/archive/v0.3/ocaml-uecc-v0.3.tar.gz";
      sha256 = "ae4be85bdd02698097f0a7fa33c40720c7b53f462e6149b01fec348c527f956d";
    };
    opam = "${repo}/packages/uecc/uecc.0.3/opam";
    depends = with self; [ bigstring dune ocaml ];
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
    version = "1.11";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/Zarith/archive/release-1.11.tar.gz";
      sha512 = "7c0645d63511d42b763cd0a33b3fb139c26d23ae0cf59cd651388644cb8e7c43a83265d55d69ff3320d8c4586c4f8dbd9c3412197bab2e110c38e6e7dac88b83";
    };
    opam = "${repo}/packages/zarith/zarith.1.11/opam";
    depends = with self; [ conf-gmp ocaml ];
    buildDepends = with self; [ conf-perl ocaml ocamlfind ];
  };
}
