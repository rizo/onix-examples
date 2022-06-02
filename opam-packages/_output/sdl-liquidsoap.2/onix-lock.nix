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
  conf-libffi = {
    name = "conf-libffi";
    version = "2.0.0";
    opam = "${repo}/packages/conf-libffi/conf-libffi.2.0.0/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ libffi ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-sdl2 = {
    name = "conf-sdl2";
    version = "1";
    opam = "${repo}/packages/conf-sdl2/conf-sdl2.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL2-devel or null)
                           (pkgs.epel-release or null)
                           (pkgs.libSDL2-devel or null)
                           (pkgs.libsdl2-dev or null)
                           (pkgs.libsdl2-devel or null) (pkgs.sdl2 or null)
                           (pkgs.sdl2-dev or null) ];
  };
  conf-sdl2-ttf = {
    name = "conf-sdl2-ttf";
    version = "1";
    opam = "${repo}/packages/conf-sdl2-ttf/conf-sdl2-ttf.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.SDL2_ttf or null)
                           (pkgs.SDL2_ttf-devel or null)
                           (pkgs.epel-release or null)
                           (pkgs.libSDL2_ttf-devel or null)
                           (pkgs.libsdl2-ttf-dev or null)
                           (pkgs.libsdl2_ttf-devel or null)
                           (pkgs.sdl2-ttf or null) (pkgs.sdl2_ttf or null)
                           (pkgs.sdl2_ttf-dev or null) ];
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
  ctypes = {
    name = "ctypes";
    version = "0.17.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-ctypes/archive/0.17.1.tar.gz";
      sha256 = "1sd74bcsln51bnz11c82v6h6fv23dczfyfqqvv9rxa9wp4p3qrs1";
    };
    opam = "${repo}/packages/ctypes/ctypes.0.17.1/opam";
    depends = with self; [ integers ocaml (self.ctypes-foreign or null)
                           (self.mirage-xen or null) ];
    buildDepends = with self; [ conf-pkg-config ocaml ocamlfind ];
  };
  ctypes-foreign = {
    name = "ctypes-foreign";
    version = "0.18.0";
    opam = "${repo}/packages/ctypes-foreign/ctypes-foreign.0.18.0/opam";
    depends = with self; [ conf-libffi ];
    buildDepends = with self; [ conf-pkg-config ];
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
  integers = {
    name = "integers";
    version = "0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamllabs/ocaml-integers/archive/0.7.0.tar.gz";
      sha256 = "11f67v9bijhkbnia7vrdp6sfpyw92kp39kn4p1p2860qkbx1gdcb";
    };
    opam = "${repo}/packages/integers/integers.0.7.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  oasis = {
    name = "oasis";
    version = "0.4.11";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/oasis/oasis/0.4.11/oasis-0.4.11.tar.gz";
      sha256 = "0bn13mzfa98dq3y0jwzzndl55mnywaxv693z6f1rlvpdykp3vdqq";
    };
    opam = "${repo}/packages/oasis/oasis.0.4.11/opam";
    depends = with self; [ base-unix ocaml ocamlbuild
                           (self.benchmark or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ocamlify ocamlmod ];
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
  ocamlbuild = {
    name = "ocamlbuild";
    version = "0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
      sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
    };
    opam = "${repo}/packages/ocamlbuild/ocamlbuild.0.14.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  ocamlfind = {
    name = "ocamlfind";
    version = "1.9.3";
    src = pkgs.fetchurl {
      url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
      sha512 = "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
    };
    opam = "${repo}/packages/ocamlfind/ocamlfind.1.9.3/opam";
    depends = with self; [ ocaml (self.graphics or null) ];
    buildDepends = with self; [ ocaml ];
  };
  ocamlify = {
    name = "ocamlify";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlify/ocamlify/0.0.1/ocamlify-0.0.1.tar.gz";
      sha256 = "1j9nb3vjqbdsx3d6jazixgrh776051zkrc06nsc5q5ilp1jhrwkm";
    };
    opam = "${repo}/packages/ocamlify/ocamlify.0.0.1/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  ocamlmod = {
    name = "ocamlmod";
    version = "0.0.9";
    src = pkgs.fetchurl {
      url = "https://download.ocamlcore.org/ocamlmod/ocamlmod/0.0.9/ocamlmod-0.0.9.tar.gz";
      sha256 = "0cgp9qqrq7ayyhddrmqmq1affvfqcn722qiakjq4dkywvp67h4aa";
    };
    opam = "${repo}/packages/ocamlmod/ocamlmod.0.0.9/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  result = {
    name = "result";
    version = "1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/result/releases/download/1.5/result-1.5.tbz";
      sha256 = "0cpfp35fdwnv3p30a06wd0py3805qxmq3jmcynjc3x2qhlimwfkw";
    };
    opam = "${repo}/packages/result/result.1.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  sdl-liquidsoap = {
    name = "sdl-liquidsoap";
    version = "2";
    opam = "${repo}/packages/sdl-liquidsoap/sdl-liquidsoap.2/opam";
    depends = with self; [ tsdl-image tsdl-ttf ];
  };
  stdlib-shims = {
    name = "stdlib-shims";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/stdlib-shims/releases/download/0.3.0/stdlib-shims-0.3.0.tbz";
      sha256 = "babf72d3917b86f707885f0c5528e36c63fccb698f4b46cf2bab5c7ccdd6d84a";
    };
    opam = "${repo}/packages/stdlib-shims/stdlib-shims.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  topkg = {
    name = "topkg";
    version = "1.0.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
      sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
    };
    opam = "${repo}/packages/topkg/topkg.1.0.5/opam";
    depends = with self; [ ocaml ocamlbuild ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind ];
  };
  tsdl = {
    name = "tsdl";
    version = "0.9.8";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/tsdl/releases/tsdl-0.9.8.tbz";
      sha256 = "11b557nz0b00mxyhh6xgwrgixm68mcvj09sddkk53n5qxzdz6dff";
    };
    opam = "${repo}/packages/tsdl/tsdl.0.9.8/opam";
    depends = with self; [ conf-sdl2 ctypes ctypes-foreign ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  tsdl-image = {
    name = "tsdl-image";
    version = "0.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/tokenrove/tsdl-image/archive/0.1.2.tar.gz";
      sha256 = "0n7592h1s1ssihsak4s45lrl11df1pf1kv282sphr2mw0gapgpjg";
    };
    opam = "${repo}/packages/tsdl-image/tsdl-image.0.1.2/opam";
    depends = with self; [ ctypes ctypes-foreign ocaml result tsdl ];
    buildDepends = with self; [ oasis ocaml ];
    depexts = with pkgs; [ (pkgs.libsdl2-image-dev or null)
                           (pkgs.sdl2_image or null) ];
  };
  tsdl-ttf = {
    name = "tsdl-ttf";
    version = "0.3.2";
    src = pkgs.fetchurl {
      url = "https://github.com/sanette/tsdl-ttf/archive/0.3.2.tar.gz";
      sha512 = "9a7e9018ee24dbaa336d2d6fd542b2ddb59d2ef065bbb21534ccb7657a75cc831e7e5de5aee663b8b5adc7c8506e597f8cb529f5e6f59518ff6f739d77a3c671";
    };
    opam = "${repo}/packages/tsdl-ttf/tsdl-ttf.0.3.2/opam";
    depends = with self; [ conf-sdl2-ttf ctypes ctypes-foreign dune
                           dune-configurator ocaml tsdl ];
    buildDepends = with self; [ dune ocaml ];
  };
}
