#!/bin/bash -e
version=3.22
build=1
apt-get update -y
apt upgrade -y
apt remove '^cmake.*' -y --purge
apt-get install build-essential libtool autoconf unzip wget libssl-dev -y
apt autoremove -y
[ ! -d "$PWD/temp" ] && mkdir $PWD/temp
cd $PWD/temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j$(nproc)
make install
[ -d "$PWD/temp" ] && rm -rf $PWD/temp
ln -sf /usr/local/bin/cmake /usr/bin/cmake