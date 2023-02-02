{
  name = "gmp";
  version = "6.2.1+3";,
  src = {
    url = "https://github.com/mirage/ocaml-gmp/releases/download/6.2.1-3/gmp-6.2.1-3.tbz";
    sha256 = "eb2ec4143f5a74f10d7fc7318c323328f3c4fa5455ffd793f6e813423b27f66b";
  };
  depends = [ "conf-m4" "dune" "ocaml" ];
  build-depends = [ "dune" ];
  build = [
    ["dune" "build" "-p" "gmp" "-j" "%{jobs}%"]
    [["dune" "runtest" "-p" "gmp" "-j" "%{jobs}%"] { when = ''with-test''; }]
  ];
}
