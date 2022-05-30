{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  alt-ergo = {
    name = "alt-ergo";
    version = "1.30";
    src = pkgs.fetchurl {
      url = "http://alt-ergo.ocamlpro.com/http/alt-ergo-1.30/alt-ergo-1.30.tar.gz";
      sha256 = "025pacb4ax864fn5x8k78mw6hiig4jcazblj18gzxspg4f1l5n1g";
    };
    opam = "${repo}/packages/alt-ergo/alt-ergo.1.30/opam";
    depends = with self; [ camlzip num ocaml ocplib-simplex zarith ];
    buildDepends = with self; [ ocaml ];
  };
  camlzip = {
    name = "camlzip";
    version = "1.07";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/camlzip/archive/rel107.zip";
      sha256 = "1bm76wd794psndwyswk2fnzbhrp8n2hiyhn5b3n39n8vwylb7aw5";
    };
    opam = "${repo}/packages/camlzip/camlzip.1.07/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
    depexts = with pkgs; [ unzip zlib ];
  };
  conf-autoconf = {
    name = "conf-autoconf";
    version = "0.1";
    opam = "${repo}/packages/conf-autoconf/conf-autoconf.0.1/opam";
    buildDepends = with self; [ conf-which ];
    depexts = with pkgs; [ autoconf ];
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
  fm-simplex-plugin = {
    name = "fm-simplex-plugin";
    version = "1.30";
    src = pkgs.fetchurl {
      url = "http://alt-ergo.ocamlpro.com/http/alt-ergo-1.30/alt-ergo-1.30.tar.gz";
      sha256 = "025pacb4ax864fn5x8k78mw6hiig4jcazblj18gzxspg4f1l5n1g";
    };
    opam = "${repo}/packages/fm-simplex-plugin/fm-simplex-plugin.1.30/opam";
    depends = with self; [ alt-ergo camlzip ocaml ocplib-simplex zarith ];
    buildDepends = with self; [ ocaml ];
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
  ocplib-simplex = {
    name = "ocplib-simplex";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro-Iguernlala/ocplib-simplex/archive/0.3.tar.gz";
      sha256 = "0w8id219bv5pn9fgcr0m1pixchqk1qz80h4i0997sh72jc2lbgsr";
    };
    opam = "${repo}/packages/ocplib-simplex/ocplib-simplex.0.3/opam";
    depends = with self; [ num ocaml ];
    buildDepends = with self; [ conf-autoconf ocaml ocamlfind ];
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
