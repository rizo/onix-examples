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
  bisect_ppx = {
    name = "bisect_ppx";
    version = "2.8.1";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/bisect_ppx/archive/2.8.1.tar.gz";
      sha256 = "14wdqigd98c3fq0hv6sqjwh3hnd9ac0rr2yvpn3i96nlp3d944nm";
    };
    opam = "${repo}/packages/bisect_ppx/bisect_ppx.2.8.1/opam";
    depends = with self; [ base-unix cmdliner dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
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
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  pf-qubes = {
    name = "pf-qubes";
    version = "0.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/roburio/ocaml-pf/releases/download/v0.1.1/pf-qubes-v0.1.1.tbz";
      sha256 = "4e21b305a83a5e4e4972d776298a05b4a9a177c8ad5a232f88654eed2909a7cf";
    };
    opam = "${repo}/packages/pf-qubes/pf-qubes.0.1.1/opam";
    depends = with self; [ angstrom bisect_ppx cstruct dune fmt ipaddr logs
                           ocaml rresult uri ];
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
}
