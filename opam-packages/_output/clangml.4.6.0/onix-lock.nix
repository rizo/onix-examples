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
  clangml = {
    name = "clangml";
    version = "4.6.0";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/memcad/clangml/-/archive/v4.6.0/clangml-v4.6.0.tar.gz";
      sha512 = "70fc8a1e83e5c96d742c8517c6e30a2e08c233e622a493417c31688dbab25d4e1edd8e54abdcb60438b8e5c942206d34e7b64fa2f45aaafcd44411959a06857f";
    };
    opam = "${repo}/packages/clangml/clangml.4.6.0/opam";
    depends = with self; [ conf-libclang conf-ncurses conf-zlib dune metapp
                           metaquot ocaml ocaml-migrate-parsetree ppxlib refl
                           stdcompat ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  conf-libclang = {
    name = "conf-libclang";
    version = "14";
    opam = "${repo}/packages/conf-libclang/conf-libclang.14/opam";
    depexts = with pkgs; [ llvm ];
  };
  conf-ncurses = {
    name = "conf-ncurses";
    version = "1";
    opam = "${repo}/packages/conf-ncurses/conf-ncurses.1/opam";
    depexts = with pkgs; [ ncurses ];
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
  fix = {
    name = "fix";
    version = "20220121";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/fix/-/archive/20220121/archive.tar.gz";
      sha512 = "a851d8783c0c519c6e55359a5c471af433058872409c29a1a7bdfd0076813341ad2c0ebd1ce9e28bff4d4c729dfbc808c41c084fe12a42b45a2b5e391e77ccd2";
    };
    opam = "${repo}/packages/fix/fix.20220121/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  metapp = {
    name = "metapp";
    version = "0.4.3";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/metapp/releases/download/v0.4.3/metapp.0.4.3.tar.gz";
      sha512 = "4c22ceff2d70219263f27b3dc5bc6586d7db2b02310f0534851e2ac6efb493c5107ea7c51b7cc1888e89a4df3f3067336d5c58dc7468c0f26b32c926482267dc";
    };
    opam = "${repo}/packages/metapp/metapp.0.4.3/opam";
    depends = with self; [ dune ocaml ocamlfind ppxlib stdcompat ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  metaquot = {
    name = "metaquot";
    version = "0.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/metaquot/releases/download/v0.5.1/metaquot.0.5.1.tar.gz";
      sha512 = "96c864805f6d1a562780ea23b46eb8b886b9aba2214948824b7051c3e4058bf8170a5bca43c9c1b35c4b29bb347ccb2858c3ffe665e880ad276f6d0ec1bb2990";
    };
    opam = "${repo}/packages/metaquot/metaquot.0.5.1/opam";
    depends = with self; [ dune metapp ocaml ocamlfind ppxlib stdcompat ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
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
  ocaml-migrate-parsetree = {
    name = "ocaml-migrate-parsetree";
    version = "2.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-migrate-parsetree/releases/download/v2.3.0/ocaml-migrate-parsetree-2.3.0.tbz";
      sha256 = "108126b247f190e04c8afd3d72ced0b63ffdf73c3f801f09be5db0cd7280bf0a";
    };
    opam = "${repo}/packages/ocaml-migrate-parsetree/ocaml-migrate-parsetree.2.3.0/opam";
    depends = with self; [ dune ocaml ];
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
    version = "0.25.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.25.0/ppxlib-0.25.0.tbz";
      sha256 = "2d2f150e7715845dc578d254f705a67600be71c986b7e67e81befda612870bd5";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.25.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs ppx_derivers
                           sexplib0 stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  refl = {
    name = "refl";
    version = "0.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/refl/archive/v0.4.0.tar.gz";
      sha512 = "c158970749c1b7bacb8af1f88f0304d8d6cb0f532d3f876734489c3c4220d00f4d5aac6066e6d385ee70e1810ec65ffd47f0197bd5a6080f4d688cb3a386dc0a";
    };
    opam = "${repo}/packages/refl/refl.0.4.0/opam";
    depends = with self; [ dune fix metapp metaquot ocaml stdcompat traverse ];
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
  stdcompat = {
    name = "stdcompat";
    version = "18";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/stdcompat/releases/download/v18/stdcompat-18.tar.gz";
      sha512 = "4323a43d906121951f62ee8da4dec2c3be30540bbdca114096fa3ca655ba05342b429343d0b51df6e8173541e255e3bfe57a047147b27bca1f6bb22a15ce0013";
    };
    opam = "${repo}/packages/stdcompat/stdcompat.18/opam";
    depends = with self; [ ocaml (self.ocamlfind or null)
                           (self.result or null) (self.seq or null)
                           (self.uchar or null) ];
    buildDepends = with self; [ ocaml (self.ocamlfind or null) ];
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
  traverse = {
    name = "traverse";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/thierry-martinez/traverse/archive/v0.3.0.tar.gz";
      sha512 = "a29798bf912dc2c2ddce06aafc63f88fce4bf5dd35884c2e2c7b7caa1b2d8e95122e6f6d3b675965145853f530fad856740201f2f349561a15e78591a56e10fe";
    };
    opam = "${repo}/packages/traverse/traverse.0.3.0/opam";
    depends = with self; [ dune metapp metaquot ocaml stdcompat ];
    buildDepends = with self; [ dune ocaml ];
  };
}
