#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get purge -y nano
apt-get install -y vim
apt-get install -y cron-apt
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
apt-get install -y byobu
apt-get install -y ccache
apt-get install -y clang
apt-get install -y curl
apt-get install -y subversion
apt-get install -y ruby
if [ "$(lsb_release -cs)" = "precise" ]; then
  apt-get install -y ruby1.9.1
fi
