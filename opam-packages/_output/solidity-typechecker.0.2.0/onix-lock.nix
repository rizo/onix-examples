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
  blake2 = {
    name = "blake2";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://gitlab.com/nomadic-labs/ocaml-blake2/-/archive/v0.3/ocaml-blake2-v0.3.tar.gz";
      sha256 = "16fb4d70b1a312e2647782973a1cb61f8e63b493d8f9b17919ebbb5d12b84798";
    };
    opam = "${repo}/packages/blake2/blake2.0.3/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
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
  ez_hash = {
    name = "ez_hash";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocaml-solidity/archive/v0.2.0.tar.gz";
      sha256 = "d5d0f31101413c9a36d6a37973aa03fde788644808f34dbff0220ee45c17ece4";
    };
    opam = "${repo}/packages/ez_hash/ez_hash.0.2.0/opam";
    depends = with self; [ blake2 dune ocaml ];
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
  solidity-common = {
    name = "solidity-common";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocaml-solidity/archive/v0.2.0.tar.gz";
      sha256 = "d5d0f31101413c9a36d6a37973aa03fde788644808f34dbff0220ee45c17ece4";
    };
    opam = "${repo}/packages/solidity-common/solidity-common.0.2.0/opam";
    depends = with self; [ dune fileutils hex ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  solidity-parser = {
    name = "solidity-parser";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocaml-solidity/archive/v0.2.0.tar.gz";
      sha256 = "d5d0f31101413c9a36d6a37973aa03fde788644808f34dbff0220ee45c17ece4";
    };
    opam = "${repo}/packages/solidity-parser/solidity-parser.0.2.0/opam";
    depends = with self; [ dune hex menhir ocaml solidity-common ];
    buildDepends = with self; [ dune ocaml ];
  };
  solidity-typechecker = {
    name = "solidity-typechecker";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocaml-solidity/archive/v0.2.0.tar.gz";
      sha256 = "d5d0f31101413c9a36d6a37973aa03fde788644808f34dbff0220ee45c17ece4";
    };
    opam = "${repo}/packages/solidity-typechecker/solidity-typechecker.0.2.0/opam";
    depends = with self; [ dune ez_hash ocaml solidity-common solidity-parser
                           uutf ];
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
}
