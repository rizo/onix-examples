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
  camlp4 = {
    name = "camlp4";
    version = "4.14+1";
    src = pkgs.fetchurl {
      url = "https://github.com/camlp4/camlp4/archive/refs/tags/4.14+1.tar.gz";
      sha512 = "7838bcfc88edec73667669ea6562435b946e79f0b4a0e8117a83b403936337f08aaf8abe39d8f800483d77381ae122fc89aa68505cf60ec2f1cc835a04da93f2";
    };
    opam = "${repo}/packages/camlp4/camlp4.4.14+1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
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
  obytelib = {
    name = "obytelib";
    version = "1.6";
    src = pkgs.fetchurl {
      url = "https://github.com/bvaugon/obytelib/archive/refs/tags/1.6.tar.gz";
      sha256 = "0mvsb2iaxw0zxsmbbvdvl4y95ssbdj0rdzf2gvq920wqpqs620z7";
    };
    opam = "${repo}/packages/obytelib/obytelib.1.6/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
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
  ocamlclean = {
    name = "ocamlclean";
    version = "2.3";
    src = pkgs.fetchurl {
      url = "https://github.com/bvaugon/ocamlclean/archive/refs/tags/2.3.tar.gz";
      sha256 = "0y8p7kgxshs3mlb1lcbq5p9lkdc8q6h00xapkid8x5xj37caa9dy";
    };
    opam = "${repo}/packages/ocamlclean/ocamlclean.2.3/opam";
    depends = with self; [ obytelib ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
  ocapic = {
    name = "ocapic";
    version = "3.5";
    src = pkgs.fetchurl {
      url = "https://github.com/bvaugon/ocapic/archive/refs/tags/3.5.tar.gz";
      sha256 = "165j6lwnc7x8l6y33xl6ni4k3prls4ycqccvsyl92fpcpplhiln2";
    };
    opam = "${repo}/packages/ocapic/ocapic.3.5/opam";
    depends = with self; [ camlp4 graphics obytelib ocaml ocamlclean ];
    buildDepends = with self; [ ocaml ocamlbuild ];
  };
}
