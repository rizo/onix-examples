{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  bls12-381 = {
    name = "bls12-381";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/0.5.0/ocaml-bls12-381-0.5.0.tar.bz2";
      sha512 = "593051b6de70b8aa433161e8e49f9067cfafb9bbabc0c979958d0f7e1ebd6dd8f95cbb525343b7182a773e44da8d466e7b192578a579442eb58416855362ab77";
    };
    opam = "${repo}/packages/bls12-381/bls12-381.0.5.0/opam";
    depends = with self; [ bls12-381-gen dune ff-sig ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  bls12-381-gen = {
    name = "bls12-381-gen";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/0.5.0/ocaml-bls12-381-0.5.0.tar.bz2";
      sha512 = "593051b6de70b8aa433161e8e49f9067cfafb9bbabc0c979958d0f7e1ebd6dd8f95cbb525343b7182a773e44da8d466e7b192578a579442eb58416855362ab77";
    };
    opam = "${repo}/packages/bls12-381-gen/bls12-381-gen.0.5.0/opam";
    depends = with self; [ dune ff-sig ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  bls12-381-js = {
    name = "bls12-381-js";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/0.5.0/ocaml-bls12-381-0.5.0.tar.bz2";
      sha512 = "593051b6de70b8aa433161e8e49f9067cfafb9bbabc0c979958d0f7e1ebd6dd8f95cbb525343b7182a773e44da8d466e7b192578a579442eb58416855362ab77";
    };
    opam = "${repo}/packages/bls12-381-js/bls12-381-js.0.5.0/opam";
    depends = with self; [ bls12-381 bls12-381-gen bls12-381-js-gen dune
                           js_of_ocaml js_of_ocaml-compiler js_of_ocaml-ppx
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bls12-381-js-gen = {
    name = "bls12-381-js-gen";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/dannywillems/ocaml-bls12-381/-/archive/0.5.0/ocaml-bls12-381-0.5.0.tar.bz2";
      sha512 = "593051b6de70b8aa433161e8e49f9067cfafb9bbabc0c979958d0f7e1ebd6dd8f95cbb525343b7182a773e44da8d466e7b192578a579442eb58416855362ab77";
    };
    opam = "${repo}/packages/bls12-381-js-gen/bls12-381-js-gen.0.5.0/opam";
    depends = with self; [ bls12-381 bls12-381-gen dune ff-sig js_of_ocaml
                           js_of_ocaml-compiler js_of_ocaml-ppx ocaml zarith
                           zarith_stubs_js ];
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
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
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
  zarith_stubs_js = {
    name = "zarith_stubs_js";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/zarith_stubs_js/archive/refs/tags/v0.14.1.tar.gz";
      sha256 = "0mkaal9j0mn6zghxg7qw8dyysycsii2rnmci8hc5hc3a0jv7rsic";
    };
    opam = "${repo}/packages/zarith_stubs_js/zarith_stubs_js.v0.14.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
