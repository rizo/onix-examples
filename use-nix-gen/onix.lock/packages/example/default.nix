{
  name = "example";
  version = "dev";,
  src = { url = "file://."; };
  depends = [ "fmt" "gmp" "ocaml" "pp" "zarith" ];
  build-depends = [ "dune" ];
  build = [
    ["dune" "subst"]
    ["dune" "build" "-p" "example" "-j" "%{jobs}%" "@install"]
  ];
}
