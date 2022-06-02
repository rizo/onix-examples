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
  batteries = {
    name = "batteries";
    version = "3.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-batteries-team/batteries-included/archive/refs/tags/v3.5.1.tar.gz";
      sha512 = "36c8561079aa9fefc864c2f03bd8ae20aa05987bb67e7a9beac3ab4f440dbf7d44f141c172b05fddb1a5b618fc55a27962bb45fc39bd7b3a15d56e0ed3ff3870";
    };
    opam = "${repo}/packages/batteries/batteries.3.5.1/opam";
    depends = with self; [ num ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-gmp-powm-sec = {
    name = "conf-gmp-powm-sec";
    version = "3";
    opam = "${repo}/packages/conf-gmp-powm-sec/conf-gmp-powm-sec.3/opam";
    depends = with self; [ conf-gmp ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-zlib = {
    name = "conf-zlib";
    version = "1";
    opam = "${repo}/packages/conf-zlib/conf-zlib.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ zlib ];
  };
  conf-zmq = {
    name = "conf-zmq";
    version = "0.1";
    opam = "${repo}/packages/conf-zmq/conf-zmq.0.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.epel-release or null)
                           (pkgs.libzmq3-dev or null) (pkgs.libzmq4 or null)
                           (pkgs.zeromq or null) (pkgs.zeromq-dev or null)
                           (pkgs.zeromq-devel or null) (pkgs.zmq or null) ];
  };
  cryptokit = {
    name = "cryptokit";
    version = "1.17";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/cryptokit/archive/release117.tar.gz";
      sha256 = "53e13043e3798e5e556a1ac50e687d6e5cf9ab2bf3ad9867b3090dcf17594f3f";
    };
    opam = "${repo}/packages/cryptokit/cryptokit.1.17/opam";
    depends = with self; [ conf-gmp-powm-sec conf-zlib dune dune-configurator
                           ocaml zarith ];
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
  daft = {
    name = "daft";
    version = "0.0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/daft/archive/v0.0.3.tar.gz";
      sha256 = "14jh5jp2vhwdapq3ll045qlyhsd1wr3x6a4fnr5mfrcrf63x7q6b";
    };
    opam = "${repo}/packages/daft/daft.0.0.3/opam";
    depends = with self; [ base-unix batteries cryptokit dolog fileutils
                           ocaml zmq ];
    buildDepends = with self; [ obuild ocaml ];
  };
  dolog = {
    name = "dolog";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/dolog/archive/v4.0.0.tar.gz";
      sha256 = "00xm60adkwd06xclcz9k5xz214w2raq21s0n01svdh2cjplmfnxx";
    };
    opam = "${repo}/packages/dolog/dolog.4.0.0/opam";
    depends = with self; [ base-unix dune ocaml ];
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
  fileutils = {
    name = "fileutils";
    version = "0.6.3";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ocaml-fileutils/releases/download/v0.6.3/fileutils-v0.6.3.tbz";
      sha256 = "eff581c488e9309eb02268bbfa3d4c9c30ff40d45f7b1e9ef300b3ef0e831462";
    };
    opam = "${repo}/packages/fileutils/fileutils.0.6.3/opam";
    depends = with self; [ base-bytes base-unix dune ocaml stdlib-shims ];
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
  obuild = {
    name = "obuild";
    version = "0.1.10";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-obuild/obuild/archive/obuild-v0.1.10.tar.gz";
      sha256 = "144pv6hyh1mxn4a7ajvd4riaghfv915kw559v40kx5jwmj312gi4";
    };
    opam = "${repo}/packages/obuild/obuild.0.1.10/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  stdint = {
    name = "stdint";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/andrenth/ocaml-stdint/releases/download/0.7.0/stdint-0.7.0.tbz";
      sha256 = "4fcc66aef58e2b96e7af3bbca9d910aa239e045ba5fb2400aaef67d0041252dc";
    };
    opam = "${repo}/packages/stdint/stdint.0.7.0/opam";
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
  zmq = {
    name = "zmq";
    version = "5.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/issuu/ocaml-zmq/releases/download/5.1.3/zmq-5.1.3.tbz";
      sha256 = "24b32de3829a103e548f37e00f7e03fca72a00e1b67d6ee6d3d75fbae31b8806";
    };
    opam = "${repo}/packages/zmq/zmq.5.1.3/opam";
    depends = with self; [ base-unix conf-zmq dune dune-configurator ocaml
                           stdint ];
    buildDepends = with self; [ dune ocaml ];
  };
}
