# hello-ocaml-5

This example uses OCaml 5 compiler with domainslib. The compiler will be built from source.


## Usage

Start a development shell and run the example:
```
$ make shell
[onix]$ dune build
[onix]$ dune exec -- ./example.exe 4 42
```

Update the lock file:
```
$ make lock
```
