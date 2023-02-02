{
  name = "ocaml-config";
  version = "2";
  depends = [ "ocaml-system" ];
  build-depends = [ "ocaml-system" ];
  extra-files = [
    ./gen_ocaml_config.ml.in
    ./ocaml-config.install
  ];
}
