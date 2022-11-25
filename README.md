# Onix Examples

This repository contains usage examples for [onix](https://github.com/odis-labs/onix) - a nix-based build tool for OCaml.

Every folder in this repository is a standalone example that demonstrates the different project scenarios.

Navigate to the folder of the example that you want to run and try some of the following commands.

### Regenerate a lock file

```
$ nix develop -f default lock
```

### Start a development shell

```
$ nix develop -f ./default.nix -j8 shell
```

### Build all root packages

```
$ nix build -f ./default.nix -j8 all
```
