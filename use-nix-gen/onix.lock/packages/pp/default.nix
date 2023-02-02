{
  name = "pp";
  version = "1.1.2";,
  src = {
    url = "https://github.com/ocaml-dune/pp/releases/download/1.1.2/pp-1.1.2.tbz";
    sha256 = "e4a4e98d96b1bb76950fcd6da4e938c86d989df4d7e48f02f7a44595f5af1d56";
  };
  depends = [ "dune" "ocaml" ];
  build-depends = [ "dune" ];
  build = [
    ["dune" "build" "-p" "pp" "-j" "%{jobs}%" "@install"]
  ];
}
