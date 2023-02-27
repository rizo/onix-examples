# hello-ocaml-5

This example uses the version 5 of the OCaml compiler.


## Usage

Build the example:
```
$ make build
```

Start a development shell:
```
$ make shell
[onix]$ dune build
```

Update the lock file:
```
$ make lock
```

## Using the development version of `eio`.

Update the opam file to use `pin-depends`:

```
pin-depends: [
  "eio.dev" "git+https://github.com/ocaml-multicore/eio#fd3333678645bc593557f21fa9f555a1e010a845"
  "eio_luv.dev" "git+https://github.com/ocaml-multicore/eio#fd3333678645bc593557f21fa9f555a1e010a845"
  "eio_main.dev" "git+https://github.com/ocaml-multicore/eio#fd3333678645bc593557f21fa9f555a1e010a845"
]
```
