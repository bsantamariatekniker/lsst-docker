# Base image
FROM centos:centos7

# Install sudo, add lsst user and let it use sudo
RUN yum -y install sudo && useradd -ms /bin/bash lsst && echo "lsst   ALL=(ALL)    NOPASSWD: ALL" >> /etc/sudoers

# Install dependencies
RUN yum install -y epel-release &&\
    yum install -y boost-devel git python3 which make gcc-c++ nc gdb tmux cmake3 &&\
    ln -s /usr/bin/cmake3 /usr/bin/cmake

# Set the default user to lsst
USER lsst
WORKDIR /home/lsst