{
  name = "zarith";
  version = "1.12";,
  src = {
    url = "https://github.com/ocaml/Zarith/archive/release-1.12.tar.gz";
    sha512 = "8075573ae65579a2606b37dd1b213032a07d220d28c733f9288ae80d36f8a2cc4d91632806df2503c130ea9658dc207ee3a64347c21aa53969050a208f5b2bb4";
  };
  depends = [ "conf-gmp" "ocaml" "ocamlfind" ];
  build-depends = [ "ocamlfind" ];
  build = [
    [["./configure"] { when = ''os != "openbsd" && os != "freebsd" && os != "macos"''; }]
    [["sh" "-exc" "LDFLAGS=\"$LDFLAGS -L/usr/local/lib\" CFLAGS=\"$CFLAGS -I/usr/local/include\" ./configure"] { when = ''os == "openbsd" || os == "freebsd"''; }]
    [["sh" "-exc" "LDFLAGS=\"$LDFLAGS -L/opt/local/lib -L/usr/local/lib\" CFLAGS=\"$CFLAGS -I/opt/local/include -I/usr/local/include\" ./configure"] { when = ''os == "macos"''; }]
    ["make"]
  ];
}
