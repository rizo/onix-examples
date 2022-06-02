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
  conf-gsl = {
    name = "conf-gsl";
    version = "2";
    opam = "${repo}/packages/conf-gsl/conf-gsl.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.gsl or null) (pkgs.gsl-dev or null)
                           (pkgs.gsl-devel or null) (pkgs.libgsl-dev or null)
                           (pkgs.libgsl-devel or null) ];
  };
  conf-ncurses = {
    name = "conf-ncurses";
    version = "1";
    opam = "${repo}/packages/conf-ncurses/conf-ncurses.1/opam";
    depexts = with pkgs; [ ncurses ];
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
  curses = {
    name = "curses";
    version = "1.0.10";
    src = pkgs.fetchurl {
      url = "https://github.com/mbacarella/curses/releases/download/1.0.10/curses-1.0.10.tbz";
      sha256 = "c9126f9798f0c5b3beb05efe89c7713cf655c1ffbe040a52f218aeba291922af";
    };
    opam = "${repo}/packages/curses/curses.1.0.10/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ conf-ncurses conf-pkg-config dune
                                dune-configurator ocaml ];
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
  gsl = {
    name = "gsl";
    version = "1.24.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/gsl-ocaml/releases/download/1.24.3/gsl-1.24.3.tbz";
      sha256 = "366f2becd41603fd64b1e5f5e9b5b5556c648c18b62e3c6344542898d763ffd6";
    };
    opam = "${repo}/packages/gsl/gsl.1.24.3/opam";
    depends = with self; [ dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-gsl conf-pkg-config dune ocaml ];
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
  orpie = {
    name = "orpie";
    version = "1.6.1";
    src = pkgs.fetchurl {
      url = "https://github.com/pelzlpj/orpie/archive/release-1.6.1.tar.gz";
      sha512 = "df998e96cef53ef595178dfb9b51a17d5b22a8ccd894a543fa3130e5ab2204ea367706a79b1f53307f97c22ec7ce866be2097a4588ffeb0479d804f56706f248";
    };
    opam = "${repo}/packages/orpie/orpie.1.6.1/opam";
    depends = with self; [ curses dune gsl num ocaml ];
    buildDepends = with self; [ camlp5 dune ocaml ];
  };
}
