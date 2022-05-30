{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  containers = {
    name = "containers";
    version = "3.7";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-containers/archive/v3.7.tar.gz";
      sha512 = "70f99a062f7696d4ed7a6336532261c93c49a9858a84a12f7f3d60190a5c664198e70be6281dc7c7932c07325dc9c579ff521367e4c7e083566910ba0f9ea760";
    };
    opam = "${repo}/packages/containers/containers.3.7/opam";
    depends = with self; [ dune dune-configurator either ocaml seq
                           (self.base-threads or null)
                           (self.base-unix or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  containers-data = {
    name = "containers-data";
    version = "3.7";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/ocaml-containers/archive/v3.7.tar.gz";
      sha512 = "70f99a062f7696d4ed7a6336532261c93c49a9858a84a12f7f3d60190a5c664198e70be6281dc7c7932c07325dc9c579ff521367e4c7e083566910ba0f9ea760";
    };
    opam = "${repo}/packages/containers-data/containers-data.3.7/opam";
    depends = with self; [ containers dune ocaml seq ];
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
  either = {
    name = "either";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
      sha256 = "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
    };
    opam = "${repo}/packages/either/either.1.0.0/opam";
    depends = with self; [ dune ];
    buildDepends = with self; [ dune ];
  };
  iter = {
    name = "iter";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/sequence/archive/v1.4.tar.gz";
      sha512 = "8bcb6ddaab69aa18a8489a2287313227d59062fd554f70373a10bdbe1d1eabe4b199860223709fe7baa917d0d47aedeed895ed6d610a989ca540e00fe9cd135b";
    };
    opam = "${repo}/packages/iter/iter.1.4/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml result
                           (self.base-bigarray or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  libzipperposition = {
    name = "libzipperposition";
    version = "2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/sneeuwballen/zipperposition/archive/2.1.tar.gz";
      sha512 = "81becfc9badd686ab3692cd9312172aa4c4e3581b110e81770bb01e0ffbc1eb8495d0dd6d43b98f3d06e6b8c8a338174c13ebafb4e9849a3ddf89f9a3a72c287";
    };
    opam = "${repo}/packages/libzipperposition/libzipperposition.2.1/opam";
    depends = with self; [ base-bytes base-unix containers containers-data
                           dune iter logtk msat ocaml oseq ];
    buildDepends = with self; [ dune menhir ocaml ];
  };
  logtk = {
    name = "logtk";
    version = "2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/sneeuwballen/zipperposition/archive/2.1.tar.gz";
      sha512 = "81becfc9badd686ab3692cd9312172aa4c4e3581b110e81770bb01e0ffbc1eb8495d0dd6d43b98f3d06e6b8c8a338174c13ebafb4e9849a3ddf89f9a3a72c287";
    };
    opam = "${repo}/packages/logtk/logtk.2.1/opam";
    depends = with self; [ base-bytes base-unix containers containers-data
                           dune iter mtime ocaml oseq (self.msat or null)
                           (self.num or null) (self.zarith or null) ];
    buildDepends = with self; [ dune menhir ocaml ];
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
  msat = {
    name = "msat";
    version = "0.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Gbury/mSAT/archive/v0.9.1.tar.gz";
      sha512 = "51c133cefe8550125e7b1db18549e893bac15663fdd7a9fac87235c07de755f39eab9fc3cfdf6571612fd79b3d5b22f49f459581b480c7349bacddf2618c8a99";
    };
    opam = "${repo}/packages/msat/msat.0.9.1/opam";
    depends = with self; [ dune iter ocaml ];
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
    version = "4.12.1";
    opam = "${repo}/packages/ocaml/ocaml.4.12.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.12.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.12.1.tar.gz";
      sha256 = "f5a48a90557cb47ace7b1590fcab1362a1af38629a218350f69c225c57e96a41";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.12.1/opam";
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
  oseq = {
    name = "oseq";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/oseq/archive/0.3.tar.gz";
      sha512 = "7b8c8128f275fbfd8be2e351b9993603701aa0175bd1b7f754911603b4fbd21972bc4e88a1e2814391d3db635a1f801257fe33ea738994567b5ceea3b92ae58b";
    };
    opam = "${repo}/packages/oseq/oseq.0.3/opam";
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
  zipperposition = {
    name = "zipperposition";
    version = "2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/sneeuwballen/zipperposition/archive/2.1.tar.gz";
      sha512 = "81becfc9badd686ab3692cd9312172aa4c4e3581b110e81770bb01e0ffbc1eb8495d0dd6d43b98f3d06e6b8c8a338174c13ebafb4e9849a3ddf89f9a3a72c287";
    };
    opam = "${repo}/packages/zipperposition/zipperposition.2.1/opam";
    depends = with self; [ base-unix containers dune iter libzipperposition
                           logtk msat ocaml oseq ];
    buildDepends = with self; [ dune menhir ocaml ];
  };
}
