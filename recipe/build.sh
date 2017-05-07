#!/bin/bash

export CPPFLAGS="-I$PREFIX/include $CPPFLAGS"
export LDFLAGS="-L$PREFIX/lib $LDFLAGS"
export LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"
export CFLAGS="-O2 -g -fPIC $CFLAGS"

autoreconf -i
chmod +x configure

./configure \
    --prefix="$PREFIX" \
   --enable-executable=no

make
make check
make install

if [ -f $PREFIX/share/doc/rw/Hängematte ]; then
  echo "Changing the unicode file name"
  mv $PREFIX/share/doc/rw/Hängematte $PREFIX/share/doc/rw/Hangematte
fi
