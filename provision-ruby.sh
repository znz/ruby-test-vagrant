#!/bin/bash
set -euxo pipefail
if [ -d "$HOME/.anyenv" ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  set +x
  eval "$(anyenv init - --no-rehash)"
  set -x
fi
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  set +x
  eval "$(rbenv init - --no-rehash)"
  set -x
fi
RUBY_SRCDIR="$HOME/ruby"
if [ ! -d "$RUBY_SRCDIR" ]; then
  git clone https://github.com/ruby/ruby "$RUBY_SRCDIR"
fi
if [ ! -f "$RUBY_SRCDIR/configure" ]; then
  pushd "$RUBY_SRCDIR"
  autoconf
  popd
fi
if ! grep -q /build/ "$RUBY_SRCDIR/.git/info/exclude"; then
  echo "/build/" >> "$RUBY_SRCDIR/.git/info/exclude"
fi
if [ ! -f "$(rbenv root)/versions/git/bin/ruby" ]; then
  mkdir -p "$RUBY_SRCDIR/build"
  cd "$RUBY_SRCDIR/build"
  if [ "$(lsb_release -cs)" = "precise" ]; then
    BASERUBY=--with-baseruby=/usr/bin/ruby1.9.1
    CC="ccache gcc"
  else
    BASERUBY=--with-baseruby=/usr/bin/ruby
    CC="ccache clang"
  fi
  ../configure --prefix="$(rbenv root)/versions/git" --with-openssl-dir="$HOME/local" --enable-shared --enable-debug-env CPPFLAGS='-DRUBY_DEBUG_ENV -DARRAY_DEBUG' --with-valgrind "$BASERUBY" --disable-install-doc CC="$CC"
  make
  make install
  rbenv rehash
  rbenv global git
fi
