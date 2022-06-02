{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-netsnmp = {
    name = "conf-netsnmp";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://www.github.com/stevebleazard/ocaml-conf-netsnmp/releases/download/v1.0.0/conf-netsnmp-1.0.0.tbz";
      sha256 = "14vjdl8db93gqz3k73s8xdaqi3qiq15b2kyrl9w5crp691dcg4v9";
    };
    opam = "${repo}/packages/conf-netsnmp/conf-netsnmp.1.0.0/opam";
    depexts = with pkgs; [ (pkgs.libsnmp-dev or null)
                           (pkgs.libsnmp30 or null)
                           (pkgs.net-snmp-dev or null)
                           (pkgs.net-snmp-devel or null)
                           (pkgs.net-snmp-libs or null) ];
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
