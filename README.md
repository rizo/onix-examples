# Onix Examples

This repository contains usage examples for [onix](https://github.com/rizo/onix) - a nix-based build tool for OCaml.

Every folder in this repository is a standalone example that demonstrates the different project scenarios.

Navigate to the folder of the example that you want to run and try some of the following commands.


### Start a development shell

```
$ make shell
$ dune build
```

### Regenerate a lock file

```
$ make lock
$ ls onix-lock.json
```

### Build root opam packages

```
$ make build
$ ls ./result
```
