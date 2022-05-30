{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  apron = {
    name = "apron";
    version = "v0.9.13";
    src = pkgs.fetchurl {
      url = "https://github.com/antoinemine/apron/archive/v0.9.13.tar.gz";
      sha512 = "62b73925ae41cead924c6077380be98e2e2fc0c02b1bff0a77293dc065126ae651793883783e497228f8261ffd47311d5a08cfd1875d3da3cc113ae428fa2c61";
    };
    opam = "${repo}/packages/apron/apron.v0.9.13/opam";
    depends = with self; [ camlidl conf-perl mlgmpidl ocaml
                           (self.conf-ppl or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  apronext = {
    name = "apronext";
    version = "1.0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ghilesZ/apronext/archive/1.0.4.tar.gz";
      sha512 = "6886bc6f09584b5b9e1e48f0ef2ddafdf0de9c42498d9f8c5293adfbec363706a37e4334a2b0852d1b95cb08f41c511b5a41889b94f178f46b8815f264c740a0";
    };
    opam = "${repo}/packages/apronext/apronext.1.0.4/opam";
    depends = with self; [ apron dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
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
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
}
