#!/bin/bash

export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CFLAGS="-O2 -g -fPIC $CFLAGS"

# Get rid of any `.la`.
find $PREFIX/lib -name '*.la' -delete

autoreconf -i
chmod +x configure

./configure \
    --prefix="$PREFIX"

make
make check
make install

if [ -f $PREFIX/share/doc/rw/Hängematte ]; then
  echo "Changing the unicode file name"
  mv $PREFIX/share/doc/rw/Hängematte $PREFIX/share/doc/rw/Hangematte
fi
