{
  name = "conf-gmp";
  version = "4";
  depexts = with nixpkgs; [ "nixpkgs.gmp" ];
  build = [
    [["sh" "-exc" "cc -c $CFLAGS -I/usr/local/include test.c"] { when = ''os != "macos" && os != "win32"''; }]
    [["sh" "-exc" "cc -c $CFLAGS -I/opt/homebrew/include -I/opt/local/include -I/usr/local/include test.c"] { when = ''os == "macos"''; }]
  ];
  extra-files = [
    ./test.c
  ];
}
