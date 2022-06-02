{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  angstrom = {
    name = "angstrom";
    version = "0.13.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/angstrom/archive/0.13.0.tar.gz";
      sha256 = "08zbjixwkhrkbyhp2raap1b8ah502piwaadzydmb82ivgc6h94k7";
    };
    opam = "${repo}/packages/angstrom/angstrom.0.13.0/opam";
    depends = with self; [ bigstringaf dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  asn1-combinators = {
    name = "asn1-combinators";
    version = "0.2.0+1";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-asn1-combinators/releases/download/v0.2.0/asn1-combinators-0.2.0.tbz";
      sha256 = "1cgkrx13bvkxa66qparv3ginx7ycdincx3n6jgrym62g945pz78h";
    };
    opam = "${repo}/packages/asn1-combinators/asn1-combinators.0.2.0-1/opam";
    depends = with self; [ bigarray-compat cstruct ocaml ptime result zarith ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  base = {
    name = "base";
    version = "v0.14.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base/archive/v0.14.3.tar.gz";
      sha256 = "e34dc0dd052a386c84f5f67e71a90720dff76e0edd01f431604404bee86ebe5a";
    };
    opam = "${repo}/packages/base/base.v0.14.3/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
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
  cmdliner = {
    name = "cmdliner";
    version = "1.0.4";
    src = pkgs.fetchurl {
      url = "http://erratique.ch/software/cmdliner/releases/cmdliner-1.0.4.tbz";
      sha256 = "1h04q0zkasd0mw64ggh4y58lgzkhg6yhzy60lab8k8zq9ba96ajw";
    };
    opam = "${repo}/packages/cmdliner/cmdliner.1.0.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  coin = {
    name = "coin";
    version = "0.1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/coin/releases/download/v0.1.4/coin-0.1.4.tbz";
      sha256 = "93a97199da5ca20fba02db6a47d70c8362f06fd8019736bc2a3386c635c6c900";
    };
    opam = "${repo}/packages/coin/coin.0.1.4/opam";
    depends = with self; [ dune ocaml re ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  colombe = {
    name = "colombe";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/colombe/releases/download/v0.1.0/colombe-v0.1.0.tbz";
      sha256 = "77e1058f787de49e07abc6ac26db015b174538570dac0ba428d1c665407537c6";
    };
    opam = "${repo}/packages/colombe/colombe.0.1.0/opam";
    depends = with self; [ angstrom base64 cstruct domain-name dune fmt hxd
                           ipaddr logs ocaml rresult tls
                           (self.mrmime or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-libmagic = {
    name = "conf-libmagic";
    version = "1";
    opam = "${repo}/packages/conf-libmagic/conf-libmagic.1/opam";
    depexts = with pkgs; [ (pkgs.file-dev or null) (pkgs.file-devel or null)
                           (pkgs.libmagic or null)
                           (pkgs.libmagic-dev or null) ];
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
  cpuid = {
    name = "cpuid";
    version = "0.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/cpuid/releases/download/v0.1.2/cpuid-v0.1.2.tbz";
      sha256 = "08ng4mva6qblb5ipkrxbr0my7ndkc4qwcbswkqgbgir864s74m93";
    };
    opam = "${repo}/packages/cpuid/cpuid.0.1.2/opam";
    depends = with self; [ dune ocaml ];
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
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct/cstruct.5.2.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-lwt = {
    name = "cstruct-lwt";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct-lwt/cstruct-lwt.5.2.0/opam";
    depends = with self; [ base-unix cstruct dune lwt ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  cstruct-sexp = {
    name = "cstruct-sexp";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/cstruct-sexp/cstruct-sexp.5.2.0/opam";
    depends = with self; [ cstruct dune ocaml sexplib ];
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
  emile = {
    name = "emile";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/emile/releases/download/v0.6/emile-v0.6.tbz";
      sha256 = "da1e2891c1e18937d7f742e49f34780c7c36d99fa313addb1a4a45a783cf6d1a";
    };
    opam = "${repo}/packages/emile/emile.0.6/opam";
    depends = with self; [ angstrom base64 bigstringaf dune fmt ipaddr ocaml
                           pecu uutf (self.mrmime or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  facteur = {
    name = "facteur";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/facteur/releases/download/v0.1.0/facteur-v0.1.0.tbz";
      sha256 = "56e9eb6cbfff8bf9788913ce2c549b1d57731f77b4f3cbc7849d343748ae2cac";
    };
    opam = "${repo}/packages/facteur/facteur.0.1.0/opam";
    depends = with self; [ astring cmdliner colombe conf-libmagic domain-name
                           dune emile fmt fpath logs mrmime ocaml
                           sendmail-lwt x509 ];
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
  gmap = {
    name = "gmap";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/hannesm/gmap/releases/download/0.3.0/gmap-0.3.0.tbz";
      sha256 = "04dd9e6226ac8f8fb4ccb6021048702e34a482fb9c1d240d3852829529507c1c";
    };
    opam = "${repo}/packages/gmap/gmap.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  hxd = {
    name = "hxd";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/hxd/releases/download/v0.1.0/hxd-v0.1.0.tbz";
      sha256 = "0a0ad52f9441e8eed59115dc0af67ad50caf10b0334a8b61ce0565afad4ff0db";
    };
    opam = "${repo}/packages/hxd/hxd.0.1.0/opam";
    depends = with self; [ angstrom base-bigarray base-bytes base-unix
                           cmdliner dune fmt fpath ocaml rresult ];
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
  ke = {
    name = "ke";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ke/releases/download/v0.6/ke-0.6.tbz";
      sha256 = "61217207e2200b04b17759736610ff9208269a647f854cb5ae72cdac0d672305";
    };
    opam = "${repo}/packages/ke/ke.0.6/opam";
    depends = with self; [ dune fmt ocaml ];
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
  mirage-no-solo5 = {
    name = "mirage-no-solo5";
    version = "1";
    opam = "${repo}/packages/mirage-no-solo5/mirage-no-solo5.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  mirage-no-xen = {
    name = "mirage-no-xen";
    version = "1";
    opam = "${repo}/packages/mirage-no-xen/mirage-no-xen.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  mrmime = {
    name = "mrmime";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mrmime/releases/download/v0.1.0/mrmime-v0.1.0.tbz";
      sha256 = "51f818624667722012d69243673f5e40bdba95fcde2f33d46fb198d2d576c1af";
    };
    opam = "${repo}/packages/mrmime/mrmime.0.1.0/opam";
    depends = with self; [ angstrom base64 bigstringaf dune fmt ipaddr ke
                           ocaml pecu ptime rosetta rresult uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  nocrypto = {
    name = "nocrypto";
    version = "0.5.4+2";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-nocrypto/releases/download/v0.5.4/nocrypto-0.5.4.tbz";
      sha256 = "0zshi9hlhcz61n5z1k6fx6rsi0pl4xgahsyl2jp0crqkaf3hqwlg";
    };
    opam = "${repo}/packages/nocrypto/nocrypto.0.5.4-2/opam";
    depends = with self; [ cstruct cstruct-lwt lwt ocaml ppx_deriving
                           ppx_sexp_conv sexplib zarith
                           (self.mirage-entropy or null)
                           (self.mirage-no-solo5 or null)
                           (self.mirage-no-xen or null)
                           (self.mirage-solo5 or null)
                           (self.mirage-xen or null)
                           (self.zarith-freestanding or null)
                           (self.zarith-xen or null) ];
    buildDepends = with self; [ cpuid ocaml ocamlbuild ocamlfind ocb-stubblr
                                topkg ];
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
    version = "1";
    opam = "${repo}/packages/ocaml-config/ocaml-config.1/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-migrate-parsetree = {
    name = "ocaml-migrate-parsetree";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-migrate-parsetree/releases/download/v1.8.0/ocaml-migrate-parsetree-v1.8.0.tbz";
      sha256 = "b1c2d176ff1444041f2775786ba605be796e46dfd2acb06c96f35d2bb88b8fb5";
    };
    opam = "${repo}/packages/ocaml-migrate-parsetree/ocaml-migrate-parsetree.1.8.0/opam";
    depends = with self; [ dune ocaml ppx_derivers result ];
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
  ocb-stubblr = {
    name = "ocb-stubblr";
    version = "0.1.1+1";
    src = pkgs.fetchurl {
      url = "https://github.com/pqwy/ocb-stubblr/releases/download/v0.1.1/ocb-stubblr-0.1.1.tbz";
      sha256 = "167b7x1j21mkviq8dbaa0nmk4rps2ilvzwx02igsc2706784z72f";
    };
    opam = "${repo}/packages/ocb-stubblr/ocb-stubblr.0.1.1-1/opam";
    depends = with self; [ astring ocaml ocamlbuild topkg ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
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
  parsexp = {
    name = "parsexp";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/parsexp/archive/refs/tags/v0.14.2.tar.gz";
      sha256 = "f6e17e4e08dcdce08a6372485a381dcdb3fda0f71b4506d7be982b87b5a1f230";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.14.2/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  pecu = {
    name = "pecu";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/pecu/releases/download/v0.4/pecu-v0.4.tbz";
      sha256 = "77d3ce3b785257acce0b62d75db647707ad70b622f48f3c7b6109911d03cbc1e";
    };
    opam = "${repo}/packages/pecu/pecu.0.4/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cstruct = {
    name = "ppx_cstruct";
    version = "5.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-cstruct/releases/download/v5.2.0/cstruct-v5.2.0.tbz";
      sha256 = "6bfef3753fab08cc638c07ca39f68d629087768f6a5cfeffc519d42018956a75";
    };
    opam = "${repo}/packages/ppx_cstruct/ppx_cstruct.5.2.0/opam";
    depends = with self; [ cstruct dune ocaml ocaml-migrate-parsetree
                           ppx_tools_versioned sexplib stdlib-shims ];
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
  ppx_deriving = {
    name = "ppx_deriving";
    version = "5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_deriving/releases/download/v5.1/ppx_deriving-v5.1.tbz";
      sha256 = "b04f3b22b754e65af50812730695863192ae410e802e074b55ebbb8c4f73c4c4";
    };
    opam = "${repo}/packages/ppx_deriving/ppx_deriving.5.1/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ocamlfind
                           ppx_derivers ppxlib result ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
  };
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/v0.14.1.tar.gz";
      sha256 = "0lpm5bjxmrb5r21fqj6w9xdyhb22c40mic5h8pal8d5r9kf4gy6c";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_tools_versioned = {
    name = "ppx_tools_versioned";
    version = "5.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools_versioned/archive/5.4.0.tar.gz";
      sha256 = "0sw2676vgbsj133lgs3sl8494fhfldafzvgw4j4dnb1wqwha6pxy";
    };
    opam = "${repo}/packages/ppx_tools_versioned/ppx_tools_versioned.5.4.0/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.15.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.15.0/ppxlib-0.15.0.tbz";
      sha256 = "0b630d7f8d74a899a55cc27188b5ce03e735a93f07ea0c2de56532d8fd93b330";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.15.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs
                           ocaml-migrate-parsetree ppx_derivers sexplib0
                           stdlib-shims ];
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
  rosetta = {
    name = "rosetta";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/rosetta/releases/download/v0.3.0/rosetta-v0.3.0.tbz";
      sha256 = "dffb638f78af6b03f23b285137538bb2575f67ecddbecab3ee7248b4de284564";
    };
    opam = "${repo}/packages/rosetta/rosetta.0.3.0/opam";
    depends = with self; [ coin dune ocaml uuuu yuscii ];
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
  sendmail = {
    name = "sendmail";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/colombe/releases/download/v0.1.0/colombe-v0.1.0.tbz";
      sha256 = "77e1058f787de49e07abc6ac26db015b174538570dac0ba428d1c665407537c6";
    };
    opam = "${repo}/packages/sendmail/sendmail.0.1.0/opam";
    depends = with self; [ colombe dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  sendmail-lwt = {
    name = "sendmail-lwt";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/dinosaure/colombe/releases/download/v0.1.0/colombe-v0.1.0.tbz";
      sha256 = "77e1058f787de49e07abc6ac26db015b174538570dac0ba428d1c665407537c6";
    };
    opam = "${repo}/packages/sendmail-lwt/sendmail-lwt.0.1.0/opam";
    depends = with self; [ domain-name dune lwt ocaml sendmail tls x509 ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  sexplib = {
    name = "sexplib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib-v0.14.0.tar.gz";
      sha256 = "12rlnc6fcrjfdn3gs2agi418sj54ighhs6dfll37zcv7mgywblm2";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.14.0/opam";
    depends = with self; [ dune num ocaml parsexp sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib0-v0.14.0.tar.gz";
      sha256 = "0adrc0r1vvvr41dcpj8jwkzh1dfgqf0mks9xlnnskqfm3a51iavg";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.14.0/opam";
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
  tls = {
    name = "tls";
    version = "0.10.6";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-tls/releases/download/v0.10.6/tls-0.10.6.tbz";
      sha256 = "36a61fcd4b08ae099538d9e71e8d24f518f5be4f735d0384c0e19da0496dbfb4";
    };
    opam = "${repo}/packages/tls/tls.0.10.6/opam";
    depends = with self; [ cstruct cstruct-sexp domain-name fmt lwt nocrypto
                           ocaml ppx_cstruct ppx_deriving ppx_sexp_conv
                           sexplib x509 (self.mirage-clock or null)
                           (self.mirage-flow or null)
                           (self.mirage-kv or null) (self.ptime or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
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
  uuuu = {
    name = "uuuu";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/uuuu/releases/download/v0.3.0/uuuu-0.3.0.tbz";
      sha256 = "6b7ee8f3e343813b0c6ac8ddb7f6720b2ccd27b4208313d3bcff5d7d984fc3a6";
    };
    opam = "${repo}/packages/uuuu/uuuu.0.3.0/opam";
    depends = with self; [ dune ocaml ocamlfind re ];
    buildDepends = with self; [ dune ocaml ocamlfind ];
  };
  x509 = {
    name = "x509";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirleft/ocaml-x509/releases/download/v0.9.0/x509-v0.9.0.tbz";
      sha256 = "742c9450821b16922f8709eaaaa871b88e2f160d8fae990448ddc0a7947e7795";
    };
    opam = "${repo}/packages/x509/x509.0.9.0/opam";
    depends = with self; [ asn1-combinators cstruct domain-name dune fmt gmap
                           nocrypto ocaml ptime rresult ];
    buildDepends = with self; [ dune ocaml ];
  };
  yuscii = {
    name = "yuscii";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/yuscii/releases/download/v0.3.0/yuscii-v0.3.0.tbz";
      sha256 = "ef8d87ed575d14547326887930f9d8c0a638d35c40889d5aacec79c45d5074b1";
    };
    opam = "${repo}/packages/yuscii/yuscii.0.3.0/opam";
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
}
