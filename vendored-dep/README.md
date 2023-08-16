# use-vendored-dep

Vendor a package and add it as a root. Particularly useful for vendoring dune packages as they can be built in the shell when the main package is built.


For vendored dune packages it is recommended to create a dune file with:

```
(vendored_dirs vendor)
```

## TODO

This example is currently broken:

```
nix build -f default.nix -j auto -v
error: attribute 'vendor/pp/pp' missing

       at /nix/store/fr1n8jqanwlcahrm8cznrcnpagpz1cab-source/nix/api.nix:297:38:

          296|       rootPkgNames = opamRootsToPackageNames config.opamFiles;
          297|       rootPkgs = builtins.map (name: allPkgs.${name}) rootPkgNames;
             |                                      ^
          298|
(use '--show-trace' to show detailed location information)
```