{
  name = "conf-m4";
  version = "1";
  depexts = with nixpkgs; [ "nixpkgs.m4" ];
  build = [
    ["sh" "-exc" "echo | m4"]
  ];
}
