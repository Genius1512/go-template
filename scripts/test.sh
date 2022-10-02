#!/bin/bash

if [ "$1" = "all" ]; then
  PKG_DIRS=("cmd" "examples" "internal" "pkg")

  for PKG_DIR in "${PKG_DIRS[@]}" ; do
    for pkg in "$PKG_DIR"/*/ ; do
      (cd "$pkg" && go test)
    done
  done
else
  PKG_DIRS=("cmd" "examples" "internal" "pkg")

  for PKG_DIR in "${PKG_DIRS[@]}" ; do
    for pkg in "$PKG_DIR/"*/ ; do  
      base=$(basename "$pkg")

      if [ "$base" = "$1" ] ; then
        (cd "$pkg" && go test)
        exit 0
      fi
    done
  done

  echo "Could not find any pkgs to test"
  exit 1
fi

