#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get install -y etckeeper git
sed -i -e 's/^#VCS="git"/VCS="git"/' -e 's/^VCS="bzr"/#VCS="bzr"/' -e 's/^GIT_COMMIT_OPTIONS=""/GIT_COMMIT_OPTIONS="-v"/' /etc/etckeeper/etckeeper.conf
etckeeper init 'Initial commit'
etckeeper commit 'Setup etckeeper' || :
sed -i -e 's,//archive\.ubuntu\.com,//jp.archive.ubuntu.com,' /etc/apt/sources.list
sed -i -e 's,//httpredir\.debian\.org,//ftp.jp.debian.org,' /etc/apt/sources.list
etckeeper commit 'Use JP mirror' || :
apt-get update || :
apt-get purge -y nano
apt-get install -y vim
#apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
apt-get install -y autoconf bison build-essential libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
apt-get install -y lv
apt-get install -y clang
apt-get install -y ccache
apt-get install -y ruby
[ "$(lsb_release -cs)" = "precise" ] && apt-get install -y ruby1.9.1
apt-get install -y language-pack-ja || {
  sed -i -e 's/^# ja_JP.UTF-8/ja_JP.UTF-8/' /etc/locale.gen
  locale-gen
}
update-locale LANG=ja_JP.UTF-8
etckeeper commit 'Setup Japanese locale' || :
timedatectl set-timezone Asia/Tokyo || ln -sf ../usr/share/zoneinfo/Asia/Tokyo /etc/localtime
etckeeper commit 'Setup Japanese timezone' || :
