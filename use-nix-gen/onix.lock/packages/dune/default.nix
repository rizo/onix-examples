{
  name = "dune";
  version = "3.4.1";,
  src = {
    url = "https://github.com/ocaml/dune/releases/download/3.4.1/dune-3.4.1.tbz";
    sha256 = "299fa33cffc108cc26ff59d5fc9d09f6cb0ab3ac280bf23a0114cfdc0b40c6c5";
  };
  depends = [ "base-threads" "base-unix" "ocaml" ];
  build = [
    ["ocaml" "bootstrap.ml" "-j" "%{jobs}%"]
    ["./dune.exe" "build" "dune.install" "--release" "--profile" "dune-bootstrap" "-j" "%{jobs}%"]
  ];
}
