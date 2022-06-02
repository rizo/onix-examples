{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-emacs = {
    name = "conf-emacs";
    version = "1";
    opam = "${repo}/packages/conf-emacs/conf-emacs.1/opam";
    depexts = with pkgs; [ (pkgs.emacs or null) (pkgs.emacs-nox or null) ];
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
  tuareg = {
    name = "tuareg";
    version = "2.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/tuareg/releases/download/2.2.0/tuareg-2.2.0.tar.gz";
      sha256 = "1r2bmcfpwx59qgm97sp38py8n608pcvd05rrrlnxbvqpj2hchax5";
    };
    opam = "${repo}/packages/tuareg/tuareg.2.2.0/opam";
    depends = with self; [ conf-emacs ocaml (self.caml-mode or null)
                           (self.merlin or null) ];
    buildDepends = with self; [ ocaml ];
  };
}
