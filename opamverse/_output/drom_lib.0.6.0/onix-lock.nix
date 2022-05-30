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
  directories = {
    name = "directories";
    version = "0.5";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/directories/archive/0.5.tar.gz";
      sha256 = "3eb8e0d079fd7c1099e9b92f8569b4edfb313fe58e838443a38266bd47d38c53";
    };
    opam = "${repo}/packages/directories/directories.0.5/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  drom_lib = {
    name = "drom_lib";
    version = "0.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/drom/archive/v0.6.0.tar.gz";
      sha512 = "3e8e7ad76608e8025ff129b9f2ad1377585da64ee599a28e4a29419d99529e82bb90fbb6d71088ad5393b696e3df8c62b57792da32834c3158f0976c6d1c7883";
    };
    opam = "${repo}/packages/drom_lib/drom_lib.0.6.0/opam";
    depends = with self; [ directories dune ez_cmdliner ez_config ez_file
                           ez_opam_file ez_subst ocaml toml ];
    buildDepends = with self; [ dune ocaml ];
  };
  dune = {
    name = "dune";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune/dune.2.9.3/opam";
    depends = with self; [ base-threads base-unix (self.ocaml or null)
                           (self.ocamlfind-secondary or null) ];
    buildDepends = with self; [ (self.ocaml or null) ];
  };
  ez_cmdliner = {
    name = "ez_cmdliner";
    version = "0.4.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_cmdliner/archive/v0.4.3.tar.gz";
      sha256 = "a4aaa008bf2bf29189e3c66c9481aab5d2e12b20c0b769a484df5dc07d68961d";
    };
    opam = "${repo}/packages/ez_cmdliner/ez_cmdliner.0.4.3/opam";
    depends = with self; [ cmdliner dune ez_subst ocaml ocplib_stuff ];
    buildDepends = with self; [ dune ocaml ];
  };
  ez_config = {
    name = "ez_config";
    version = "0.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_config/archive/v0.1.1.tar.gz";
      sha256 = "02mj2q8vp8n2jrp028h7ifw4lvsbqaa8xpv2ms58cmqh10crflfr";
    };
    opam = "${repo}/packages/ez_config/ez_config.0.1.1/opam";
    depends = with self; [ dune ez_file ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ez_file = {
    name = "ez_file";
    version = "0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_file/archive/v0.2.0.tar.gz";
      sha256 = "15rwybpxaq30clli2vbcnm85h49ady10zgdqjrmyf2qgmnz2xcz7";
    };
    opam = "${repo}/packages/ez_file/ez_file.0.2.0/opam";
    depends = with self; [ base-unix dune ocaml ocplib_stuff re ];
    buildDepends = with self; [ dune ocaml ];
  };
  ez_opam_file = {
    name = "ez_opam_file";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_opam_file/archive/v0.1.0.tar.gz";
      sha256 = "f744176b0545ac4eb306a0518fd770b22a1c0f7863886a6748198fcdc0e6bef5";
    };
    opam = "${repo}/packages/ez_opam_file/ez_opam_file.0.1.0/opam";
    depends = with self; [ dune ocaml opam-file-format ];
    buildDepends = with self; [ dune ocaml ];
  };
  ez_subst = {
    name = "ez_subst";
    version = "0.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_subst/archive/v0.2.1.tar.gz";
      sha256 = "5d56ac4754757bf279804211ad48d18947557f3c3624531be60cab1b50fb79d7";
    };
    opam = "${repo}/packages/ez_subst/ez_subst.0.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ISO8601 = {
    name = "ISO8601";
    version = "0.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/ISO8601.ml/archive/0.2.6.tar.gz";
      sha512 = "82b5cbbb636346e8d010ee569c0fad2f00bef31c3177cfee80fc02a081c5fcfb7880bf2670fe4f46423e3ae99370626c7efffc9d332cae5cbd6377c975517b3f";
    };
    opam = "${repo}/packages/ISO8601/ISO8601.0.2.6/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhir = {
    name = "menhir";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhir/menhir.20211128/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20211128/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20211128";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20211128/archive.tar.gz";
      sha512 = "76f998c114a29b390f05e7b62e396d6957e748be3bb7fe918893ab3471a7a907764de4610e392916553113df0c6b09aa570425dcf86c6a3e9e17b0ae36f3fe2b";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20211128/opam";
    depends = with self; [ dune ocaml ];
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
  ocplib_stuff = {
    name = "ocplib_stuff";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ocplib_stuff/archive/v0.3.0.tar.gz";
      sha256 = "0r5xh2aj1mbmj6ncxzkjzadgz42gw4x0qxxqdcm2m6531pcyfpq5";
    };
    opam = "${repo}/packages/ocplib_stuff/ocplib_stuff.0.3.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  opam-file-format = {
    name = "opam-file-format";
    version = "2.1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/opam-file-format/archive/refs/tags/2.1.4.tar.gz";
      sha512 = "fb5e584080d65c5b5d04c7d2ac397b69a3fd077af3f51eb22967131be22583fea507390eb0d7e6f5c92035372a9e753adbfbc8bfd056d8fd4697c6f95dd8e0ad";
    };
    opam = "${repo}/packages/opam-file-format/opam-file-format.2.1.4/opam";
    depends = with self; [ ocaml (self.dune or null) ];
    buildDepends = with self; [ ocaml (self.dune or null) ];
  };
  re = {
    name = "re";
    version = "1.10.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml-re/releases/download/1.10.4/re-1.10.4.tbz";
      sha256 = "83eb3e4300aa9b1dc7820749010f4362ea83524742130524d78c20ce99ca747c";
    };
    opam = "${repo}/packages/re/re.1.10.4/opam";
    depends = with self; [ dune ocaml seq ];
    buildDepends = with self; [ dune ocaml ];
  };
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  toml = {
    name = "toml";
    version = "7.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-toml/to.ml/archive/7.0.0.tar.gz";
      sha256 = "551185fbf299d596834eaa4e0a83385c2733c3aa4964e5326e280b1da8a5f908";
    };
    opam = "${repo}/packages/toml/toml.7.0.0/opam";
    depends = with self; [ dune ISO8601 menhir ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
}
