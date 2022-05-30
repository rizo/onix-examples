{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  alcotest = {
    name = "alcotest";
    version = "1.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/alcotest/releases/download/1.5.0/alcotest-js-1.5.0.tbz";
      sha256 = "54281907e02d78995df246dc2e10ed182828294ad2059347a1e3a13354848f6c";
    };
    opam = "${repo}/packages/alcotest/alcotest.1.5.0/opam";
    depends = with self; [ astring cmdliner dune fmt ocaml ocaml-syntax-shims
                           re stdlib-shims uutf ];
    buildDepends = with self; [ dune ocaml ];
  };
  astring = {
    name = "astring";
    version = "0.8.5";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/astring/releases/astring-0.8.5.tbz";
      sha256 = "1ykhg9gd3iy7zsgyiy2p9b1wkpqg9irw5pvcqs3sphq71iir4ml6";
    };
    opam = "${repo}/packages/astring/astring.0.8.5/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  base-bytes = {
    name = "base-bytes";
    version = "base";
    opam = "${repo}/packages/base-bytes/base-bytes.base/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-gnuplot = {
    name = "conf-gnuplot";
    version = "0.1";
    opam = "${repo}/packages/conf-gnuplot/conf-gnuplot.0.1/opam";
    depexts = with pkgs; [ (pkgs.gnuplot or null) (pkgs.gnuplot-x11 or null) ];
  };
  conf-gsl = {
    name = "conf-gsl";
    version = "2";
    opam = "${repo}/packages/conf-gsl/conf-gsl.2/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ (pkgs.gsl or null) (pkgs.gsl-dev or null)
                           (pkgs.gsl-devel or null) (pkgs.libgsl-dev or null)
                           (pkgs.libgsl-devel or null) ];
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
  fmt = {
    name = "fmt";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/fmt/releases/fmt-0.9.0.tbz";
      sha512 = "66cf4b8bb92232a091dfda5e94d1c178486a358cdc34b1eec516d48ea5acb6209c0dfcb416f0c516c50ddbddb3c94549a45e4a6d5c5fd1c81d3374dec823a83b";
    };
    opam = "${repo}/packages/fmt/fmt.0.9.0/opam";
    depends = with self; [ ocaml (self.base-unix or null)
                           (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  gsl = {
    name = "gsl";
    version = "1.24.3";
    src = pkgs.fetchurl {
      url = "https://github.com/mmottl/gsl-ocaml/releases/download/1.24.3/gsl-1.24.3.tbz";
      sha256 = "366f2becd41603fd64b1e5f5e9b5b5556c648c18b62e3c6344542898d763ffd6";
    };
    opam = "${repo}/packages/gsl/gsl.1.24.3/opam";
    depends = with self; [ dune dune-configurator ocaml ];
    buildDepends = with self; [ conf-gsl conf-pkg-config dune ocaml ];
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
  ocaml-syntax-shims = {
    name = "ocaml-syntax-shims";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-syntax-shims/releases/download/1.0.0/ocaml-syntax-shims-1.0.0.tbz";
      sha256 = "89b2e193e90a0c168b6ec5ddf6fef09033681bdcb64e11913c97440a2722e8c8";
    };
    opam = "${repo}/packages/ocaml-syntax-shims/ocaml-syntax-shims.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  ounit2 = {
    name = "ounit2";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit2/ounit2.2.2.6/opam";
    depends = with self; [ base-bytes base-unix dune ocaml seq stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-basic-structures = {
    name = "prbnmcn-basic-structures";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-basic-structures/archive/0.0.1.tar.gz";
      sha512 = "8a78c0572866e6471f8123d702aee42e6abdef6b0b633ab0ea678382a26194a1d79dea9d44ea0cb7b45d77dac25a6706153c3074f7b0aad05ce744fb480d8518";
    };
    opam = "${repo}/packages/prbnmcn-basic-structures/prbnmcn-basic-structures.0.0.1/opam";
    depends = with self; [ dune ocaml zarith ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-cgrph = {
    name = "prbnmcn-cgrph";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-cgrph/archive/0.0.2.tar.gz";
      sha512 = "72d9a45ed81d2b0c7eec1b25489458298fcb25b6adcf399317aa3d8d7c245a0055b96f17955287f632d0bad2fd6a7fb87a2c93b0883e0d9ba0d738c05b5fe3f8";
    };
    opam = "${repo}/packages/prbnmcn-cgrph/prbnmcn-cgrph.0.0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-dagger = {
    name = "prbnmcn-dagger";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-dagger/archive/0.0.2.tar.gz";
      sha512 = "a0f3f9190b23a408724d24bf47fb5c5fd9b4fdefa4d3b19bbc67117aa20fb7799045d9046a535365772f131947c2bd931d756226a9571fba84201e713a87e8ca";
    };
    opam = "${repo}/packages/prbnmcn-dagger/prbnmcn-dagger.0.0.2/opam";
    depends = with self; [ dune prbnmcn-cgrph pringo ];
    buildDepends = with self; [ dune ];
  };
  prbnmcn-dagger-gsl = {
    name = "prbnmcn-dagger-gsl";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-dagger/archive/0.0.2.tar.gz";
      sha512 = "a0f3f9190b23a408724d24bf47fb5c5fd9b4fdefa4d3b19bbc67117aa20fb7799045d9046a535365772f131947c2bd931d756226a9571fba84201e713a87e8ca";
    };
    opam = "${repo}/packages/prbnmcn-dagger-gsl/prbnmcn-dagger-gsl.0.0.2/opam";
    depends = with self; [ dune gsl prbnmcn-dagger ];
    buildDepends = with self; [ dune ];
  };
  prbnmcn-dagger-stats = {
    name = "prbnmcn-dagger-stats";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-dagger/archive/0.0.2.tar.gz";
      sha512 = "a0f3f9190b23a408724d24bf47fb5c5fd9b4fdefa4d3b19bbc67117aa20fb7799045d9046a535365772f131947c2bd931d756226a9571fba84201e713a87e8ca";
    };
    opam = "${repo}/packages/prbnmcn-dagger-stats/prbnmcn-dagger-stats.0.0.2/opam";
    depends = with self; [ dune prbnmcn-dagger prbnmcn-stats ];
    buildDepends = with self; [ dune ];
  };
  prbnmcn-dagger-test = {
    name = "prbnmcn-dagger-test";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-dagger/archive/0.0.2.tar.gz";
      sha512 = "a0f3f9190b23a408724d24bf47fb5c5fd9b4fdefa4d3b19bbc67117aa20fb7799045d9046a535365772f131947c2bd931d756226a9571fba84201e713a87e8ca";
    };
    opam = "${repo}/packages/prbnmcn-dagger-test/prbnmcn-dagger-test.0.0.2/opam";
    depends = with self; [ dune prbnmcn-dagger prbnmcn-dagger-gsl
                           prbnmcn-dagger-stats prbnmcn-gnuplot prbnmcn-stats
                           qcheck qcheck-alcotest ];
    buildDepends = with self; [ dune ];
  };
  prbnmcn-gnuplot = {
    name = "prbnmcn-gnuplot";
    version = "0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-gnuplot/archive/0.0.2.tar.gz";
      sha512 = "10a597bfbc89b1fe14f8e7005fd90a27871f58fba2bd1c2ef1c45d6bf8a5a3d7aeeaf1ea39e8409d6b7705987e0e017483a8cb61152c34cb705aad4f4578671f";
    };
    opam = "${repo}/packages/prbnmcn-gnuplot/prbnmcn-gnuplot.0.0.2/opam";
    depends = with self; [ base-unix conf-gnuplot dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-linalg = {
    name = "prbnmcn-linalg";
    version = "0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-linalg/archive/0.0.1.tar.gz";
      sha512 = "38a673af59c5b775cee2586e826b2f346274fc1bfee0f883d47a911ec6300ce1ed5f205d38f0e06cf260766328dad527d067e182e7f0a90cd45c1f06b09befcf";
    };
    opam = "${repo}/packages/prbnmcn-linalg/prbnmcn-linalg.0.0.1/opam";
    depends = with self; [ dune ocaml prbnmcn-basic-structures ];
    buildDepends = with self; [ dune ocaml ];
  };
  prbnmcn-stats = {
    name = "prbnmcn-stats";
    version = "0.0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/igarnier/prbnmcn-stats/archive/0.0.4.tar.gz";
      sha512 = "e22b6b425fe6518dfbc653a4894be42a8ef3b35b3982497e3aa426b2d22407b2019b0122cfc4abe0ab5a98060409379c5b349a74c26101c3b597aaa92a5b5285";
    };
    opam = "${repo}/packages/prbnmcn-stats/prbnmcn-stats.0.0.4/opam";
    depends = with self; [ dune ocaml prbnmcn-basic-structures prbnmcn-linalg ];
    buildDepends = with self; [ dune ocaml ];
  };
  pringo = {
    name = "pringo";
    version = "1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/pringo/archive/1.3.tar.gz";
      sha512 = "6a44adbf0980415cc1c899f351add6094b947043000223b58b226f5d0b4d926c8c8cd39c9336f8ccffb565fd5f8bf23263f465dcd3143488f53241f9e9d440b1";
    };
    opam = "${repo}/packages/pringo/pringo.1.3/opam";
    depends = with self; [ ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  qcheck = {
    name = "qcheck";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck/qcheck.0.18.1/opam";
    depends = with self; [ base-bytes base-unix dune ocaml qcheck-core
                           qcheck-ounit ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-alcotest = {
    name = "qcheck-alcotest";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck-alcotest/qcheck-alcotest.0.18.1/opam";
    depends = with self; [ alcotest base-bytes base-unix dune ocaml
                           qcheck-core ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-core = {
    name = "qcheck-core";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck-core/qcheck-core.0.18.1/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  qcheck-ounit = {
    name = "qcheck-ounit";
    version = "0.18.1";
    src = pkgs.fetchurl {
      url = "https://github.com/c-cube/qcheck/archive/v0.18.1.tar.gz";
      sha512 = "6fd5fd4348ed6a48a8f64a466fedd07374eaf23d516b3c250ebad2a32ddbca3ae4ad9c84fe1112858075df46c119cd6550205a4228a553b014d135581f024ded";
    };
    opam = "${repo}/packages/qcheck-ounit/qcheck-ounit.0.18.1/opam";
    depends = with self; [ base-bytes base-unix dune ocaml ounit2 qcheck-core ];
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
  seq = {
    name = "seq";
    version = "base";
    opam = "${repo}/packages/seq/seq.base/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
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
  uutf = {
    name = "uutf";
    version = "1.0.3";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uutf/releases/uutf-1.0.3.tbz";
      sha512 = "50cc4486021da46fb08156e9daec0d57b4ca469b07309c508d5a9a41e9dbcf1f32dec2ed7be027326544453dcaf9c2534919395fd826dc7768efc6cc4bfcc9f8";
    };
    opam = "${repo}/packages/uutf/uutf.1.0.3/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  zarith = {
    name = "zarith";
    version = "1.12";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/Zarith/archive/release-1.12.tar.gz";
      sha512 = "8075573ae65579a2606b37dd1b213032a07d220d28c733f9288ae80d36f8a2cc4d91632806df2503c130ea9658dc207ee3a64347c21aa53969050a208f5b2bb4";
    };
    opam = "${repo}/packages/zarith/zarith.1.12/opam";
    depends = with self; [ conf-gmp ocaml ocamlfind ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
}
