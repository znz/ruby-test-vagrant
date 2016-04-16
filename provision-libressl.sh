#!/bin/bash
set -euxo pipefail
VERSION=2.3.3
cd "$HOME"
if ! gpg --list-keys | grep -q D5E4D8D5; then
  curl http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl.asc | gpg --import
fi
if [ ! -f "libressl-${VERSION}.tar.gz" ]; then
  wget -N "http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${VERSION}.tar.gz"{,.asc}
fi
gpg "libressl-${VERSION}.tar.gz.asc"
if [ ! -d "libressl-${VERSION}" ]; then
  tar zxf "libressl-${VERSION}.tar.gz"
fi
cd "libressl-${VERSION}"
./configure --prefix="$HOME/local"
make
make check
make install
