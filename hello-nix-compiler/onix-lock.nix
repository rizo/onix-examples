{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  hello-nix-compiler = rec {
    name = "hello-nix-compiler";
    version = "root";
    src = ./.;
    opam = "${src}/hello-nix-compiler.opam";
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
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-system = {
    name = "ocaml-system";
    version = "4.14.0";
    opam = "${repo}/packages/ocaml-system/ocaml-system.4.14.0/opam";
    depexts = with pkgs; [ ocaml-ng.ocamlPackages_4_14.ocaml ];
  };
}
