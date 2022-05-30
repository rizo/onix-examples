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
  dune-configurator = {
    name = "dune-configurator";
    version = "2.9.3";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/dune/releases/download/2.9.3/dune-site-2.9.3.tbz";
      sha256 = "3e65ec73ab2c80d50d4ffd6c46cbfb22eacd0e5587a4be8af8ae69547d5f88d6";
    };
    opam = "${repo}/packages/dune-configurator/dune-configurator.2.9.3/opam";
    depends = with self; [ csexp dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
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
  ez_file = {
    name = "ez_file";
    version = "0.3.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_file/archive/v0.3.0.tar.gz";
      sha256 = "e426f0853d613ce290003e4df93bdda93cb20be9b19ee57d59df0f92842310e9";
    };
    opam = "${repo}/packages/ez_file/ez_file.0.3.0/opam";
    depends = with self; [ base-unix dune ocaml ocplib_stuff re ];
    buildDepends = with self; [ dune ocaml ];
  };
  ez_search = {
    name = "ez_search";
    version = "0.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocamlpro/ez_search/archive/v0.2.2.tar.gz";
      sha256 = "0b640b0674675dcd84e509d19578908cac69a47c99a01e3ad32ca20dc62e1dbc";
    };
    opam = "${repo}/packages/ez_search/ez_search.0.2.2/opam";
    depends = with self; [ dune ez_cmdliner ez_file ocaml parmap re ];
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
  parmap = {
    name = "parmap";
    version = "1.2.4";
    src = pkgs.fetchurl {
      url = "https://github.com/rdicosmo/parmap/releases/download/1.2.4/parmap-1.2.4.tbz";
      sha256 = "05391212320adc254d968240085a3a790e8e6fda3f71dac0f71baff3b34a6ace";
    };
    opam = "${repo}/packages/parmap/parmap.1.2.4/opam";
    depends = with self; [ base-bigarray base-unix dune dune-configurator
                           ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
}
