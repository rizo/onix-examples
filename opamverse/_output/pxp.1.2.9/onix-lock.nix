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
  ocamlnet = {
    name = "ocamlnet";
    version = "4.1.9+2";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/ocamlnet-4.1.9.tar.gz";
      sha256 = "f98ed19979848f1949b1b001e30ac132b254d0f4a705150c6dcf9094bbec9cee";
    };
    opam = "${repo}/packages/ocamlnet/ocamlnet.4.1.9-2/opam";
    depends = with self; [ base-bytes ocaml ocamlfind (self.camlzip or null)
                           (self.conf-gnutls or null)
                           (self.conf-gssapi or null) (self.lablgtk or null)
                           (self.pcre or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  pxp = {
    name = "pxp";
    version = "1.2.9";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/pxp-1.2.9.tar.gz";
      sha256 = "0yqwmcshh1f236qpiw88dqwpk2mjmqrcbq5wpk8fkdqkb4q8zfmi";
    };
    opam = "${repo}/packages/pxp/pxp.1.2.9/opam";
    depends = with self; [ ocaml ocamlnet ulex ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  ulex = {
    name = "ulex";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/whitequark/ulex/archive/v1.2.tar.gz";
      sha256 = "16gnbhqs6y2v89vw4igzvxdf2g8ybh5643636824aldcv8sscac0";
    };
    opam = "${repo}/packages/ulex/ulex.1.2/opam";
    depends = with self; [ base-bytes camlp4 ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
}
