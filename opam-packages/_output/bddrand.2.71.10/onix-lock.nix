{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  bddrand = {
    name = "bddrand";
    version = "2.71.10";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutin.2.71.10.tgz";
      sha512 = "2e899aee5e44826827b3626771f7ce01241b1745d48f30b60404cc5cbaa44ac608920e9af3bf171275c429a8b823b3cee7542199b7c4c32919b6bb37e33bf8de";
    };
    opam = "${repo}/packages/bddrand/bddrand.2.71.10/opam";
    depends = with self; [ dune lutin ocaml ];
    buildDepends = with self; [ base-unix dune ocaml ];
  };
  camlidl = {
    name = "camlidl";
    version = "1.09";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/camlidl/archive/camlidl109.tar.gz";
      sha256 = "1qpf5igly5axsvykm42v28zlwjrcw101bx3c22wp4m8m116f1py6";
    };
    opam = "${repo}/packages/camlidl/camlidl.1.09/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  camlp-streams = {
    name = "camlp-streams";
    version = "5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/camlp-streams/archive/refs/tags/v5.0.tar.gz";
      sha512 = "f42e2f5e5ca353b3d647cd7e97a278c167c2d1abd185a634f155965cec29e35d9be7ce940b4c205b0577d7e9b6f714580bfd2e2fd79f1b1b461bc3fb96d26d36";
    };
    opam = "${repo}/packages/camlp-streams/camlp-streams.5.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  camlp5 = {
    name = "camlp5";
    version = "8.00.03";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/camlp5/archive/refs/tags/rel8.00.03.tar.gz";
      sha512 = "a6259d2d491ed1f967dd383f03d3da65a3f383d28340111f57883c6d56cee2d267c0f752ba98bcdb72c24cf724a606718de26b6c55b84ad9b5f8f6d620f3cba1";
    };
    opam = "${repo}/packages/camlp5/camlp5.8.00.03/opam";
    depends = with self; [ camlp-streams conf-perl
                           conf-perl-ipc-system-simple
                           conf-perl-string-shellquote ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-libX11 = {
    name = "conf-libX11";
    version = "1";
    opam = "${repo}/packages/conf-libX11/conf-libX11.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libX11-dev or null)
                           (pkgs.libX11-devel or null) (pkgs.libx11 or null)
                           (pkgs.libx11-dev or null)
                           (pkgs.xorg-libX11 or null) (pkgs.xquartz or null) ];
  };
  conf-m4 = {
    name = "conf-m4";
    version = "1";
    opam = "${repo}/packages/conf-m4/conf-m4.1/opam";
    depexts = with pkgs; [ m4 ];
  };
  conf-mpfr = {
    name = "conf-mpfr";
    version = "3";
    opam = "${repo}/packages/conf-mpfr/conf-mpfr.3/opam";
    buildDepends = with self; [ conf-gmp conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libmpfr-dev or null) (pkgs.mpfr or null)
                           (pkgs.mpfr-dev or null) (pkgs.mpfr-devel or null) ];
  };
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
  };
  conf-perl-ipc-system-simple = {
    name = "conf-perl-ipc-system-simple";
    version = "3";
    opam = "${repo}/packages/conf-perl-ipc-system-simple/conf-perl-ipc-system-simple.3/opam";
    depends = with self; [ conf-perl ];
    depexts = with pkgs; [ (pkgs.epel-release or null)
                           (pkgs.libipc-system-simple-perl or null)
                           (pkgs.p5-ipc-system-simple or null)
                           (pkgs.perl-IPC-System-Simple or null)
                           (pkgs.perl-ipc-system-simple or null) ];
  };
  conf-perl-string-shellquote = {
    name = "conf-perl-string-shellquote";
    version = "3";
    opam = "${repo}/packages/conf-perl-string-shellquote/conf-perl-string-shellquote.3/opam";
    depends = with self; [ conf-perl ];
    depexts = with pkgs; [ (pkgs.libstring-shellquote-perl or null)
                           (pkgs.p5-string-shellquote or null)
                           (pkgs.perl-String-ShellQuote or null)
                           (pkgs.perl-string-shellquote or null) ];
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
  extlib = {
    name = "extlib";
    version = "1.7.8";
    src = pkgs.fetchurl {
      url = "https://ygrek.org/p/release/ocaml-extlib/extlib-1.7.8.tar.gz";
      sha256 = "935ca46843af40dc33306d9cce66163d3733312bf444e969b5a8fa3f3024f85a";
    };
    opam = "${repo}/packages/extlib/extlib.1.7.8/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ base-bytes cppo ocaml ocamlfind ];
  };
  ezdl = {
    name = "ezdl";
    version = "2.71.10";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutin.2.71.10.tgz";
      sha512 = "2e899aee5e44826827b3626771f7ce01241b1745d48f30b60404cc5cbaa44ac608920e9af3bf171275c429a8b823b3cee7542199b7c4c32919b6bb37e33bf8de";
    };
    opam = "${repo}/packages/ezdl/ezdl.2.71.10/opam";
    depends = with self; [ camlidl dune ocaml ];
    buildDepends = with self; [ base-unix dune ocaml ];
  };
  gbddml = {
    name = "gbddml";
    version = "2.71.10";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutin.2.71.10.tgz";
      sha512 = "2e899aee5e44826827b3626771f7ce01241b1745d48f30b60404cc5cbaa44ac608920e9af3bf171275c429a8b823b3cee7542199b7c4c32919b6bb37e33bf8de";
    };
    opam = "${repo}/packages/gbddml/gbddml.2.71.10/opam";
    depends = with self; [ camlidl dune ocaml ];
    buildDepends = with self; [ base-unix dune ocaml ];
  };
  graphics = {
    name = "graphics";
    version = "5.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/graphics/releases/download/5.1.2/graphics-5.1.2.tbz";
      sha256 = "400fd81d23f1cb4146b96979342c247971dd54f5879ffd2f80ec7cd0212e32d4";
    };
    opam = "${repo}/packages/graphics/graphics.5.1.2/opam";
    depends = with self; [ conf-libX11 conf-pkg-config dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ledit = {
    name = "ledit";
    version = "2.05";
    src = pkgs.fetchurl {
      url = "https://github.com/chetmurthy/ledit/archive/ledit-2-05.tar.gz";
      sha256 = "0b1r44abaskp68xy05yz9cp8385ayyi08g2zxqdjzjbwwkmfcgj9";
    };
    opam = "${repo}/packages/ledit/ledit.2.05/opam";
    depends = with self; [ camlp5 ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  lustre-v6 = {
    name = "lustre-v6";
    version = "6.103.3";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lustre-v6.6.103.3.tgz";
      sha512 = "8d452184ee68edda1b5a50717e6a5b13fb21f9204634fc5898280e27a1d79c97a6e7cc04424fc22f34cdd02ed3cc8774dca4f982faf342980b5f9fe0dc1a017d";
    };
    opam = "${repo}/packages/lustre-v6/lustre-v6.6.103.3/opam";
    depends = with self; [ base-unix dune lutils num ocaml ocamlfind rdbg ];
    buildDepends = with self; [ dune ocaml ocamlfind (self.extlib or null)
                                (self.extlib-compat or null) ];
  };
  lutils = {
    name = "lutils";
    version = "1.51.2";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutils.1.51.2.tgz";
      sha512 = "f94696be379c62e888410ec3d940c888ca4b607cf59c2e364e93a2a694da65ebe6d531107198b795e80eecc3c6865eedb02659c7e7c4e15c9b28d74aa35d09f8";
    };
    opam = "${repo}/packages/lutils/lutils.1.51.2/opam";
    depends = with self; [ base-unix dune num ocaml ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  lutin = {
    name = "lutin";
    version = "2.71.10";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutin.2.71.10.tgz";
      sha512 = "2e899aee5e44826827b3626771f7ce01241b1745d48f30b60404cc5cbaa44ac608920e9af3bf171275c429a8b823b3cee7542199b7c4c32919b6bb37e33bf8de";
    };
    opam = "${repo}/packages/lutin/lutin.2.71.10/opam";
    depends = with self; [ base-bigarray camlidl conf-gmp conf-mpfr dune ezdl
                           gbddml graphics lustre-v6 lutils mlgmpidl num
                           ocaml ocamlfind polka rdbg ];
    buildDepends = with self; [ base-unix conf-m4 conf-perl dune ocaml
                                ocamlfind (self.extlib or null)
                                (self.extlib-compat or null) ];
  };
  mlgmpidl = {
    name = "mlgmpidl";
    version = "1.2.14";
    src = pkgs.fetchurl {
      url = "https://github.com/nberth/mlgmpidl/archive/1.2.14.tar.gz";
      sha256 = "0y5qb73nbiz81bg599by695f5kvm0ax199jax7xygbx48s9pm2fr";
    };
    opam = "${repo}/packages/mlgmpidl/mlgmpidl.1.2.14/opam";
    depends = with self; [ camlidl conf-gmp conf-mpfr ocaml ];
    buildDepends = with self; [ conf-perl ocaml ocamlfind ];
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
  ounit = {
    name = "ounit";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit/ounit.2.2.6/opam";
    depends = with self; [ ounit2 ];
    buildDepends = with self; [ ocamlfind ];
  };
  ounit2 = {
    name = "ounit2";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit2/ounit2.2.2.6/opam";
    depends = with self; [ base-bytes base-unix dune ocaml seq stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  polka = {
    name = "polka";
    version = "2.71.10";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/lutin.2.71.10.tgz";
      sha512 = "2e899aee5e44826827b3626771f7ce01241b1745d48f30b60404cc5cbaa44ac608920e9af3bf171275c429a8b823b3cee7542199b7c4c32919b6bb37e33bf8de";
    };
    opam = "${repo}/packages/polka/polka.2.71.10/opam";
    depends = with self; [ base-bigarray camlidl conf-gmp conf-mpfr dune
                           mlgmpidl num ocaml ocamlfind ];
    buildDepends = with self; [ base-unix conf-m4 conf-perl dune ocaml
                                ocamlfind (self.extlib or null)
                                (self.extlib-compat or null) ];
  };
  rdbg = {
    name = "rdbg";
    version = "1.196.12";
    src = pkgs.fetchurl {
      url = "http://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/pool/rdbg.1.196.12.tgz";
      sha512 = "8e88034b1eda8f1233b4990adc9746782148254c93d8d0c99c246c0d50f306eeb6aa4afcfca8834acb3e268860647f47a24cc6a2d29fb45cac11f098e2ede275";
    };
    opam = "${repo}/packages/rdbg/rdbg.1.196.12/opam";
    depends = with self; [ base-unix dune ledit lutils num ocaml ocamlfind ];
    buildDepends = with self; [ dune ocaml ocamlfind ounit ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
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
}
