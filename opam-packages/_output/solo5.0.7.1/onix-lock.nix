{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.14.0.tar.gz";
      sha256 = "39f44260382f28d1054c5f9d8bf4753cb7ad64027da792f7938344544da155e8";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.14.0/opam";
  };
  solo5 = {
    name = "solo5";
    version = "0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/Solo5/solo5/releases/download/v0.7.1/solo5-v0.7.1.tar.gz";
      sha512 = "ccbe136a402b856dc99e5da449f62c1ed24f49b676ebae0a715a1f043cb0762ac404754f0887039d3dbdef1cd413a0a7e4d92b8dee562f06d3932fcb668180ed";
    };
    opam = "${repo}/packages/solo5/solo5.0.7.1/opam";
    depexts = with pkgs; [ (pkgs.kernel-headers or null)
                           (pkgs.linux-headers or null)
                           (pkgs.linux-libc-dev or null) ];
  };
}
