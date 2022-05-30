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
  conf-gles2 = {
    name = "conf-gles2";
    version = "1";
    opam = "${repo}/packages/conf-gles2/conf-gles2.1/opam";
    depexts = with pkgs; [ (pkgs.Mesa-libGLESv2-devel or null)
                           (pkgs.MesaLib or null)
                           (pkgs.libgles2-mesa-dev or null)
                           (pkgs.mesa or null) (pkgs.mesa-dev or null)
                           (pkgs.mesa-libGLES-devel or null)
                           (pkgs.mesa-libs or null) ];
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
  gg = {
    name = "gg";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/gg/releases/gg-1.0.0.tbz";
      sha512 = "86e3db9778103c6a9e3444585716c12dba0ba1af6b60e7b76f9cf282a23aa4cb075c764c470e9a878c3c90fe4a41e835be9180aaf0a4bc43ce3ad299b352e611";
    };
    opam = "${repo}/packages/gg/gg.1.0.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  grenier = {
    name = "grenier";
    version = "0.14";
    src = pkgs.fetchurl {
      url = "https://github.com/let-def/grenier/releases/download/v0.14/grenier-0.14.tbz";
      sha256 = "e5362e6ad0e888526517415e78b9e8243bb0cc1b0c952201884148832ac4442f";
    };
    opam = "${repo}/packages/grenier/grenier.0.14/opam";
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
  stb_image = {
    name = "stb_image";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/let-def/stb_image/archive/v0.5.tar.gz";
      sha512 = "4d051e0c33d95527c01eab33d6fe07dce4c5f2d7f7e0b136fbfac1a8c092a645efc1d867fbd34403dd1c4797b73647caebf07ecb95f94d317dc8a15e23ddddb5";
    };
    opam = "${repo}/packages/stb_image/stb_image.0.5/opam";
    depends = with self; [ ocaml result ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  stb_truetype = {
    name = "stb_truetype";
    version = "0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/let-def/stb_truetype/archive/v0.6.tar.gz";
      sha256 = "0gl39mhb1fvikrk5fh1f2fz4hm4hr84lxv32jwmmbmydm1l17mz5";
    };
    opam = "${repo}/packages/stb_truetype/stb_truetype.0.6/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
  wall = {
    name = "wall";
    version = "0.4.1";
    src = pkgs.fetchurl {
      url = "https://github.com/let-def/wall/releases/download/v0.4.1/wall-v0.4.1.tbz";
      sha256 = "fbcbba6a938aba99ba32d1113d2c9aa95c7c420fe7e750be6940eedafd9b93a9";
    };
    opam = "${repo}/packages/wall/wall.0.4.1/opam";
    depends = with self; [ conf-gles2 dune gg grenier ocaml result stb_image
                           stb_truetype ];
    buildDepends = with self; [ dune ocaml ];
  };
}
