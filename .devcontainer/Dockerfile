# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.209.6/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version (use Debian 11/9, Ubuntu 18.04/21.04 on local arm64/Apple Silicon): debian-11, debian-10, debian-9, ubuntu-21.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends build-essential manpages-dev gcc-11 g++-11 build-essential libtool autoconf unzip wget libssl-dev \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110 \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 110 \
    && update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-11 110

ENV version=3.22
ENV build=1

# CMake 3.22.1
RUN apt-get update \
    && apt-get install build-essential libtool autoconf unzip wget libssl-dev valgrind -y \
    && apt autoremove -y \
    && mkdir /temp \
    && wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz \
    && tar -xzvf cmake-$version.$build.tar.gz \
    && cd cmake-$version.$build/ \
    && ./bootstrap \
    && make -j$(nproc) \
    && make install \
    && rm -rf $PWD/temp \
    && ln -sf /usr/local/bin/cmake /usr/bin/cmake