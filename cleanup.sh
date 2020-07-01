#!/bin/bash

FILES=(
  /usr/local/lib/libsoftokn.a
  /usr/local/lib/libykpiv.a
  /usr/local/lib/libykcs11.la
  /usr/local/lib/libykpiv.la
  /usr/local/include/ykcs11/ykcs11-version.h
  /usr/local/include/ykpiv/ykpiv-version.h
  /usr/local/include/ykpiv/ykpiv.h
)

for file in ${FILES[@]}; do
  echo "=> remove $file"
  sudo rm -f $file
done
