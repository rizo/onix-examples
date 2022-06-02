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
  conf-libpcre = {
    name = "conf-libpcre";
    version = "1";
    opam = "${repo}/packages/conf-libpcre/conf-libpcre.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libpcre-devel or null)
                           (pkgs.libpcre3-dev or null) (pkgs.pcre or null)
                           (pkgs.pcre-dev or null) (pkgs.pcre-devel or null) ];
  };
  conf-mbedtls = {
    name = "conf-mbedtls";
    version = "1";
    opam = "${repo}/packages/conf-mbedtls/conf-mbedtls.1/opam";
    depexts = with pkgs; [ mbedtls ];
  };
  conf-neko = {
    name = "conf-neko";
    version = "1";
    opam = "${repo}/packages/conf-neko/conf-neko.1/opam";
    depexts = with pkgs; [ neko ];
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
  conf-zlib = {
    name = "conf-zlib";
    version = "1";
    opam = "${repo}/packages/conf-zlib/conf-zlib.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ zlib ];
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
    version = "1.7.7+1";
    src = pkgs.fetchurl {
      url = "https://ygrek.org/p/release/ocaml-extlib/extlib-1.7.7.tar.gz";
      sha256 = "4183abeca72efefc2513a440706c0e6e56d4676f60ae89a4306f8e5e03fbb5eb";
    };
    opam = "${repo}/packages/extlib/extlib.1.7.7-1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ base-bytes cppo ocaml ocamlfind ];
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
  haxe = {
    name = "haxe";
    version = "4.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/HaxeFoundation/haxe-debian/archive/upstream/4.1.1.tar.gz";
      sha256 = "1073lmq31r6bw8cwgri2dwymakq3mfva7kh3j6n3yp4p9drypf2v";
    };
    opam = "${repo}/packages/haxe/haxe.4.1.1/opam";
    depends = with self; [ conf-libpcre conf-mbedtls conf-neko conf-zlib dune
                           extlib ocaml ptmap sedlex sha xml-light ];
    buildDepends = with self; [ camlp5 dune ocaml ocamlfind ];
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
  ptmap = {
    name = "ptmap";
    version = "2.0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ptmap/releases/download/2.0.5/ptmap-2.0.5.tbz";
      sha256 = "ebd1f8afe8679a226fdcbcdb323788e6f63db57521b151473f2ff8c05c30f3aa";
    };
    opam = "${repo}/packages/ptmap/ptmap.2.0.5/opam";
    depends = with self; [ dune ocaml seq stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  sedlex = {
    name = "sedlex";
    version = "3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/sedlex/archive/v3.0.tar.gz";
      sha512 = "564780b7af8b3ddd32c9164caa42fd24b2ff59e0bf9977bcee4c3ddea2be3f0c870bd95949b639c5f1942e0fa2604902f5cd3eb9041d59b6ee2367895df556df";
    };
    opam = "${repo}/packages/sedlex/sedlex.3.0/opam";
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
  sha = {
    name = "sha";
    version = "1.15.2";
    src = pkgs.fetchurl {
      url = "https://github.com/djs55/ocaml-sha/releases/download/1.15.2/sha-1.15.2.tbz";
      sha256 = "3fbd57b39a7c40068eb41ae1eccba140938beb5e3806a4cbbd79593b2183ffb7";
    };
    opam = "${repo}/packages/sha/sha.1.15.2/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
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
  xml-light = {
    name = "xml-light";
    version = "2.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ncannasse/xml-light/archive/2.4.tar.gz";
      sha256 = "10b55qf6mvdp11ny3h0jv6k6wrs78jr9lhsiswl0xya7z8r8j0a2";
    };
    opam = "${repo}/packages/xml-light/xml-light.2.4/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
