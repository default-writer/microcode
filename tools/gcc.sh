#!/bin/bash -e
apt-get update -y
apt upgrade -y
apt-get install gcc-11 g++-11 -y
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-11 110
apt autoremove -y