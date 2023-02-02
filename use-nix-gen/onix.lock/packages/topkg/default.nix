{
  name = "topkg";
  version = "1.0.5";,
  src = {
    url = "https://erratique.ch/software/topkg/releases/topkg-1.0.5.tbz";
    sha512 = "9450e9139209aacd8ddb4ba18e4225770837e526a52a56d94fd5c9c4c9941e83e0e7102e2292b440104f4c338fabab47cdd6bb51d69b41cc92cc7a551e6fefab";
  };
  depends = [ "ocaml" "ocamlbuild" ];
  build-depends = [ "ocamlbuild" "ocamlfind" ];
  build = [
    ["ocaml" "pkg/pkg.ml" "build" "--pkg-name" "topkg" "--dev-pkg" "false"]
  ];
}
