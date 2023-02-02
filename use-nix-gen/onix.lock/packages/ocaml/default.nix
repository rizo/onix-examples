{
  name = "ocaml";
  version = "4.14.0";
  depends = [ "ocaml-config" "ocaml-system" ];
  build-depends = [ "ocaml-system" ];
  build = [
    ["ocaml" "%{ocaml-config}%/share/ocaml-config/gen_ocaml_config.ml" "4.14.0" "ocaml"]
  ];
}
