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
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-gnuplot = {
    name = "conf-gnuplot";
    version = "0.1";
    opam = "${repo}/packages/conf-gnuplot/conf-gnuplot.0.1/opam";
    depexts = with pkgs; [ (pkgs.gnuplot or null) (pkgs.gnuplot-x11 or null) ];
  };
  conf-r = {
    name = "conf-r";
    version = "1.0.0";
    opam = "${repo}/packages/conf-r/conf-r.1.0.0/opam";
    depexts = with pkgs; [ R ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  cpm = {
    name = "cpm";
    version = "4.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/cpmlib/archive/v4.0.0.tar.gz";
      sha256 = "1jpmlj50q59k8yl5fpil3vwyrwqn27wv12727hcb1sdjk8r2vgij";
    };
    opam = "${repo}/packages/cpm/cpm.4.0.0/opam";
    depends = with self; [ batteries jbuilder ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  cpu = {
    name = "cpu";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/cpu/archive/v2.0.0.tar.gz";
      sha256 = "1aga2cal07nfqgsfgn41gbdb7dyhj5l4967dq6vzpznrbyp2y09q";
    };
    opam = "${repo}/packages/cpu/cpu.2.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ conf-autoconf dune ocaml ];
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
  jbuilder = {
    name = "jbuilder";
    version = "1.0+beta20.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/1.0%2Bbeta20.2/jbuilder-1.0+beta20.2.tbz";
      sha256 = "1516rq0x0481bfg9436k1c74346y8nw45shizsnkwylfdj9p8p65";
    };
    opam = "${repo}/packages/jbuilder/jbuilder.1.0+beta20.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  minicli = {
    name = "minicli";
    version = "5.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/minicli/archive/v5.0.2.tar.gz";
      sha256 = "076fpqwg4mwyac23wkjrrzw1rha2bsjzjirlh2gxg0hz5brslq3n";
    };
    opam = "${repo}/packages/minicli/minicli.5.0.2/opam";
    depends = with self; [ dune ocaml ];
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
  odnnr = {
    name = "odnnr";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/odnnr/archive/v2.0.0.tar.gz";
      sha256 = "1kzvwl6f9cs0jw9z1v1yb7v1rpp0n51yd3wk5kd1fpvcnd2pm6hx";
    };
    opam = "${repo}/packages/odnnr/odnnr.2.0.0/opam";
    depends = with self; [ batteries conf-gnuplot conf-r cpm dolog dune
                           minicli ocaml parany ];
    buildDepends = with self; [ dune ocaml ];
  };
  parany = {
    name = "parany";
    version = "12.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/UnixJunkie/parany/archive/v12.2.0.tar.gz";
      sha256 = "1k1xrx7zdgw72ahksdabd7wilds8hjngbc95q4l5wp05gqml6i4k";
    };
    opam = "${repo}/packages/parany/parany.12.2.0/opam";
    depends = with self; [ base-unix cpu dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
