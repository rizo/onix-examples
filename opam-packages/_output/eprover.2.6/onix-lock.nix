{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-gcc = {
    name = "conf-gcc";
    version = "1.0";
    opam = "${repo}/packages/conf-gcc/conf-gcc.1.0/opam";
    depexts = with pkgs; [ gcc ];
  };
  eprover = {
    name = "eprover";
    version = "2.6";
    src = pkgs.fetchurl {
      url = "http://wwwlehre.dhbw-stuttgart.de/~sschulz/WORK/E_DOWNLOAD/V_2.6/E.tgz";
      sha512 = "20ba97779b81b215296215e6fb10db742c16684c6a38a4612ee2c28a72917aaea8f87daea4cd49557f5b47720c62cffd38445cf779e6690dd0f0924d26b37683";
    };
    opam = "${repo}/packages/eprover/eprover.2.6/opam";
    depends = with self; [ conf-gcc ];
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
