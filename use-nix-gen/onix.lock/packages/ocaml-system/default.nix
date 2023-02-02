{
  name = "ocaml-system";
  version = "4.14.0";
  depexts = with nixpkgs; [ "nixpkgs.ocaml-ng.ocamlPackages_4_14.ocaml" ];
  build = [
    ["ocaml" "gen_ocaml_config.ml"]
  ];
  extra-files = [
    ./gen_ocaml_config.ml.in
  ];
}
