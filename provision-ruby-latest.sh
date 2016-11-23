#!/bin/bash
set -euxo pipefail
export RUBY_BUILD_CACHE_PATH=/vagrant/ruby
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
export RUBY_CONFIGURE_OPTS="--disable-install-doc"
ver=$(rbenv install --list | sed -ne '/^ *[[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+$/h;$x;$s/^ *//p')
if ! RBENV_VERSION=$ver ruby -v 2>/dev/null; then
  set -x
  if [ -f "/vagrant/ruby-${ver}.patch" ]; then
    rbenv install --patch "$ver" < "/vagrant/ruby-${ver}.patch"
  else
    rbenv install "$ver"
  fi
  set +x
fi
