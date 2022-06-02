{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  bap-emacs-dot = {
    name = "bap-emacs-dot";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ivg/emacs-dot/archive/refs/tags/v0.1.0.tar.gz";
      sha256 = "15g2v8aqia38rbzyl661vw623iw0vvfm7x498rshqjp62ymnlpmk";
    };
    opam = "${repo}/packages/bap-emacs-dot/bap-emacs-dot.0.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-emacs-goodies = {
    name = "bap-emacs-goodies";
    version = "0.1";
    opam = "${repo}/packages/bap-emacs-goodies/bap-emacs-goodies.0.1/opam";
    depends = with self; [ bap-emacs-dot bap-emacs-mode ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-emacs-mode = {
    name = "bap-emacs-mode";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ivg/bap-mode/archive/refs/tags/v0.1.0.tar.gz";
      sha256 = "0nihj70v7kpv7znpldczkjd96fldvg8ya420wmxqdqjpkswnhm1a";
    };
    opam = "${repo}/packages/bap-emacs-mode/bap-emacs-mode.0.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
}
