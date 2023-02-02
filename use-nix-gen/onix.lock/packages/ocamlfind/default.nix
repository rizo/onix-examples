{
  name = "ocamlfind";
  version = "1.9.5";,
  src = {
    url = "http://download.camlcity.org/download/findlib-1.9.5.tar.gz";
    sha512 = "03514c618a16b02889db997c6c4789b3436b3ad7d974348d2c6dea53eb78898ab285ce5f10297c074bab4fd2c82931a8b7c5c113b994447a44abb30fca74c715";
  };
  patches = [
    ./0001-Fix-bug-when-installing-with-a-system-compiler.patch
  ];
  depends = [ "ocaml" ];
  build = [
    ["./configure" "-bindir" "%{prefix}%/bin" "-sitelib" "%{prefix}%/lib/ocaml/4.14.0/site-lib" "-mandir" "%{prefix}%/man" "-config" "%{prefix}%/lib/ocaml/4.14.0/site-lib/findlib.conf" "-no-custom" "-no-topfind"]
    ["make" "all"]
    ["make" "opt"]
  ];
  extra-files = [
    ./0001-Fix-bug-when-installing-with-a-system-compiler.patch
  ];
}
