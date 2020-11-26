# Base image
FROM centos:centos7

# Install sudo, add lsst user and let it use sudo
RUN yum -y install sudo && useradd -ms /bin/bash lsst && echo "lsst   ALL=(ALL)    NOPASSWD: ALL" >> /etc/sudoers

# Copy the installer script and the xml folder
COPY --chown=lsst:lsst ts_sal_installation /home/lsst/

# Run the installer as user lsst
RUN chmod a+x /home/lsst/sal_install && su -c /home/lsst/sal_install lsst && rm /home/lsst/sal_install && rm -r /home/lsst/xml

# Set the default user to lsst
USER lsst
WORKDIR /home/lsst