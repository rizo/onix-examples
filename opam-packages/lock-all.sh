#!/usr/bin/env bash

set -e
set -u
set -o pipefail

ROOT=$(dirname "$0")

ONIX=$HOME/Developer/Repositories/odis-labs/onix/_build/default/onix/Main.exe
REPO=https://github.com/ocaml/opam-repository.git#52c72e08d7782967837955f1c50c330a6131721f

for pkg in `ls _output`
do
  echo "Generating lock file for $pkg..."
  pushd $ROOT/_output/$pkg
  if test -f ./onix-lock.nix
  then
    :
  else
    $ONIX lock \
      --repo-url=$REPO \
      --lock-file=./onix-lock.nix \
      --verbosity=debug \
      --with-test=false --with-doc=false --with-tools=false \
    || echo "Skipping $pkg..."
  fi
  popd
done

