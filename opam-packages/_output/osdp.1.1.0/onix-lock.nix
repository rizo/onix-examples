{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
  };
  conf-csdp = {
    name = "conf-csdp";
    version = "1";
    opam = "${repo}/packages/conf-csdp/conf-csdp.1/opam";
    depexts = with pkgs; [ (pkgs.coin-or-csdp or null)
                           (pkgs.coinor-csdp or null)
                           (pkgs.csdp-tools or null) ];
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
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
  ocplib-simplex = {
    name = "ocplib-simplex";
    version = "0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro-Iguernlala/ocplib-simplex/archive/v0.4.tar.gz";
      sha256 = "0y6q4bgly7fisdklriww48aknqf2vg4dphr7wwnd1wh80l4anzg1";
    };
    opam = "${repo}/packages/ocplib-simplex/ocplib-simplex.0.4/opam";
    depends = with self; [ num ocaml ];
    buildDepends = with self; [ conf-autoconf ocaml ocamlfind ];
  };
  osdp = {
    name = "osdp";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/Embedded-SW-VnV/osdp/archive/refs/tags/v1.1.0.tar.gz";
      sha512 = "4def6516b6af9f9af8e988a7bbe9af14ac25cea22ef93fd05a485b50e1ac7198498f34100880fbef41819ccdbda231aeff475dfa7fade81885da9a3fe94837d9";
    };
    opam = "${repo}/packages/osdp/osdp.1.1.0/opam";
    depends = with self; [ conf-csdp ocplib-simplex zarith
                           (self.conf-sdpa or null) ];
    buildDepends = with self; [ conf-autoconf ocamlbuild ocamlfind ];
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
