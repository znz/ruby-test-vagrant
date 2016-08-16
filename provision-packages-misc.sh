#!/bin/bash
set -euxo pipefail
export DEBIAN_FRONTEND=noninteractive
apt-get install -y lv
apt-get install -y zsh
apt-get install -y silversearcher-ag
