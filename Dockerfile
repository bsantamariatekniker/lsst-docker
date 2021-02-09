# Base image
FROM brusapa/centos-clang-extra-tools:centos7

# Install dependencies
RUN yum install -y epel-release &&\
    yum install -y boost-devel git python3 make gcc-c++ nc gdb tmux cmake3 &&\
    ln -s /usr/bin/cmake3 /usr/bin/cmake
