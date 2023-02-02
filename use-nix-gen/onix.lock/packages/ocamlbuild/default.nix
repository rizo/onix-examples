{
  name = "ocamlbuild";
  version = "0.14.1";,
  src = {
    url = "https://github.com/ocaml/ocamlbuild/archive/refs/tags/0.14.1.tar.gz";
    sha512 = "1f5b43215b1d3dc427b9c64e005add9d423ed4bca9686d52c55912df8955647cb2d7d86622d44b41b14c4f0d657b770c27967c541c868eeb7c78e3bd35b827ad";
  };
  depends = [ "ocaml" ];
  build = [
    ["make" "-f" "configure.make" "all" "OCAMLBUILD_PREFIX=%{prefix}%" "OCAMLBUILD_BINDIR=%{prefix}%/bin" "OCAMLBUILD_LIBDIR=%{prefix}%/lib/ocaml/4.14.0/site-lib" "OCAMLBUILD_MANDIR=%{prefix}%/man" "OCAML_NATIVE=true" "OCAML_NATIVE_TOOLS=true"]
    ["make" "check-if-preinstalled" "all" "opam-install"]
  ];
}
