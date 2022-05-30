{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-threads = {
    name = "base-threads";
    version = "base";
    opam = "${repo}/packages/base-threads/base-threads.base/opam";
  };
  base-unix = {
    name = "base-unix";
    version = "base";
    opam = "${repo}/packages/base-unix/base-unix.base/opam";
  };
  conf-dssi = {
    name = "conf-dssi";
    version = "1";
    opam = "${repo}/packages/conf-dssi/conf-dssi.1/opam";
    depexts = with pkgs; [ dssi ];
  };
  conf-ladspa = {
    name = "conf-ladspa";
    version = "1";
    opam = "${repo}/packages/conf-ladspa/conf-ladspa.1/opam";
    depexts = with pkgs; [ (pkgs.drfill/liquidsoap/ladspa_header or null)
                           (pkgs.ladspa-dev or null)
                           (pkgs.ladspa-devel or null)
                           (pkgs.ladspa-sdk or null) ];
  };
  csexp = {
    name = "csexp";
    version = "1.5.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-dune/csexp/releases/download/1.5.1/csexp-1.5.1.tbz";
      sha256 = "d605e4065fa90a58800440ef2f33a2d931398bf2c22061a8acb7df845c0aac02";
    };
    opam = "${repo}/packages/csexp/csexp.1.5.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dssi = {
    name = "dssi";
    version = "0.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-dssi/archive/v0.1.5.tar.gz";
      sha512 = "ab5b0e0b870adb7e2f4019e1659c4fa35b0832a77bcabca516799e61c4305e4daf50b3cf2b2b67aba751ca23299060688988945920469fb3c2420197c6b02c77";
    };
    opam = "${repo}/packages/dssi/dssi.0.1.5/opam";
    depends = with self; [ conf-dssi dune dune-configurator ladspa ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune/dune.3.2.0/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  dune-configurator = {
    name = "dune-configurator";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
      sha256 = "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.3.2.0/opam";
    depends = with self; [ csexp dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ladspa = {
    name = "ladspa";
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/savonet/ocaml-ladspa/archive/v0.2.2.tar.gz";
      sha512 = "57e0c0d3809f4027ffac33289f451f8948d407283fd494e413d98ccac889e0423dfbcd6b09c5f633a60e5ff5f609b622841ad40b8dbb3a674137c3edcd0be290";
    };
    opam = "${repo}/packages/ladspa/ladspa.0.2.2/opam";
    depends = with self; [ conf-ladspa dune dune-configurator ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
