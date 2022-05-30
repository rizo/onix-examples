{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  base-bigarray = {
    name = "base-bigarray";
    version = "base";
    opam = "${repo}/packages/base-bigarray/base-bigarray.base/opam";
  };
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
  bimage = {
    name = "bimage";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/zshipko/ocaml-bimage/releases/download/v0.6.0/bimage-0.6.0.tbz";
      sha256 = "7d4019a7783f20e5d9f1af72d0b5b14ef56cbfad9ed440da752cfc24d0f8d083";
    };
    opam = "${repo}/packages/bimage/bimage.0.6.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bimage-display = {
    name = "bimage-display";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/zshipko/ocaml-bimage/releases/download/v0.6.0/bimage-0.6.0.tbz";
      sha256 = "7d4019a7783f20e5d9f1af72d0b5b14ef56cbfad9ed440da752cfc24d0f8d083";
    };
    opam = "${repo}/packages/bimage-display/bimage-display.0.6.0/opam";
    depends = with self; [ bimage conf-glew dune glfw-ocaml ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  conf-glew = {
    name = "conf-glew";
    version = "1";
    opam = "${repo}/packages/conf-glew/conf-glew.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.glew or null) (pkgs.glew-dev or null)
                           (pkgs.glew-devel or null) (pkgs.glu-devel or null)
                           (pkgs.libglew-dev or null)
                           (pkgs.libglew-devel or null) ];
  };
  conf-glfw3 = {
    name = "conf-glfw3";
    version = "2";
    opam = "${repo}/packages/conf-glfw3/conf-glfw3.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.Mesa-libGL-devel or null)
                           (pkgs.epel-release or null) (pkgs.glfw or null)
                           (pkgs.glfw-dev or null) (pkgs.glfw-devel or null)
                           (pkgs.glfw-x11 or null)
                           (pkgs.libglfw-devel or null)
                           (pkgs.libglfw3-dev or null)
                           (pkgs.mesa-libGL-devel or null)
                           (pkgs.mesagl-devel or null) ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
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
  glfw-ocaml = {
    name = "glfw-ocaml";
    version = "3.3.1+1";
    src = pkgs.fetchurl {
      url = "https://github.com/SylvainBoilard/GLFW-OCaml/archive/3.3.1-1.tar.gz";
      sha512 = "ec8dc37cca0d7c7af66a715fe75c6bdf6d2bbc3d0fad3db4655af1a6eeeeeae77bc753e39685afd92127d92f5a86a0a484ef069ae9d9ce5ef8dac4a5216601cf";
    };
    opam = "${repo}/packages/glfw-ocaml/glfw-ocaml.3.3.1-1/opam";
    depends = with self; [ base-bigarray conf-glfw3 dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
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
