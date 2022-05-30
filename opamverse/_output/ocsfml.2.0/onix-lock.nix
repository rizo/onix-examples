{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-boost = {
    name = "conf-boost";
    version = "1";
    opam = "${repo}/packages/conf-boost/conf-boost.1/opam";
    depexts = with pkgs; [ boost ];
  };
  conf-cmake = {
    name = "conf-cmake";
    version = "1";
    opam = "${repo}/packages/conf-cmake/conf-cmake.1/opam";
    depexts = with pkgs; [ (pkgs.cmake or null) (pkgs.cmake3 or null)
                           (pkgs.dev-util/cmake or null)
                           (pkgs.devel/cmake or null)
                           (pkgs.epel-release or null)
                           (pkgs.system:cmake or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-sfml2 = {
    name = "conf-sfml2";
    version = "1";
    opam = "${repo}/packages/conf-sfml2/conf-sfml2.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.libsfml-dev or null)
                           (pkgs.libsfml-devel or null) ];
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
  ocsfml = {
    name = "ocsfml";
    version = "2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/KyoDralliam/Ocsfml/archive/5a90ae9596861166bf69a36423318924595cd172.tar.gz";
      sha256 = "3f04a2af13ca501d0c770cff03254d686baddb37cfa7e8fb68b9ea3ae67efca4";
    };
    opam = "${repo}/packages/ocsfml/ocsfml.2.0/opam";
    depends = with self; [ conf-boost conf-cmake conf-sfml2 ocaml ocamlbuild
                           ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
}
