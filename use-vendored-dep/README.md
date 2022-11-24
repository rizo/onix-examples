# use-vendored-dep

Vendor a package and add it as a root. Particularly useful for vendoring dune packages as they can be built in the shell when the main package is built.


For vendored dune packages it is recommended to create a dune file with:

```
(vendored_dirs vendor)
```

