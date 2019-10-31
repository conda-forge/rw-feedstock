#!/bin/bash

export CFLAGS="-O2 -g -fPIC $CFLAGS"

autoreconf -i
chmod +x configure

./configure \
    --prefix="$PREFIX"

make -j${CPU_COUNT}
make check
make install

if [ -f $PREFIX/share/doc/rw/Hängematte ]; then
  echo "Changing the unicode file name"
  mv $PREFIX/share/doc/rw/Hängematte $PREFIX/share/doc/rw/Hangematte
fi
