{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  solo5-bindings-hvt = {
    name = "solo5-bindings-hvt";
    version = "0.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/Solo5/solo5/releases/download/v0.6.9/solo5-v0.6.9.tar.gz";
      sha512 = "e294bb2d02d2d629236615493302d0463c89388987723f3921f6a32c0d44fb843de332c9a148e0c6693f2c2ceee77d973b1cb06766da452c4288c8f6fad0183c";
    };
    opam = "${repo}/packages/solo5-bindings-hvt/solo5-bindings-hvt.0.6.9/opam";
    depends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.kernel-headers or null)
                           (pkgs.linux-headers or null)
                           (pkgs.linux-libc-dev or null) ];
  };
}
