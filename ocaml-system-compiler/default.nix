let
  onix = import (builtins.fetchGit {
    url = "https://github.com/rizo/onix.git";
    rev = "ec732a8cb5bd74854591a2794f9cde84d9f62e96";
  }) { verbosity = "info"; };

in onix.env {
  path = ./.;
  repos = [{
    url = "https://github.com/ocaml/opam-repository.git";
    rev = "9e6ae0a9398cf087ec2b3fbcd62cb6072ccf95ce";
  }];
  deps = { "ocaml-system" = "*"; };
}
