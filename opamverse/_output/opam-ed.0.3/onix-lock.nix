{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  cmdliner = {
    name = "cmdliner";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/cmdliner/releases/cmdliner-1.1.1.tbz";
      sha512 = "5478ad833da254b5587b3746e3a8493e66e867a081ac0f653a901cc8a7d944f66e4387592215ce25d939be76f281c4785702f54d4a74b1700bc8838a62255c9e";
    };
    opam = "${repo}/packages/cmdliner/cmdliner.1.1.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  opam-ed = {
    name = "opam-ed";
    version = "0.3";
    src = pkgs.fetchurl {
      url = "https://github.com/AltGr/opam-ed/archive/0.3.tar.gz";
      sha512 = "97ab5404a6b3c69628626232544069030cafb9daac85a1a6342f878e69678972180667613778c508ef87f19c2477938333eda41f713cca40af5376900dda7360";
    };
    opam = "${repo}/packages/opam-ed/opam-ed.0.3/opam";
    depends = with self; [ cmdliner ocaml opam-file-format ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  opam-file-format = {
    name = "opam-file-format";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-file-format/archive/2.0.0.tar.gz";
      sha256 = "0cjw69r7iilidi7b6arr92kjnjspchvwnmwr1b1gyaxqxpr2s98m";
    };
    opam = "${repo}/packages/opam-file-format/opam-file-format.2.0.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
