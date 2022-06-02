{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-findutils = {
    name = "conf-findutils";
    version = "1";
    opam = "${repo}/packages/conf-findutils/conf-findutils.1/opam";
    depexts = with pkgs; [ findutils ];
  };
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
  };
  minios-xen = {
    name = "minios-xen";
    version = "0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/talex5/mini-os/archive/v0.9.tar.gz";
      sha256 = "1cfn0m9h9ax46vf5zb9xhqlbhd0iiy4znzc5zmn5gja06xb5g8s7";
    };
    opam = "${repo}/packages/minios-xen/minios-xen.0.9/opam";
    buildDepends = with self; [ conf-findutils conf-perl ];
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
