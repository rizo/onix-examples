{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-python-3 = {
    name = "conf-python-3";
    version = "1.0.0";
    opam = "${repo}/packages/conf-python-3/conf-python-3.1.0.0/opam";
    depexts = with pkgs; [ python3 ];
  };
  conf-python3-yaml = {
    name = "conf-python3-yaml";
    version = "1";
    opam = "${repo}/packages/conf-python3-yaml/conf-python3-yaml.1/opam";
    buildDepends = with self; [ conf-python-3 ];
    depexts = with pkgs; [ (pkgs.dev-python/pyyaml or null)
                           (pkgs.epel-release or null)
                           (pkgs.py-pyyaml-include or null)
                           (pkgs.py-yaml or null) (pkgs.py3-yaml or null)
                           (pkgs.python-yaml or null)
                           (pkgs.python3-PyYAML or null)
                           (pkgs.python3-pyyaml or null)
                           (pkgs.python3-yaml or null)
                           (pkgs.python36-PyYAML or null) ];
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
}
