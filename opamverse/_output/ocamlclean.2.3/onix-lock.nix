{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
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
}
