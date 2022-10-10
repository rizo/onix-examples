{ pkgs ? import <nixpkgs> { } }: rec {
  version = "0.0.5";
  repo = builtins.fetchGit {
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "52c72e08d7782967837955f1c50c330a6131721f";
  };
  scope = rec {
    base-threads = {
      name = "base-threads";
      version = "base";
    };
    base-unix = {
      name = "base-unix";
      version = "base";
    };
    base64 = {
      name = "base64";
      version = "3.5.0";
      src = pkgs.fetchurl {
        url =
          "https://github.com/mirage/ocaml-base64/releases/download/v3.5.0/base64-v3.5.0.tbz";
        sha256 =
          "589de9c00578ebfe784198ac9818d3586c474b2316b6cd3e1c46ccb1f62ae3a4";
      };
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    dune = {
      name = "dune";
      version = "3.2.0";
      src = pkgs.fetchurl {
        url =
          "https://github.com/ocaml/dune/releases/download/3.2.0/chrome-trace-3.2.0.tbz";
        sha256 =
          "bd1fbce6ae79ed1eb26fa89bb2e2e23978afceb3f53f5578cf1bdab08a1ad5bc";
      };
      depends = [ base-threads base-unix ocaml ];
      buildDepends = [ ocaml ];
    };
    either = {
      name = "either";
      version = "1.0.0";
      src = pkgs.fetchurl {
        url =
          "https://github.com/mirage/either/releases/download/1.0.0/either-1.0.0.tbz";
        sha256 =
          "bf674de3312dee7b7215f07df1e8a96eb3d679164b8a918cdd95b8d97e505884";
      };
      depends = [ dune ];
      buildDepends = [ dune ];
    };
    fmt = {
      name = "fmt";
      version = "0.9.0";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
        sha512 =
          "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
      };
      depends = [ base-unix ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    jsonm = {
      name = "jsonm";
      version = "1.0.1";
      src = pkgs.fetchurl {
        url = "http://erratique.ch/software/jsonm/releases/jsonm-1.0.1.tbz";
        sha256 = "1176dcmxb11fnw49b7yysvkjh0kpzx4s48lmdn5psq9vshp5c29w";
      };
      depends = [ ocaml uchar uutf ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    ocaml = {
      name = "ocaml";
      version = "4.14.0";
      depends = [ ocaml-config ocaml-system ];
    };
    ocaml-config = {
      name = "ocaml-config";
      version = "2";
      depends = [ ocaml-system ];
    };
    ocaml-system = {
      name = "ocaml-system";
      version = "4.14.0";
      depexts = [ pkgs.ocaml-ng.ocamlPackages_4_14.ocaml ];
    };
    ocamlbuild = {
      name = "ocamlbuild";
      version = "0.14.1";
      src = pkgs.fetchurl {
        url =
          "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
        sha512 =
          "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    ocamlfind = {
      name = "ocamlfind";
      version = "1.9.3";
      src = pkgs.fetchurl {
        url = "http://download.camlcity.org/download/findlib-1.9.3.tar.gz";
        sha512 =
          "27cc4ce141576bf477fb9d61a82ad65f55478740eed59fb43f43edb794140829fd2ff89ad27d8a890cfc336b54c073a06de05b31100fc7c01cacbd7d88e928ea";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ];
    };
    optint = {
      name = "optint";
      version = "0.2.0";
      src = pkgs.fetchurl {
        url =
          "https://github.com/mirage/optint/releases/download/v0.2.0/optint-0.2.0.tbz";
        sha256 =
          "1dcbe0b6b6031f77db33028c87138fdb3bf90f92915e3b6629ddeb30a0d3000b";
      };
      depends = [ dune ocaml ];
      buildDepends = [ dune ocaml ];
    };
    options = {
      name = "options";
      version = "dev";
      src = builtins.fetchGit {
        url = "https://github.com/odis-labs/options.git";
        rev = "5b1165d99aba112d550ddc3133a8eb1d174441ec";
        allRefs = true;
      };
      depends = [ ocaml ];
      buildDepends = [ dune ocaml ];
    };
    repr = {
      name = "repr";
      version = "dev";
      src = builtins.fetchGit {
        url = "https://github.com/mirage/repr.git";
        rev = "0aee7b84b5d5b09a9495ece75c2c9fde0415872c";
        allRefs = true;
      };
      depends = [ base64 dune either fmt jsonm ocaml optint uutf ];
      buildDepends = [ dune ocaml ];
    };
    topkg = {
      name = "topkg";
      version = "1.0.5";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
        sha512 =
          "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
      };
      depends = [ ocaml ocamlbuild ];
      buildDepends = [ ocaml ocamlbuild ocamlfind ];
    };
    uchar = {
      name = "uchar";
      version = "0.0.2";
      src = pkgs.fetchurl {
        url =
          "https://github.com/ocaml/uchar/releases/download/v0.0.2/uchar-0.0.2.tbz";
        sha256 = "1w2saw7zanf9m9ffvz2lvcxvlm118pws2x1wym526xmydhqpyfa7";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ];
    };
    uutf = {
      name = "uutf";
      version = "1.0.3";
      src = pkgs.fetchurl {
        url = "https://erratique.ch/software/uutf/releases/uutf-1.0.3.tbz";
        sha512 =
          "50cc4486021da46fb08156e9daec0d57b4ca469b07309c508d5a9a41e9dbcf1f32dec2ed7be027326544453dcaf9c2534919395fd826dc7768efc6cc4bfcc9f8";
      };
      depends = [ ocaml ];
      buildDepends = [ ocaml ocamlbuild ocamlfind topkg ];
    };
    with-pin-depends = {
      name = "with-pin-depends";
      version = "root";
      src = pkgs.nix-gitignore.gitignoreSource [ ] ./.;
      depends = [ dune fmt ocaml options repr ];
      buildDepends = [ dune ocaml ];
    };
  };
}
