{ pkgs, self, repo ? builtins.fetchGit {
  url = "https://github.com/ocaml/opam-repository.git";
  rev = "52c72e08d7782967837955f1c50c330a6131721f";
} }:
{
  angstrom = {
    name = "angstrom";
    version = "0.15.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/angstrom/archive/0.15.0.tar.gz";
      sha256 = "01cjjal8vjsm225v9y0q6ixam8k5f821rcr6yix6i9nzs84aq6gi";
    };
    opam = "${repo}/packages/angstrom/angstrom.0.15.0/opam";
    depends = with self; [ bigstringaf dune ocaml result ];
    buildDepends = with self; [ dune ocaml ocaml-syntax-shims ];
  };
  bap = {
    name = "bap";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap/bap.2.4.0/opam";
    depends = with self; [ bap-beagle bap-beagle-strings bap-constant-tracker
                           bap-core bap-emacs-goodies bap-microx
                           bap-primus-dictionary bap-primus-powerpc
                           bap-primus-propagate-taint bap-primus-random
                           bap-primus-region bap-primus-support
                           bap-primus-systems bap-primus-taint
                           bap-primus-test bap-primus-x86 bap-run bap-strings
                           bap-taint bap-taint-propagator bap-term-mapper
                           bap-trivial-condition-form bap-warn-unused ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-abi = {
    name = "bap-abi";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-abi/bap-abi.2.4.0/opam";
    depends = with self; [ bap-std core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-analyze = {
    name = "bap-analyze";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-analyze/bap-analyze.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-std
                           bitvec core_kernel linenoise monads ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-api = {
    name = "bap-api";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-api/bap-api.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel fileutils ocaml
                           ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-arm = {
    name = "bap-arm";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-arm/bap-arm.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-c bap-core-theory
                           bap-knowledge bap-main bap-primus bap-std bitvec
                           bitvec-order core_kernel monads ocaml ogre ppx_bap
                           regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-beagle = {
    name = "bap-beagle";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-beagle/bap-beagle.2.4.0/opam";
    depends = with self; [ bap-future bap-microx bap-primus bap-std
                           bap-strings core_kernel monads ocaml ppx_bap
                           regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-beagle-strings = {
    name = "bap-beagle-strings";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-beagle-strings/bap-beagle-strings.2.4.0/opam";
    depends = with self; [ bap-beagle bap-std bap-strings core_kernel ocaml
                           ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-bil = {
    name = "bap-bil";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-bil/bap-bil.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-future bap-knowledge bap-main
                           bap-std bitvec bitvec-order core_kernel monads
                           ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-build = {
    name = "bap-build";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-build/bap-build.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ocamlbuild ocamlfind ppx_bap ];
    buildDepends = with self; [ oasis ocaml ocamlbuild ocamlfind ];
  };
  bap-bundle = {
    name = "bap-bundle";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-bundle/bap-bundle.2.4.0/opam";
    depends = with self; [ camlzip core_kernel fileutils ocaml ppx_bap uri ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-byteweight = {
    name = "bap-byteweight";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-byteweight/bap-byteweight.2.4.0/opam";
    depends = with self; [ bap-signatures bap-std camlzip core_kernel ocaml
                           ppx_bap regular uri ];
    buildDepends = with self; [ ocaml ];
  };
  bap-c = {
    name = "bap-c";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-c/bap-c.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-core-theory bap-knowledge
                           bap-std core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-cache = {
    name = "bap-cache";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-cache/bap-cache.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel fileutils mmap ocaml
                           ppx_bap regular uuidm ];
    buildDepends = with self; [ ocaml ];
  };
  bap-callgraph-collator = {
    name = "bap-callgraph-collator";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-callgraph-collator/bap-callgraph-collator.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel graphlib ocaml
                           ppx_bap re ];
    buildDepends = with self; [ ocaml ];
  };
  bap-callsites = {
    name = "bap-callsites";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-callsites/bap-callsites.2.4.0/opam";
    depends = with self; [ bap-std cmdliner ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-constant-tracker = {
    name = "bap-constant-tracker";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-constant-tracker/bap-constant-tracker.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-core = {
    name = "bap-core";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-core/bap-core.2.4.0/opam";
    depends = with self; [ bap-abi bap-analyze bap-api bap-arm bap-bil
                           bap-build bap-bundle bap-byteweight bap-c
                           bap-cache bap-callgraph-collator bap-callsites
                           bap-cxxfilt bap-demangle bap-dependencies
                           bap-disassemble bap-dump-symbols bap-elementary
                           bap-flatten bap-frontc bap-frontend
                           bap-glibc-runtime bap-llvm bap-main bap-mc
                           bap-mips bap-objdump bap-optimization bap-patterns
                           bap-plugins bap-powerpc bap-primus bap-primus-lisp
                           bap-print bap-raw bap-recipe bap-recipe-command
                           bap-relation bap-relocatable bap-report bap-riscv
                           bap-specification bap-ssa bap-std
                           bap-stub-resolver bap-symbol-reader bap-systemz
                           bap-thumb bap-toplevel bap-x86 ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-core-theory = {
    name = "bap-core-theory";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-core-theory/bap-core-theory.2.4.0/opam";
    depends = with self; [ bap-knowledge bitvec bitvec-binprot bitvec-order
                           bitvec-sexp core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-cxxfilt = {
    name = "bap-cxxfilt";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-cxxfilt/bap-cxxfilt.2.4.0/opam";
    depends = with self; [ bap-demangle bap-std conf-binutils ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-demangle = {
    name = "bap-demangle";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-demangle/bap-demangle.2.4.0/opam";
    depends = with self; [ bap-std cmdliner core_kernel ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-dependencies = {
    name = "bap-dependencies";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-dependencies/bap-dependencies.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel ocaml ogre ppx_bap
                           regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-disassemble = {
    name = "bap-disassemble";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-disassemble/bap-disassemble.2.4.0/opam";
    depends = with self; [ bap-bundle bap-core-theory bap-knowledge bap-main
                           bap-plugins bap-std core_kernel monads ocaml
                           ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-dump-symbols = {
    name = "bap-dump-symbols";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-dump-symbols/bap-dump-symbols.2.4.0/opam";
    depends = with self; [ bap-std core_kernel graphlib ocaml ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-dwarf = {
    name = "bap-dwarf";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-dwarf/bap-dwarf.2.4.0/opam";
    depends = with self; [ bap-std core_kernel ocaml ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-elementary = {
    name = "bap-elementary";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-elementary/bap-elementary.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-elf = {
    name = "bap-elf";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-elf/bap-elf.2.4.0/opam";
    depends = with self; [ bap-dwarf bap-std bitstring core_kernel ocaml
                           ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-emacs-dot = {
    name = "bap-emacs-dot";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ivg/emacs-dot/archive/refs/tags/v0.1.0.tar.gz";
      sha256 = "15g2v8aqia38rbzyl661vw623iw0vvfm7x498rshqjp62ymnlpmk";
    };
    opam = "${repo}/packages/bap-emacs-dot/bap-emacs-dot.0.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-emacs-goodies = {
    name = "bap-emacs-goodies";
    version = "0.1";
    opam = "${repo}/packages/bap-emacs-goodies/bap-emacs-goodies.0.1/opam";
    depends = with self; [ bap-emacs-dot bap-emacs-mode ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-emacs-mode = {
    name = "bap-emacs-mode";
    version = "0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ivg/bap-mode/archive/refs/tags/v0.1.0.tar.gz";
      sha256 = "0nihj70v7kpv7znpldczkjd96fldvg8ya420wmxqdqjpkswnhm1a";
    };
    opam = "${repo}/packages/bap-emacs-mode/bap-emacs-mode.0.1/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-extra = {
    name = "bap-extra";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-extra/bap-extra.2.4.0/opam";
    depends = with self; [ bap bap-elf bap-ghidra
                           bap-primus-symbolic-executor bap-trace bap-traces ];
  };
  bap-flatten = {
    name = "bap-flatten";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-flatten/bap-flatten.2.4.0/opam";
    depends = with self; [ bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-frontc = {
    name = "bap-frontc";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-frontc/bap-frontc.2.4.0/opam";
    depends = with self; [ bap-c bap-std FrontC ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-frontend = {
    name = "bap-frontend";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-frontend/bap-frontend.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-std
                           core_kernel ocaml ocamlfind ppx_bap regular ];
    buildDepends = with self; [ oasis ocaml ocamlfind ];
  };
  bap-future = {
    name = "bap-future";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-future/bap-future.2.4.0/opam";
    depends = with self; [ core_kernel monads ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-ghidra = {
    name = "bap-ghidra";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-ghidra/bap-ghidra.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-glibc-runtime = {
    name = "bap-glibc-runtime";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-glibc-runtime/bap-glibc-runtime.2.4.0/opam";
    depends = with self; [ bap-abi bap-c bap-main bap-std core_kernel ocaml
                           ogre ];
    buildDepends = with self; [ ocaml ];
  };
  bap-knowledge = {
    name = "bap-knowledge";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-knowledge/bap-knowledge.2.4.0/opam";
    depends = with self; [ core_kernel monads ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-llvm = {
    name = "bap-llvm";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-llvm/bap-llvm.2.4.0/opam";
    depends = with self; [ bap-std conf-bap-llvm conf-env-travis core_kernel
                           mmap monads ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ libxml2 ncurses ];
  };
  bap-main = {
    name = "bap-main";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-main/bap-main.2.4.0/opam";
    depends = with self; [ bap-build bap-future bap-plugins bap-recipe base
                           cmdliner ocaml stdio ];
    buildDepends = with self; [ ocaml ];
  };
  bap-mc = {
    name = "bap-mc";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-mc/bap-mc.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-plugins
                           bap-std bitvec core_kernel ocaml ogre ppx_bap
                           regular ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-microx = {
    name = "bap-microx";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-microx/bap-microx.2.4.0/opam";
    depends = with self; [ bap-std core_kernel monads ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-mips = {
    name = "bap-mips";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-mips/bap-mips.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-c bap-core-theory
                           bap-knowledge bap-main bap-std core_kernel ocaml
                           ogre ppx_bap regular zarith ];
    buildDepends = with self; [ ocaml ];
  };
  bap-objdump = {
    name = "bap-objdump";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-objdump/bap-objdump.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main
                           bap-relation bap-std bitvec bitvec-order
                           bitvec-sexp conf-binutils core_kernel ocaml
                           ppx_bap re ];
    buildDepends = with self; [ ocaml ];
  };
  bap-optimization = {
    name = "bap-optimization";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-optimization/bap-optimization.2.4.0/opam";
    depends = with self; [ bap-std core_kernel graphlib ocaml ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-patterns = {
    name = "bap-patterns";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-patterns/bap-patterns.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-primus
                           bap-relation bap-std bitvec bitvec-binprot
                           bitvec-order bitvec-sexp core_kernel fileutils
                           ocaml ppx_bap uri xmlm zarith ];
    buildDepends = with self; [ ocaml ];
  };
  bap-plugins = {
    name = "bap-plugins";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-plugins/bap-plugins.2.4.0/opam";
    depends = with self; [ bap-bundle bap-future core_kernel fileutils ocaml
                           ocamlfind ppx_bap uri ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  bap-powerpc = {
    name = "bap-powerpc";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-powerpc/bap-powerpc.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-c bap-core-theory
                           bap-knowledge bap-main bap-std bitvec cmdliner
                           core_kernel monads ocaml ogre ppx_bap regular
                           zarith ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus = {
    name = "bap-primus";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus/bap-primus.2.4.0/opam";
    depends = with self; [ bap-abi bap-c bap-core-theory bap-future
                           bap-knowledge bap-std bap-strings bitvec
                           bitvec-binprot core_kernel graphlib monads ocaml
                           parsexp ppx_bap regular uuidm ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-dictionary = {
    name = "bap-primus-dictionary";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-dictionary/bap-primus-dictionary.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-exploring-scheduler = {
    name = "bap-primus-exploring-scheduler";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-exploring-scheduler/bap-primus-exploring-scheduler.2.4.0/opam";
    depends = with self; [ bap-future bap-primus bap-std monads ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-greedy-scheduler = {
    name = "bap-primus-greedy-scheduler";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-greedy-scheduler/bap-primus-greedy-scheduler.2.4.0/opam";
    depends = with self; [ bap-primus bap-std monads ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-limit = {
    name = "bap-primus-limit";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-limit/bap-primus-limit.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-lisp = {
    name = "bap-primus-lisp";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-lisp/bap-primus-lisp.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-primus
                           bap-std bitvec core_kernel monads ocaml ppx_bap
                           regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-loader = {
    name = "bap-primus-loader";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-loader/bap-primus-loader.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-primus bap-std core_kernel
                           ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-mark-visited = {
    name = "bap-primus-mark-visited";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-mark-visited/bap-primus-mark-visited.2.4.0/opam";
    depends = with self; [ bap-primus bap-primus-track-visited bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-powerpc = {
    name = "bap-primus-powerpc";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-powerpc/bap-primus-powerpc.2.4.0/opam";
    depends = with self; [ bap-primus bap-std core_kernel ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-print = {
    name = "bap-primus-print";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-print/bap-primus-print.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-future bap-knowledge
                           bap-primus bap-std bare core_kernel monads ocaml
                           ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-promiscuous = {
    name = "bap-primus-promiscuous";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-promiscuous/bap-primus-promiscuous.2.4.0/opam";
    depends = with self; [ bap-primus bap-std monads ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-propagate-taint = {
    name = "bap-primus-propagate-taint";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-propagate-taint/bap-primus-propagate-taint.2.4.0/opam";
    depends = with self; [ bap-primus bap-std bap-taint core_kernel monads
                           ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-random = {
    name = "bap-primus-random";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-random/bap-primus-random.2.4.0/opam";
    depends = with self; [ bap-main bap-primus bap-std bitvec bitvec-sexp
                           core_kernel ocaml ppx_bap zarith ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-region = {
    name = "bap-primus-region";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-region/bap-primus-region.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-round-robin-scheduler = {
    name = "bap-primus-round-robin-scheduler";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-round-robin-scheduler/bap-primus-round-robin-scheduler.2.4.0/opam";
    depends = with self; [ bap-future bap-primus bap-std monads ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-support = {
    name = "bap-primus-support";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-support/bap-primus-support.2.4.0/opam";
    depends = with self; [ bap-primus-exploring-scheduler
                           bap-primus-greedy-scheduler bap-primus-limit
                           bap-primus-loader bap-primus-mark-visited
                           bap-primus-print bap-primus-promiscuous
                           bap-primus-round-robin-scheduler
                           bap-primus-wandering-scheduler ];
  };
  bap-primus-symbolic-executor = {
    name = "bap-primus-symbolic-executor";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-symbolic-executor/bap-primus-symbolic-executor.2.4.0/opam";
    depends = with self; [ bap-main bap-primus bap-primus-track-visited
                           bap-std bitvec core_kernel monads ocaml ppx_bap
                           regular z3 zarith ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-systems = {
    name = "bap-primus-systems";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-systems/bap-primus-systems.2.4.0/opam";
    depends = with self; [ bap-knowledge bap-main bap-primus bap-std
                           core_kernel ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-taint = {
    name = "bap-primus-taint";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-taint/bap-primus-taint.2.4.0/opam";
    depends = with self; [ bap-primus bap-std bap-taint ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-test = {
    name = "bap-primus-test";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-test/bap-primus-test.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-track-visited = {
    name = "bap-primus-track-visited";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-track-visited/bap-primus-track-visited.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-wandering-scheduler = {
    name = "bap-primus-wandering-scheduler";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-wandering-scheduler/bap-primus-wandering-scheduler.2.4.0/opam";
    depends = with self; [ bap-future bap-primus bap-std monads ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-primus-x86 = {
    name = "bap-primus-x86";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-primus-x86/bap-primus-x86.2.4.0/opam";
    depends = with self; [ bap-primus bap-std bap-x86 ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-print = {
    name = "bap-print";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-print/bap-print.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-demangle bap-knowledge bap-std
                           core_kernel graphlib ocaml ogre ppx_bap re regular
                           text-tags ];
    buildDepends = with self; [ ocaml ];
  };
  bap-raw = {
    name = "bap-raw";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-raw/bap-raw.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-recipe = {
    name = "bap-recipe";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-recipe/bap-recipe.2.4.0/opam";
    depends = with self; [ base camlzip fileutils ocaml parsexp stdio
                           stdlib-shims uuidm ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-recipe-command = {
    name = "bap-recipe-command";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-recipe-command/bap-recipe-command.2.4.0/opam";
    depends = with self; [ bap-main bap-recipe bap-std base camlzip fileutils
                           ocaml parsexp stdio uuidm ];
    buildDepends = with self; [ ocaml ];
  };
  bap-relation = {
    name = "bap-relation";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-relation/bap-relation.2.4.0/opam";
    depends = with self; [ base ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-relocatable = {
    name = "bap-relocatable";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-relocatable/bap-relocatable.2.4.0/opam";
    depends = with self; [ bap-abi bap-arm bap-core-theory bap-knowledge
                           bap-main bap-powerpc bap-relation bap-std bap-x86
                           bitvec bitvec-order bitvec-sexp core_kernel monads
                           ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-report = {
    name = "bap-report";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-report/bap-report.2.4.0/opam";
    depends = with self; [ bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-riscv = {
    name = "bap-riscv";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-riscv/bap-riscv.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-c bap-core-theory
                           bap-knowledge bap-main bap-std core_kernel monads
                           ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-run = {
    name = "bap-run";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-run/bap-run.2.4.0/opam";
    depends = with self; [ bap-primus bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-signatures = {
    name = "bap-signatures";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/releases/download/v2.4.0/sigs.tar.gz";
      sha256 = "086ha5rky81l19ib0l7sjwhgrcaznysdkylccmmn8bfij3a701qz";
    };
    opam = "${repo}/packages/bap-signatures/bap-signatures.2.4.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-specification = {
    name = "bap-specification";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-specification/bap-specification.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel ocaml ogre ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-ssa = {
    name = "bap-ssa";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-ssa/bap-ssa.2.4.0/opam";
    depends = with self; [ bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-std = {
    name = "bap-std";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-std/bap-std.2.4.0/opam";
    depends = with self; [ bap-bundle bap-core-theory bap-future
                           bap-knowledge bap-main bap-plugins bap-relation
                           base-unix bin_prot bitvec bitvec-order camlzip
                           cmdliner conf-clang conf-gmp conf-m4 conf-perl
                           conf-which core_kernel fileutils graphlib monads
                           ocaml ocamlfind ogre ppx_bap regular result uri
                           uuidm zarith ];
    buildDepends = with self; [ oasis ocaml ocamlfind utop ];
    depexts = with pkgs; [ binutils zlib ];
  };
  bap-strings = {
    name = "bap-strings";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-strings/bap-strings.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-stub-resolver = {
    name = "bap-stub-resolver";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-stub-resolver/bap-stub-resolver.2.4.0/opam";
    depends = with self; [ bap-abi bap-core-theory bap-knowledge bap-main
                           bap-relation bap-std bitvec bitvec-order
                           bitvec-sexp core_kernel ocaml ogre ounit ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-symbol-reader = {
    name = "bap-symbol-reader";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-symbol-reader/bap-symbol-reader.2.4.0/opam";
    depends = with self; [ bap-future bap-knowledge bap-std core_kernel ocaml
                           ppx_bap regular ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-systemz = {
    name = "bap-systemz";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-systemz/bap-systemz.2.4.0/opam";
    depends = with self; [ bap-core-theory bap-knowledge bap-main bap-std
                           bitvec core_kernel ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-taint = {
    name = "bap-taint";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-taint/bap-taint.2.4.0/opam";
    depends = with self; [ bap-primus bap-std bap-strings core_kernel monads
                           ocaml ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bap-taint-propagator = {
    name = "bap-taint-propagator";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-taint-propagator/bap-taint-propagator.2.4.0/opam";
    depends = with self; [ bap-microx bap-std cmdliner ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-term-mapper = {
    name = "bap-term-mapper";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-term-mapper/bap-term-mapper.2.4.0/opam";
    depends = with self; [ bap-main bap-std core_kernel ocaml ppx_bap regular ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-thumb = {
    name = "bap-thumb";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-thumb/bap-thumb.2.4.0/opam";
    depends = with self; [ bap-arm bap-core-theory bap-knowledge bap-main
                           bap-std bitvec core_kernel ocaml ogre ppx_bap ];
    buildDepends = with self; [ ocaml ];
  };
  bap-toplevel = {
    name = "bap-toplevel";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-toplevel/bap-toplevel.2.4.0/opam";
    depends = with self; [ bap-std ocaml ocamlfind ];
    buildDepends = with self; [ oasis ocaml ocamlfind ];
  };
  bap-trace = {
    name = "bap-trace";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-trace/bap-trace.2.4.0/opam";
    depends = with self; [ bap-future bap-std bap-traces cmdliner core_kernel
                           ocaml ppx_bap regular uri ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-traces = {
    name = "bap-traces";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-traces/bap-traces.2.4.0/opam";
    depends = with self; [ bap-std core_kernel ocaml ppx_bap regular uri
                           uuidm ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-trivial-condition-form = {
    name = "bap-trivial-condition-form";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-trivial-condition-form/bap-trivial-condition-form.2.4.0/opam";
    depends = with self; [ bap-std ocaml ];
    buildDepends = with self; [ ocaml ];
  };
  bap-warn-unused = {
    name = "bap-warn-unused";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-warn-unused/bap-warn-unused.2.4.0/opam";
    depends = with self; [ bap-std cmdliner ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bap-x86 = {
    name = "bap-x86";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bap-x86/bap-x86.2.4.0/opam";
    depends = with self; [ bap-abi bap-api bap-c bap-core-theory bap-future
                           bap-knowledge bap-llvm bap-main bap-std bitvec
                           cmdliner core_kernel ocaml ogre ppx_bap regular ];
    buildDepends = with self; [ ocaml ];
  };
  bare = {
    name = "bare";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bare/bare.2.4.0/opam";
    depends = with self; [ core_kernel ocaml parsexp ];
    buildDepends = with self; [ oasis ocaml ];
  };
  base = {
    name = "base";
    version = "v0.14.3";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/base/archive/v0.14.3.tar.gz";
      sha256 = "e34dc0dd052a386c84f5f67e71a90720dff76e0edd01f431604404bee86ebe5a";
    };
    opam = "${repo}/packages/base/base.v0.14.3/opam";
    depends = with self; [ dune dune-configurator ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
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
  base_bigstring = {
    name = "base_bigstring";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/base_bigstring-v0.14.0.tar.gz";
      sha256 = "1fhldk58w56ixkin763kpic512xvkkf9b4mrnjfsbm8in75kzndq";
    };
    opam = "${repo}/packages/base_bigstring/base_bigstring.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_jane ];
    buildDepends = with self; [ dune ocaml ];
  };
  base_quickcheck = {
    name = "base_quickcheck";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/base_quickcheck-v0.14.0.tar.gz";
      sha256 = "0y38raqfphv88jkvj7p9wvaisx89arpyb58k9nx4c6kyg9kh751r";
    };
    opam = "${repo}/packages/base_quickcheck/base_quickcheck.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppx_fields_conv ppx_let
                           ppx_sexp_message ppx_sexp_value ppxlib
                           splittable_random ];
    buildDepends = with self; [ dune ocaml ];
  };
  bigarray-compat = {
    name = "bigarray-compat";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/bigarray-compat/releases/download/v1.1.0/bigarray-compat-1.1.0.tbz";
      sha256 = "434469a48d5c84e80d621b13d95eb067f8138c1650a1fd5ae6009a19b93718d5";
    };
    opam = "${repo}/packages/bigarray-compat/bigarray-compat.1.1.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  bigstringaf = {
    name = "bigstringaf";
    version = "0.9.0";
    src = pkgs.fetchurl {
      url = "https://github.com/inhabitedtype/bigstringaf/archive/0.9.0.tar.gz";
      sha256 = "0v0h09r0690b6b27ww443zxvj1dwhxcy86fbjaf2wm56kb3qccsl";
    };
    opam = "${repo}/packages/bigstringaf/bigstringaf.0.9.0/opam";
    depends = with self; [ dune ocaml (self.ocaml-freestanding or null) ];
    buildDepends = with self; [ conf-pkg-config dune ocaml ];
  };
  bin_prot = {
    name = "bin_prot";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/bin_prot-v0.14.0.tar.gz";
      sha256 = "1f1ng6cixi3ci0nb765yfzqk9b3s752hy1i3702kh59gni1psycp";
    };
    opam = "${repo}/packages/bin_prot/bin_prot.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_custom_printf
                           ppx_fields_conv ppx_optcomp ppx_sexp_conv
                           ppx_variants_conv (self.mirage-xen-ocaml or null) ];
    buildDepends = with self; [ dune ocaml ];
  };
  bitstring = {
    name = "bitstring";
    version = "3.1.1";
    src = pkgs.fetchurl {
      url = "https://bitbucket.org/thanatonauts/bitstring/get/v3.1.1.tar.gz";
      sha256 = "0bxjf730mij0vvw8kvf4lbxlkv6dqbsdql5vb6nahk3q0akrjwl6";
    };
    opam = "${repo}/packages/bitstring/bitstring.3.1.1/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree stdlib-shims ];
    buildDepends = with self; [ dune ocaml ppx_tools_versioned ];
  };
  bitvec = {
    name = "bitvec";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bitvec/bitvec.2.4.0/opam";
    depends = with self; [ ocaml zarith ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bitvec-binprot = {
    name = "bitvec-binprot";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bitvec-binprot/bitvec-binprot.2.4.0/opam";
    depends = with self; [ bin_prot bitvec ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bitvec-order = {
    name = "bitvec-order";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bitvec-order/bitvec-order.2.4.0/opam";
    depends = with self; [ base bitvec bitvec-sexp ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  bitvec-sexp = {
    name = "bitvec-sexp";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/bitvec-sexp/bitvec-sexp.2.4.0/opam";
    depends = with self; [ bitvec ocaml sexplib0 ];
    buildDepends = with self; [ oasis ocaml ];
    depexts = with pkgs; [ which ];
  };
  camlzip = {
    name = "camlzip";
    version = "1.11";
    src = pkgs.fetchurl {
      url = "https://github.com/xavierleroy/camlzip/archive/rel111.tar.gz";
      sha256 = "ffbbc5de3e1c13dc0e59272376d232d2ede91b327551063d47fddb74f1d5ed37";
    };
    opam = "${repo}/packages/camlzip/camlzip.1.11/opam";
    depends = with self; [ conf-zlib ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
  };
  camomile = {
    name = "camomile";
    version = "1.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/yoriyuki/Camomile/releases/download/1.0.2/camomile-1.0.2.tbz";
      sha256 = "f0a419b0affc36500f83b086ffaa36c545560cee5d57e84b729e8f851b3d1632";
    };
    opam = "${repo}/packages/camomile/camomile.1.0.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  charInfo_width = {
    name = "charInfo_width";
    version = "1.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/charInfo_width/archive/1.1.0.tar.gz";
      sha256 = "0wl1hcwbx2mmgbhwh1wwgjixvppjq0k43nqyq13xm4pvgdxfvci1";
    };
    opam = "${repo}/packages/charInfo_width/charInfo_width.1.1.0/opam";
    depends = with self; [ camomile dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
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
  conf-bap-llvm = {
    name = "conf-bap-llvm";
    version = "1.7";
    opam = "${repo}/packages/conf-bap-llvm/conf-bap-llvm.1.7/opam";
    depends = with self; [ base-unix ocaml ];
    buildDepends = with self; [ conf-which ocaml ];
    depexts = with pkgs; [ pkgsStatic.llvm.dev ];
  };
  conf-binutils = {
    name = "conf-binutils";
    version = "0.3";
    opam = "${repo}/packages/conf-binutils/conf-binutils.0.3/opam";
    depends = with self; [ base-unix ocaml ];
    buildDepends = with self; [ ocaml ];
    depexts = with pkgs; [ binutils ];
  };
  conf-clang = {
    name = "conf-clang";
    version = "1";
    opam = "${repo}/packages/conf-clang/conf-clang.1/opam";
    depexts = with pkgs; [ (pkgs.clang or null) ];
  };
  conf-env-travis = {
    name = "conf-env-travis";
    version = "1";
    opam = "${repo}/packages/conf-env-travis/conf-env-travis.1/opam";
  };
  conf-gmp = {
    name = "conf-gmp";
    version = "4";
    opam = "${repo}/packages/conf-gmp/conf-gmp.4/opam";
    depexts = with pkgs; [ gmp ];
  };
  conf-m4 = {
    name = "conf-m4";
    version = "1";
    opam = "${repo}/packages/conf-m4/conf-m4.1/opam";
    depexts = with pkgs; [ m4 ];
  };
  conf-perl = {
    name = "conf-perl";
    version = "2";
    opam = "${repo}/packages/conf-perl/conf-perl.2/opam";
    depexts = with pkgs; [ perl ];
  };
  conf-pkg-config = {
    name = "conf-pkg-config";
    version = "2";
    opam = "${repo}/packages/conf-pkg-config/conf-pkg-config.2/opam";
    depexts = with pkgs; [ pkgconfig ];
  };
  conf-python-3 = {
    name = "conf-python-3";
    version = "1.0.0";
    opam = "${repo}/packages/conf-python-3/conf-python-3.1.0.0/opam";
    depexts = with pkgs; [ python3 ];
  };
  conf-which = {
    name = "conf-which";
    version = "1";
    opam = "${repo}/packages/conf-which/conf-which.1/opam";
    depexts = with pkgs; [ which ];
  };
  conf-zlib = {
    name = "conf-zlib";
    version = "1";
    opam = "${repo}/packages/conf-zlib/conf-zlib.1/opam";
    buildDepends = with self; [ conf-pkg-config ];
    depexts = with pkgs; [ zlib ];
  };
  core_kernel = {
    name = "core_kernel";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/core_kernel/archive/v0.14.1.tar.gz";
      sha256 = "0f24sagyzhfr6x68fynhsn5cd1p72vkqm25wnfg8164sivas148x";
    };
    opam = "${repo}/packages/core_kernel/core_kernel.v0.14.1/opam";
    depends = with self; [ base base_bigstring base_quickcheck bin_prot dune
                           fieldslib jane-street-headers jst-config ocaml
                           ppx_assert ppx_base ppx_hash ppx_inline_test
                           ppx_jane ppx_sexp_conv ppx_sexp_message sexplib
                           splittable_random stdio time_now typerep
                           variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  cppo = {
    name = "cppo";
    version = "1.6.9";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/cppo/archive/v1.6.9.tar.gz";
      sha512 = "26ff5a7b7f38c460661974b23ca190f0feae3a99f1974e0fd12ccf08745bd7d91b7bc168c70a5385b837bfff9530e0e4e41cf269f23dd8cf16ca658008244b44";
    };
    opam = "${repo}/packages/cppo/cppo.1.6.9/opam";
    depends = with self; [ base-unix dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  FrontC = {
    name = "FrontC";
    version = "4.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/FrontC/archive/refs/tags/v4.1.0.tar.gz";
      sha256 = "1r0h48zm6ybhpyznp9gn5qf7x3yj1nib3qww0s993jrr5akn607p";
    };
    opam = "${repo}/packages/FrontC/FrontC.4.1.0/opam";
    depends = with self; [ dune menhir ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fieldslib = {
    name = "fieldslib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/fieldslib-v0.14.0.tar.gz";
      sha256 = "10n5y376fb5jgqk9h8vq158rm1b36h9lzh6p11q33h6xgvb1v6n3";
    };
    opam = "${repo}/packages/fieldslib/fieldslib.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  fileutils = {
    name = "fileutils";
    version = "0.6.3";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ocaml-fileutils/releases/download/v0.6.3/fileutils-v0.6.3.tbz";
      sha256 = "eff581c488e9309eb02268bbfa3d4c9c30ff40d45f7b1e9ef300b3ef0e831462";
    };
    opam = "${repo}/packages/fileutils/fileutils.0.6.3/opam";
    depends = with self; [ base-bytes base-unix dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
  };
  graphlib = {
    name = "graphlib";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/graphlib/graphlib.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ocamlgraph ppx_bap regular ];
    buildDepends = with self; [ oasis ocaml ];
  };
  jane-street-headers = {
    name = "jane-street-headers";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/jane-street-headers-v0.14.0.tar.gz";
      sha256 = "028yxb4h3iy025iy89v8653m5brh7flrjshghs4x99pd690pmfs7";
    };
    opam = "${repo}/packages/jane-street-headers/jane-street-headers.v0.14.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  jst-config = {
    name = "jst-config";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/jst-config/archive/refs/tags/v0.14.1.tar.gz";
      sha256 = "0wdjs0lvc5wbggh27cf490jarfibrrb5xxsrigg41m32kjkbijm4";
    };
    opam = "${repo}/packages/jst-config/jst-config.v0.14.1/opam";
    depends = with self; [ base dune dune-configurator ocaml ppx_assert stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  lambda-term = {
    name = "lambda-term";
    version = "3.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/lambda-term/releases/download/3.2.0/lambda-term-3.2.0.tar.gz";
      sha512 = "46cd46f47c9f34c0a5e096b96e6eec59667b645bf5201140e498e6d4eb9baba8204a2b30b73c4b2f8140e5cf1972a56e3aa485b27bc5ace25b2c368f713ad7c4";
    };
    opam = "${repo}/packages/lambda-term/lambda-term.3.2.0/opam";
    depends = with self; [ camomile dune lwt lwt_log lwt_react mew_vi ocaml
                           react zed ];
    buildDepends = with self; [ dune ocaml ];
  };
  linenoise = {
    name = "linenoise";
    version = "1.3.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/ocaml-linenoise/archive/v1.3.1.tar.gz";
      sha512 = "02d5c002a37b41254d6f9d1645117b99209129ba8b808871e6bd48ab2c8c4486fa12aca98db9a8cd44fafccca4c88b517fe0311afbcb9791f270a7329176f793";
    };
    opam = "${repo}/packages/linenoise/linenoise.1.3.1/opam";
    depends = with self; [ dune ocaml result ];
    buildDepends = with self; [ dune ocaml ];
  };
  lwt = {
    name = "lwt";
    version = "5.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt/lwt.5.5.0/opam";
    depends = with self; [ dune dune-configurator mmap ocaml ocplib-endian
                           result seq (self.base-threads or null)
                           (self.base-unix or null) (self.conf-libev or null)
                           (self.ocaml or null)
                           (self.ocaml-syntax-shims or null) ];
    buildDepends = with self; [ cppo dune ocaml (self.ocaml or null) ];
  };
  lwt_log = {
    name = "lwt_log";
    version = "1.1.1";
    src = pkgs.fetchurl {
      url = "https://github.com/aantron/lwt_log/archive/1.1.1.tar.gz";
      sha256 = "0gszc8nvk2hpfq47plb36qahlnyfq28sa9mhicnf6mg5c7n1kyql";
    };
    opam = "${repo}/packages/lwt_log/lwt_log.1.1.1/opam";
    depends = with self; [ dune lwt ];
    buildDepends = with self; [ dune ];
  };
  lwt_react = {
    name = "lwt_react";
    version = "1.1.5";
    src = pkgs.fetchurl {
      url = "https://github.com/ocsigen/lwt/archive/refs/tags/5.5.0.tar.gz";
      sha512 = "8951b94555e930634375816d71815b9d85daad6ffb7dab24864661504d11be26575ab0b237196c54693efa372a9b69cdc1d5068a20a250dc0bbb4a3c03c5fda1";
    };
    opam = "${repo}/packages/lwt_react/lwt_react.1.1.5/opam";
    depends = with self; [ dune lwt ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhir = {
    name = "menhir";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhir/menhir.20220210/opam";
    depends = with self; [ dune menhirLib menhirSdk ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirLib = {
    name = "menhirLib";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirLib/menhirLib.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  menhirSdk = {
    name = "menhirSdk";
    version = "20220210";
    src = pkgs.fetchurl {
      url = "https://gitlab.inria.fr/fpottier/menhir/-/archive/20220210/archive.tar.gz";
      sha512 = "3063fec1d8b9fe092c8461b0689d426c7fe381a2bf3fd258dc42ceecca1719d32efbb8a18d94ada5555c38175ea352da3adbb239fdbcbcf52c3a5c85a4d9586f";
    };
    opam = "${repo}/packages/menhirSdk/menhirSdk.20220210/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew = {
    name = "mew";
    version = "0.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/mew/archive/0.1.0.tar.gz";
      sha256 = "1rjri9mgfb9gn9fmjn0ax21y9jd9wkvr7mmx2jrlqmzgabmqrlv4";
    };
    opam = "${repo}/packages/mew/mew.0.1.0/opam";
    depends = with self; [ dune ocaml result trie ];
    buildDepends = with self; [ dune ocaml ];
  };
  mew_vi = {
    name = "mew_vi";
    version = "0.5.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/mew_vi/archive/0.5.0.tar.gz";
      sha256 = "1nmg3cysglgw4115n5zpz4azrfbnfxkn2kvw73chzs69viygm4m6";
    };
    opam = "${repo}/packages/mew_vi/mew_vi.0.5.0/opam";
    depends = with self; [ dune mew ocaml react ];
    buildDepends = with self; [ dune ocaml ];
  };
  mmap = {
    name = "mmap";
    version = "1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/mmap/releases/download/v1.2.0/mmap-1.2.0.tbz";
      sha256 = "1602a8abc8e232fa94771a52e540e5780b40c2f2762eee6afbd9286502116ddb";
    };
    opam = "${repo}/packages/mmap/mmap.1.2.0/opam";
    depends = with self; [ bigarray-compat dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  monads = {
    name = "monads";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/monads/monads.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  num = {
    name = "num";
    version = "1.4";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/num/archive/v1.4.tar.gz";
      sha512 = "0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f";
    };
    opam = "${repo}/packages/num/num.1.4/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlfind ];
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
    version = "4.12.1";
    opam = "${repo}/packages/ocaml/ocaml.4.12.1/opam";
    depends = with self; [ ocaml-config (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-base-compiler = {
    name = "ocaml-base-compiler";
    version = "4.12.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml/ocaml/archive/4.12.1.tar.gz";
      sha256 = "f5a48a90557cb47ace7b1590fcab1362a1af38629a218350f69c225c57e96a41";
    };
    opam = "${repo}/packages/ocaml-base-compiler/ocaml-base-compiler.4.12.1/opam";
  };
  ocaml-compiler-libs = {
    name = "ocaml-compiler-libs";
    version = "v0.12.4";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ocaml-compiler-libs/releases/download/v0.12.4/ocaml-compiler-libs-v0.12.4.tbz";
      sha256 = "4ec9c9ec35cc45c18c7a143761154ef1d7663036a29297f80381f47981a07760";
    };
    opam = "${repo}/packages/ocaml-compiler-libs/ocaml-compiler-libs.v0.12.4/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ocaml-config = {
    name = "ocaml-config";
    version = "2";
    opam = "${repo}/packages/ocaml-config/ocaml-config.2/opam";
    depends = with self; [ (self.ocaml-base-compiler or null)
                           (self.ocaml-system or null)
                           (self.ocaml-variants or null) ];
  };
  ocaml-migrate-parsetree = {
    name = "ocaml-migrate-parsetree";
    version = "1.8.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ocaml-migrate-parsetree/releases/download/v1.8.0/ocaml-migrate-parsetree-v1.8.0.tbz";
      sha256 = "b1c2d176ff1444041f2775786ba605be796e46dfd2acb06c96f35d2bb88b8fb5";
    };
    opam = "${repo}/packages/ocaml-migrate-parsetree/ocaml-migrate-parsetree.1.8.0/opam";
    depends = with self; [ dune ocaml ppx_derivers result ];
    buildDepends = with self; [ dune ocaml ];
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
  ocamlgraph = {
    name = "ocamlgraph";
    version = "2.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/backtracking/ocamlgraph/releases/download/2.0.0/ocamlgraph-2.0.0.tbz";
      sha256 = "20fe267797de5322088a4dfb52389b2ea051787952a8a4f6ed70fcb697482609";
    };
    opam = "${repo}/packages/ocamlgraph/ocamlgraph.2.0.0/opam";
    depends = with self; [ dune ocaml stdlib-shims ];
    buildDepends = with self; [ dune ocaml ];
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
  ocplib-endian = {
    name = "ocplib-endian";
    version = "1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/OCamlPro/ocplib-endian/archive/refs/tags/1.2.tar.gz";
      sha512 = "2e70be5f3d6e377485c60664a0e235c3b9b24a8d6b6a03895d092c6e40d53810bfe1f292ee69e5181ce6daa8a582bfe3d59f3af889f417134f658812be5b8b85";
    };
    opam = "${repo}/packages/ocplib-endian/ocplib-endian.1.2/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ cppo dune ocaml ];
  };
  octavius = {
    name = "octavius";
    version = "1.2.2";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-doc/octavius/archive/v1.2.2.tar.gz";
      sha256 = "1bg0fcm7haqxvx5wx2cci0mbbq0gf1vw9fa4kkd6jsriw1611jga";
    };
    opam = "${repo}/packages/octavius/octavius.1.2.2/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ogre = {
    name = "ogre";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/ogre/ogre.2.4.0/opam";
    depends = with self; [ core_kernel monads ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
  };
  ounit = {
    name = "ounit";
    version = "2.2.6";
    src = pkgs.fetchurl {
      url = "https://github.com/gildor478/ounit/releases/download/v2.2.6/ounit-2.2.6.tbz";
      sha256 = "0690fb1e0e90a18eed5c3566b3cc1825d98b0e8c7d51bb6b846c95c45a615913";
    };
    opam = "${repo}/packages/ounit/ounit.2.2.6/opam";
    depends = with self; [ ounit2 ];
    buildDepends = with self; [ ocamlfind ];
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
  parsexp = {
    name = "parsexp";
    version = "v0.14.2";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/parsexp/archive/refs/tags/v0.14.2.tar.gz";
      sha256 = "f6e17e4e08dcdce08a6372485a381dcdb3fda0f71b4506d7be982b87b5a1f230";
    };
    opam = "${repo}/packages/parsexp/parsexp.v0.14.2/opam";
    depends = with self; [ base dune ocaml sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_assert = {
    name = "ppx_assert";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_assert-v0.14.0.tar.gz";
      sha256 = "1l2rr4jz2q5b35ryn2z146z7m9v6k8krp5gpn8ilib66mnz5zx15";
    };
    opam = "${repo}/packages/ppx_assert/ppx_assert.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_cold ppx_compare ppx_here
                           ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bap = {
    name = "ppx_bap";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/ppx_bap/archive/v0.14.tar.gz";
      sha256 = "1pkswk1ghc77d2j0adyq3arf9w3r09m0zbp0zbrm73h5zclfsjdm";
    };
    opam = "${repo}/packages/ppx_bap/ppx_bap.v0.14.0/opam";
    depends = with self; [ base_quickcheck dune ocaml ppx_assert ppx_bench
                           ppx_bin_prot ppx_cold ppx_compare ppx_enumerate
                           ppx_fields_conv ppx_hash ppx_here ppx_optcomp
                           ppx_sexp_conv ppx_sexp_value ppx_variants_conv
                           ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_base = {
    name = "ppx_base";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_base-v0.14.0.tar.gz";
      sha256 = "0b7a3fmi90jk8paz0g36yzaq670fbnrbi1j8r5ibh9wbcfli7ji6";
    };
    opam = "${repo}/packages/ppx_base/ppx_base.v0.14.0/opam";
    depends = with self; [ dune ocaml ppx_cold ppx_compare ppx_enumerate
                           ppx_hash ppx_js_style ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bench = {
    name = "ppx_bench";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_bench/archive/v0.14.1.tar.gz";
      sha256 = "1jr3cf4zsk894x64c8ir9ap9l412q35b2605pr7flrlxbm4vkf3f";
    };
    opam = "${repo}/packages/ppx_bench/ppx_bench.v0.14.1/opam";
    depends = with self; [ dune ocaml ppx_inline_test ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_bin_prot = {
    name = "ppx_bin_prot";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_bin_prot-v0.14.0.tar.gz";
      sha256 = "0wa2jmvm2k88b37pbcafy1mdf5iaip0yxg5dw774sbh28nm08m2s";
    };
    opam = "${repo}/packages/ppx_bin_prot/ppx_bin_prot.v0.14.0/opam";
    depends = with self; [ base bin_prot dune ocaml ppx_here ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_cold = {
    name = "ppx_cold";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_cold-v0.14.0.tar.gz";
      sha256 = "1madfzhpir9amnxmg530n70vll0jrl59vyp71miji73i6b9sy6n2";
    };
    opam = "${repo}/packages/ppx_cold/ppx_cold.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_compare = {
    name = "ppx_compare";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_compare-v0.14.0.tar.gz";
      sha256 = "0mqxa2s194nif7x4fjn1p5gd9i3bakr8nv27gf8x1g5nmi8q9pmp";
    };
    opam = "${repo}/packages/ppx_compare/ppx_compare.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_custom_printf = {
    name = "ppx_custom_printf";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_custom_printf-v0.14.0.tar.gz";
      sha256 = "0jg6ypjcfbfsaynwih5021mxj0i1g5r2j73q6qs1qyz8xi98mw2z";
    };
    opam = "${repo}/packages/ppx_custom_printf/ppx_custom_printf.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_derivers = {
    name = "ppx_derivers";
    version = "1.2.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_derivers/archive/1.2.1.tar.gz";
      sha256 = "159vqy616ni18mn0dlv8c2y4h7mb4hahwjn53yrr59yyhzhmwndn";
    };
    opam = "${repo}/packages/ppx_derivers/ppx_derivers.1.2.1/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_enumerate = {
    name = "ppx_enumerate";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_enumerate-v0.14.0.tar.gz";
      sha256 = "1ij6sffgqhnjwnj9brhrrw1c6xgxlh0s6r17x1qkgnyrc73gfsz8";
    };
    opam = "${repo}/packages/ppx_enumerate/ppx_enumerate.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_expect = {
    name = "ppx_expect";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_expect-v0.14.0.tar.gz";
      sha256 = "1x43c69xj7h1lp9j2vryysdyximv03z4i4mm4y8kwq50j0j01cn8";
    };
    opam = "${repo}/packages/ppx_expect/ppx_expect.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_inline_test ppxlib re
                           stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fields_conv = {
    name = "ppx_fields_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_fields_conv/archive/v0.14.1.tar.gz";
      sha256 = "1qcmiz2s5achwdzp1mkp5zyvc3j6fn8ljw7g4bmfjp7svxhg6lm3";
    };
    opam = "${repo}/packages/ppx_fields_conv/ppx_fields_conv.v0.14.1/opam";
    depends = with self; [ base dune fieldslib ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_fixed_literal = {
    name = "ppx_fixed_literal";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_fixed_literal-v0.14.0.tar.gz";
      sha256 = "0w0a06143mhmczbpr0lfb66r6im7075gck4p0idbcari63sximqj";
    };
    opam = "${repo}/packages/ppx_fixed_literal/ppx_fixed_literal.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_hash = {
    name = "ppx_hash";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_hash-v0.14.0.tar.gz";
      sha256 = "0x4wgdvhgd8a49bzari52jpkykxpv6ncgp5ncda3xgg0a9r49s8n";
    };
    opam = "${repo}/packages/ppx_hash/ppx_hash.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_compare ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_here = {
    name = "ppx_here";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_here-v0.14.0.tar.gz";
      sha256 = "0b444djy68v6ji0ypwv5l02pkl151qzrgg96lyhl8dxfrzvj1zkj";
    };
    opam = "${repo}/packages/ppx_here/ppx_here.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_inline_test = {
    name = "ppx_inline_test";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_inline_test/archive/v0.14.1.tar.gz";
      sha256 = "0qzvm8rg07annl8zpqlhzx1z8ahrrf02r1brd43ykqas5sww3rfp";
    };
    opam = "${repo}/packages/ppx_inline_test/ppx_inline_test.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_jane = {
    name = "ppx_jane";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_jane-v0.14.0.tar.gz";
      sha256 = "18js98xdqf8d54sjn1gccjkwbv2p56qy7bhvjgk94pr3fipfz0v7";
    };
    opam = "${repo}/packages/ppx_jane/ppx_jane.v0.14.0/opam";
    depends = with self; [ base_quickcheck dune ocaml ppx_assert ppx_base
                           ppx_bench ppx_bin_prot ppx_custom_printf
                           ppx_expect ppx_fields_conv ppx_fixed_literal
                           ppx_here ppx_inline_test ppx_let ppx_module_timer
                           ppx_optcomp ppx_optional ppx_pipebang
                           ppx_sexp_message ppx_sexp_value ppx_stable
                           ppx_string ppx_typerep_conv ppx_variants_conv
                           ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_js_style = {
    name = "ppx_js_style";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_js_style/archive/refs/tags/v0.14.1.tar.gz";
      sha256 = "1nq4rj659f34dc28pj7ir2szqbpky4nzs9qfw0am6sf36jwispiw";
    };
    opam = "${repo}/packages/ppx_js_style/ppx_js_style.v0.14.1/opam";
    depends = with self; [ base dune ocaml octavius ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_let = {
    name = "ppx_let";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_let-v0.14.0.tar.gz";
      sha256 = "1qcrnd86pbr1di5m6z4ps4p15qawwa02jxwz3xfd82hdbjmdwf1s";
    };
    opam = "${repo}/packages/ppx_let/ppx_let.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_module_timer = {
    name = "ppx_module_timer";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_module_timer-v0.14.0.tar.gz";
      sha256 = "04a7vzk4s3jn6wj94q0hn8kd9vxlzkpcq5ifpvz3bdfgmypjks5z";
    };
    opam = "${repo}/packages/ppx_module_timer/ppx_module_timer.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio time_now ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optcomp = {
    name = "ppx_optcomp";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_optcomp-v0.14.0.tar.gz";
      sha256 = "0b4zrj9d0ph2j0lwgfwbwc7zhxzkwmld7x4kfyg1rgbi8zg9n5s7";
    };
    opam = "${repo}/packages/ppx_optcomp/ppx_optcomp.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_optional = {
    name = "ppx_optional";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_optional-v0.14.0.tar.gz";
      sha256 = "1hh6ivlp1qpvyn8l0vhrahkkcp3scf7km254sgplprmk10wnyidz";
    };
    opam = "${repo}/packages/ppx_optional/ppx_optional.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_pipebang = {
    name = "ppx_pipebang";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_pipebang-v0.14.0.tar.gz";
      sha256 = "19afbbvy72i1347prvkpy3ms75xnk7kl2hn83h40p6yh27100hky";
    };
    opam = "${repo}/packages/ppx_pipebang/ppx_pipebang.v0.14.0/opam";
    depends = with self; [ dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_conv = {
    name = "ppx_sexp_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_sexp_conv/archive/v0.14.1.tar.gz";
      sha256 = "0lpm5bjxmrb5r21fqj6w9xdyhb22c40mic5h8pal8d5r9kf4gy6c";
    };
    opam = "${repo}/packages/ppx_sexp_conv/ppx_sexp_conv.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_message = {
    name = "ppx_sexp_message";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_sexp_message-v0.14.0.tar.gz";
      sha256 = "10nilix3k1x25b0yxz8yvhyvsrmhdlxln0j0xadc1p7lspz0811n";
    };
    opam = "${repo}/packages/ppx_sexp_message/ppx_sexp_message.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_sexp_value = {
    name = "ppx_sexp_value";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/ppx_sexp_value-v0.14.0.tar.gz";
      sha256 = "0yc6i1yx9mb8pwjkswy09aqg5kz1hgrpjyniq2v6whfjvxl1qrkj";
    };
    opam = "${repo}/packages/ppx_sexp_value/ppx_sexp_value.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_here ppx_sexp_conv ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_stable = {
    name = "ppx_stable";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_stable/archive/v0.14.1.tar.gz";
      sha256 = "1dw8ilrvi5lssxnbflnzskmyi3k93ij2kbyz49y93agv0b8dsq01";
    };
    opam = "${repo}/packages/ppx_stable/ppx_stable.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_string = {
    name = "ppx_string";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_string/archive/v0.14.1.tar.gz";
      sha256 = "1a8f7bplbxvwm4lh0m57j89jkwkxfm9r5ndcvvlj5v6py8pv69wj";
    };
    opam = "${repo}/packages/ppx_string/ppx_string.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppx_base ppxlib stdio ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_tools_versioned = {
    name = "ppx_tools_versioned";
    version = "5.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppx_tools_versioned/archive/5.4.0.tar.gz";
      sha256 = "0sw2676vgbsj133lgs3sl8494fhfldafzvgw4j4dnb1wqwha6pxy";
    };
    opam = "${repo}/packages/ppx_tools_versioned/ppx_tools_versioned.5.4.0/opam";
    depends = with self; [ dune ocaml ocaml-migrate-parsetree ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_typerep_conv = {
    name = "ppx_typerep_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_typerep_conv/archive/v0.14.1.tar.gz";
      sha256 = "056wcx48x52ws1bh6mjk7kwflaqr0892pixlacmrffz8b7n8zrcj";
    };
    opam = "${repo}/packages/ppx_typerep_conv/ppx_typerep_conv.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib typerep ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppx_variants_conv = {
    name = "ppx_variants_conv";
    version = "v0.14.1";
    src = pkgs.fetchurl {
      url = "https://github.com/janestreet/ppx_variants_conv/archive/v0.14.1.tar.gz";
      sha256 = "00rqyghszjm6sp6r4b7b7lwkypiwkmkr1w02v3bjsragzml0alg0";
    };
    opam = "${repo}/packages/ppx_variants_conv/ppx_variants_conv.v0.14.1/opam";
    depends = with self; [ base dune ocaml ppxlib variantslib ];
    buildDepends = with self; [ dune ocaml ];
  };
  ppxlib = {
    name = "ppxlib";
    version = "0.15.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-ppx/ppxlib/releases/download/0.15.0/ppxlib-0.15.0.tbz";
      sha256 = "0b630d7f8d74a899a55cc27188b5ce03e735a93f07ea0c2de56532d8fd93b330";
    };
    opam = "${repo}/packages/ppxlib/ppxlib.0.15.0/opam";
    depends = with self; [ dune ocaml ocaml-compiler-libs
                           ocaml-migrate-parsetree ppx_derivers sexplib0
                           stdlib-shims ];
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
  react = {
    name = "react";
    version = "1.2.2";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/react/releases/react-1.2.2.tbz";
      sha512 = "18cdd544d484222ba02db6bd9351571516532e7a1c107b59bbe39193837298f5c745eab6754f8bc6ff125b387be7018c6d6e6ac99f91925a5e4f53af688522b1";
    };
    opam = "${repo}/packages/react/react.1.2.2/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  regular = {
    name = "regular";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/regular/regular.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ppx_bap ];
    buildDepends = with self; [ oasis ocaml ];
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
  sexplib = {
    name = "sexplib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib-v0.14.0.tar.gz";
      sha256 = "12rlnc6fcrjfdn3gs2agi418sj54ighhs6dfll37zcv7mgywblm2";
    };
    opam = "${repo}/packages/sexplib/sexplib.v0.14.0/opam";
    depends = with self; [ dune num ocaml parsexp sexplib0 ];
    buildDepends = with self; [ dune ocaml ];
  };
  sexplib0 = {
    name = "sexplib0";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/sexplib0-v0.14.0.tar.gz";
      sha256 = "0adrc0r1vvvr41dcpj8jwkzh1dfgqf0mks9xlnnskqfm3a51iavg";
    };
    opam = "${repo}/packages/sexplib0/sexplib0.v0.14.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  splittable_random = {
    name = "splittable_random";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/splittable_random-v0.14.0.tar.gz";
      sha256 = "185rpmdnrzs80br138pnjbx9hfp1046zvj1ap0brq1sxdwzak6lf";
    };
    opam = "${repo}/packages/splittable_random/splittable_random.v0.14.0/opam";
    depends = with self; [ base dune ocaml ppx_assert ppx_bench
                           ppx_inline_test ppx_sexp_message ];
    buildDepends = with self; [ dune ocaml ];
  };
  stdio = {
    name = "stdio";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/stdio-v0.14.0.tar.gz";
      sha256 = "1hj5hraprqy2i90a690l11yjszvb99j818q3d684ryx6p2lddk0l";
    };
    opam = "${repo}/packages/stdio/stdio.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
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
  stringext = {
    name = "stringext";
    version = "1.6.0";
    src = pkgs.fetchurl {
      url = "https://github.com/rgrinberg/stringext/releases/download/1.6.0/stringext-1.6.0.tbz";
      sha256 = "db41f5d52e9eab17615f110b899dfeb27dd7e7f89cd35ae43827c5119db206ea";
    };
    opam = "${repo}/packages/stringext/stringext.1.6.0/opam";
    depends = with self; [ base-bytes dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  text-tags = {
    name = "text-tags";
    version = "2.4.0";
    src = pkgs.fetchurl {
      url = "https://github.com/BinaryAnalysisPlatform/bap/archive/v2.4.0.tar.gz";
      sha256 = "1mfjwf35iwbd4l6w4kmd83nysjnmh3vnpp3lj5kvs0pnlhgsgbb3";
    };
    opam = "${repo}/packages/text-tags/text-tags.2.4.0/opam";
    depends = with self; [ core_kernel ocaml ];
    buildDepends = with self; [ oasis ocaml ];
  };
  time_now = {
    name = "time_now";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/time_now-v0.14.0.tar.gz";
      sha256 = "0hkn2jw4dz5gflnsblskl5wp6z7zbrahwjmaxmsskfviwjg82cqh";
    };
    opam = "${repo}/packages/time_now/time_now.v0.14.0/opam";
    depends = with self; [ base dune jane-street-headers jst-config ocaml
                           ppx_base ppx_optcomp ];
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
  trie = {
    name = "trie";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/kandu/trie/archive/1.0.0.tar.gz";
      sha256 = "1slq4kiwnc723dsaw15ms7xxpqz061v8zck1m6iyc5j2li70by62";
    };
    opam = "${repo}/packages/trie/trie.1.0.0/opam";
    depends = with self; [ dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  typerep = {
    name = "typerep";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/typerep-v0.14.0.tar.gz";
      sha256 = "0rmp5jsjg6sgn5yx0pcvch0phs7nak2fg1d48g5sjcyyyj8n1279";
    };
    opam = "${repo}/packages/typerep/typerep.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  uri = {
    name = "uri";
    version = "4.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/mirage/ocaml-uri/releases/download/v4.2.0/uri-v4.2.0.tbz";
      sha256 = "c5c013d940dbb6731ea2ee75c2bf991d3435149c3f3659ec2e55476f5473f16b";
    };
    opam = "${repo}/packages/uri/uri.4.2.0/opam";
    depends = with self; [ angstrom dune ocaml stringext ];
    buildDepends = with self; [ dune ocaml ];
  };
  utop = {
    name = "utop";
    version = "2.9.1";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/utop/releases/download/2.9.1/utop-2.9.1.tbz";
      sha512 = "002fa809d4924419f51b81df968b653a111ae5992837792fcb867adf2e44c15d40fadccc9784ef61f21ea3233f9da74016433920bf909d808752b7f825f8cdb1";
    };
    opam = "${repo}/packages/utop/utop.2.9.1/opam";
    depends = with self; [ base-threads base-unix camomile dune lambda-term
                           lwt lwt_react ocaml ocamlfind react ];
    buildDepends = with self; [ cppo dune ocaml ocamlfind ];
  };
  uuidm = {
    name = "uuidm";
    version = "0.9.8";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/uuidm/releases/uuidm-0.9.8.tbz";
      sha512 = "d5073ae49c402ab3ea6dc8f86bc5b8cc14129437e23e47da4d91431648fcb31c4dce6308f9c936c58df9a2c6afda61d77105a3022e369cca4e4c140320e803b5";
    };
    opam = "${repo}/packages/uuidm/uuidm.0.9.8/opam";
    depends = with self; [ ocaml (self.cmdliner or null) ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  variantslib = {
    name = "variantslib";
    version = "v0.14.0";
    src = pkgs.fetchurl {
      url = "https://ocaml.janestreet.com/ocaml-core/v0.14/files/variantslib-v0.14.0.tar.gz";
      sha256 = "11zp27gh282dx9ifbhcp6i7fkc97fvk8amaj58mf1g1hwklc0lm3";
    };
    opam = "${repo}/packages/variantslib/variantslib.v0.14.0/opam";
    depends = with self; [ base dune ocaml ];
    buildDepends = with self; [ dune ocaml ];
  };
  xmlm = {
    name = "xmlm";
    version = "1.4.0";
    src = pkgs.fetchurl {
      url = "https://erratique.ch/software/xmlm/releases/xmlm-1.4.0.tbz";
      sha512 = "69f6112e6466952256d670fe1751fe4ae79e20d50f018ece1709eb2240cb1b00968ac7cee110771e0617a38ebc1cdb43e9d146471ce66ac1b176e4a1660531eb";
    };
    opam = "${repo}/packages/xmlm/xmlm.1.4.0/opam";
    depends = with self; [ ocaml ];
    buildDepends = with self; [ ocaml ocamlbuild ocamlfind topkg ];
  };
  z3 = {
    name = "z3";
    version = "4.8.14";
    src = pkgs.fetchurl {
      url = "https://github.com/Z3Prover/z3/archive/refs/tags/z3-4.8.14.tar.gz";
      sha256 = "96a1f49a7701120cc38bfa63c02ff93be4d64c7926cea41977dedec7d87a1364";
    };
    opam = "${repo}/packages/z3/z3.4.8.14/opam";
    depends = with self; [ conf-gmp ocaml zarith ];
    buildDepends = with self; [ conf-python-3 ocaml ocamlfind ];
    depexts = with pkgs; [ (pkgs.python3-distutils or null) ];
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
  zed = {
    name = "zed";
    version = "3.1.0";
    src = pkgs.fetchurl {
      url = "https://github.com/ocaml-community/zed/archive/3.1.0.tar.gz";
      sha256 = "1z95fs49hi00xy078a83m0vfdqwjb5953rwr15lfpirldi4v11y3";
    };
    opam = "${repo}/packages/zed/zed.3.1.0/opam";
    depends = with self; [ base-bytes camomile charInfo_width dune ocaml
                           react ];
    buildDepends = with self; [ dune ocaml ];
  };
}
