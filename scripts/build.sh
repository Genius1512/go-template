#!/bin/bash

if [ $1 == "all" ] ; then  
  BIN_DIRS=("cmd" "examples")

  for BIN_DIR in ${BIN_DIRS[@]} ; do
    for pkg in $BIN_DIR/*/ ; do
      if [ "$pkg" != "${a//[\[\]|.? +*]/}"  ] ; then
        continue
      fi


      base=$(basename "$pkg")

      go build -o "bin/$base" "$pkg/main.go"
    done
  done
else
  BIN_DIRS=("cmd" "examples")

  for BIN_DIR in ${BIN_DIRS[@]} ; do
    for pkg in $BIN_DIR/*/ ; do   
      base=$(basename "$pkg")

      if [ "$base" = "$1" ] ; then
        go build -o "bin/$base" "$pkg/main.go"
        exit 0
      fi
    done
  done

  echo "Could not find any pkgs to build"
  exit 1
fi

