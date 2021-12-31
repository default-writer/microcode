#!/bin/bash -e
version=3.22
build=1
sudo apt-get update -y
sudo apt upgrade -y
sudo apt remove '^cmake.*' -y --purge
sudo apt-get install gcc-11 g++-11 build-essential libtool autoconf unzip wget libssl-dev -y
sudo apt autoremove -y
[ -d "$PWD/temp" ] && sudo rm -rf $PWD/temp
mkdir $PWD/temp
cd $PWD/temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j$(nproc)
sudo make install
[ -d "$PWD/temp" ] && rm -rf $PWD/temp