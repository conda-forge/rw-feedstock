#!/bin/bash

export CFLAGS="-O2 -g -fPIC $CFLAGS"

autoreconf -i
chmod +x configure

./configure \
    --prefix="$PREFIX"

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install

if [ -f $PREFIX/share/doc/rw/Hängematte ]; then
  echo "Changing the unicode file name"
  mv $PREFIX/share/doc/rw/Hängematte $PREFIX/share/doc/rw/Hangematte
fi
