{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
  bos = {
    name = "bos";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/bos/releases/bos-0.2.1.tbz";
      sha512 = "8daeb8a4c2dd1f2460f6274ada19f4f1b6ebe875ff83a938c93418ce0e6bdb74b8afc5c9a7d410c1c9df2dad030e4fa276b6ed2da580639484e8b5bc92610b1d";
    };
    opam = "${repo}/packages/bos/bos.0.2.1/opam";
    depends = with self; [ astring base-unix fmt fpath logs ocaml rresult ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  camlp5 = {
    name = "camlp5";
    version = "8.00.02";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/camlp5/archive/rel8.00.02.tar.gz";
      sha512 = "b9950cac70e77d62f147dc8edac0aef2a2bb563ca7bbc709dcf030e2536a0973188414c8612f8b2441a6e05c4d09579bc474974513bf0c59ad4702a46a0cc7f6";
    };
    opam = "${repo}/packages/camlp5/camlp5.8.00.02/opam";
    depends = with self; [ conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
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
  conf-m4 = {
    name = "conf-m4";
    version = "1";
    opam = "${repo}/packages/conf-m4/conf-m4.1/opam";
    depexts = with pkgs; [ m4 ];
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
  fpath = {
    name = "fpath";
    version = "0.7.3";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fpath/releases/fpath-0.7.3.tbz";
      sha256 = "03z7mj0sqdz465rc4drj1gr88l9q3nfs374yssvdjdyhjbqqzc0j";
    };
    opam = "${repo}/packages/fpath/fpath.0.7.3/opam";
    depends = with self; [ astring ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  hashcons = {
    name = "hashcons";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocaml-hashcons/archive/1.3.tar.gz";
      sha256 = "1kkjbm5dnvnf58bh0hqxm0yjvdc0l7n9k46l9mlpr9lfyik2kisr";
    };
    opam = "${repo}/packages/hashcons/hashcons.1.3/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ conf-autoconf conf-which ocaml ocamlfind ];
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
  not-ocamlfind = {
    name = "not-ocamlfind";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/chetmurthy/not-ocamlfind/archive/0.07.02.tar.gz";
      sha512 = "b4ba4a1133a57e1cb1a44f4472c698ba3df02e4526524f09cd481ed0b4a875b5fea6b2968588efc88f38f4f599ee9f8ce69731e21a632fb5c44d9525c1ff27e6";
    };
    opam = "${repo}/packages/not-ocamlfind/not-ocamlfind.0.08/opam";
    depends = with self; [ conf-which fmt ocamlfind ocamlgraph rresult ];
    buildDepends = with self; [ conf-m4 ocamlfind ];
    depexts = with pkgs; [ (pkgs.xdot or null) ];
  };
  ocaml = {
    name = "ocaml";
    version = "4.13.1";
    opam = "${repo}/packages/ocaml/ocaml.4.13.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.13.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.13.1.tar.gz";
      sha256 = "194c7988cc1fd1c64f53f32f2f7551e5309e44d914d6efc7e2e4d002296aeac4";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.13.1/opam";
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
  pa_ppx = {
    name = "pa_ppx";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/pa_ppx/archive/0.08.tar.gz";
      sha512 = "be0d9dec53d740c5b98324c94b572d7aa264dafdd727d9e25fd35eafd5fe33c22809edb018bbb595ac0e156d1d506411c80e44ddfb7510e37fbd749819d4c864";
    };
    opam = "${repo}/packages/pa_ppx/pa_ppx.0.08/opam";
    depends = with self; [ bos camlp5 conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote not-ocamlfind ocaml
                           ounit pcre result sexplib0 uint yojson ];
    buildDepends = with self; [ ocaml ];
  };
  pa_ppx_ag = {
    name = "pa_ppx_ag";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/pa_ppx_ag/archive/0.08.tar.gz";
      sha512 = "786910ca5e1c7654b8c6d2af1e8db85150d9953f969051cf8f4487e0893d8eaf145c6bc5195761172ff17a2426073ce87facf65d31abc2401e83b7e999f47d7e";
    };
    opam = "${repo}/packages/pa_ppx_ag/pa_ppx_ag.0.08/opam";
    depends = with self; [ bos camlp5 conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote not-ocamlfind ocaml
                           ocamlgraph pa_ppx pa_ppx_hashcons pa_ppx_migrate
                           pa_ppx_unique pcre vec ];
    buildDepends = with self; [ ocaml ];
  };
  pa_ppx_hashcons = {
    name = "pa_ppx_hashcons";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/pa_ppx_hashcons/archive/0.08.tar.gz";
      sha512 = "2f6306a7794bcad347aed6915c44349681463102426e3f741564ec439eee6eb6b12d7f65219d63d35a578a7fb374f6298f98a7730b7e290a6af11cc9b111b320";
    };
    opam = "${repo}/packages/pa_ppx_hashcons/pa_ppx_hashcons.0.08/opam";
    depends = with self; [ bos camlp5 conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote hashcons not-ocamlfind
                           ocaml pa_ppx pcre ];
    buildDepends = with self; [ ocaml ];
  };
  pa_ppx_migrate = {
    name = "pa_ppx_migrate";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/pa_ppx_migrate/archive/0.08.tar.gz";
      sha512 = "ade97571b1c6160579b9b9d29fcc85d1739bfaf6ca20b962780bac0fbd06b6c151f9abc4e0ebc08dc338e981e4718275f08169d0d4256fa27773d1a748eb3341";
    };
    opam = "${repo}/packages/pa_ppx_migrate/pa_ppx_migrate.0.08/opam";
    depends = with self; [ bos camlp5 conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote not-ocamlfind ocaml
                           pa_ppx pcre ];
    buildDepends = with self; [ ocaml ];
  };
  pa_ppx_unique = {
    name = "pa_ppx_unique";
    version = "0.08";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp5/pa_ppx_unique/archive/0.08.tar.gz";
      sha512 = "1d74f235b061a744a5ffb962eeb0c8b6d90d31c9782f6ff4ba9c441eedf023de0948fc89fd3a370e36649d4d4c63bf83d27e8a31b9c341783534ceb02f473170";
    };
    opam = "${repo}/packages/pa_ppx_unique/pa_ppx_unique.0.08/opam";
    depends = with self; [ bos camlp5 conf-perl conf-perl-ipc-system-simple
                           conf-perl-string-shellquote not-ocamlfind ocaml
                           pa_ppx pcre ];
    buildDepends = with self; [ ocaml ];
  };
  pcre = {
    name = "pcre";
    version = "7.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/pcre-ocaml/releases/download/7.5.0/pcre-7.5.0.tbz";
      sha256 = "671142f40b6d86171cbc067253faadf903019161d57488bd0fb6c5456c2cbd1a";
    };
    opam = "${repo}/packages/pcre/pcre.7.5.0/opam";
    depends = with self; [ base-bytes dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-libpcre dune ocaml ];
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
  uint = {
    name = "uint";
    version = "2.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/andrenth/ocaml-uint/archive/2.0.1.tar.gz";
      sha512 = "6ecb73813b6636c631a1ea4aa8994f3285e8b5e22e35f33828534b05b1f6f9d54f1f38f822a3512e95bbdba92cc8ee98df472fcbeb9884aeeefc73c038d9084a";
    };
    opam = "${repo}/packages/uint/uint.2.0.1/opam";
    depends = with self; [ dune ocaml stdint ];
    buildDepends = with self; [ dune ocaml ];
  };
  vec = {
    name = "vec";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/aionescu/vec/archive/v0.3.0.tar.gz";
      sha512 = "ca7b54ae412d5a95c66843bdec0ca5436216e55052fba463d29e7a813ba5b9b1af0e54024b95baccb6c75dd0c42cb74c3e0c8aa5a52abb8d71b344cb2d171054";
    };
    opam = "${repo}/packages/vec/vec.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
}
