FROM centos:7
MAINTAINER Jun-Hee Lee <jh.lee@n3n.io>

# Run upgrades
RUN yum -y update; yum clean all

# Install basic packages
RUN yum -y install wget net-tools yum-utils; yum clean all

# Install nodejs
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum -y install nodejs; yum clean all

# Install mono
RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
RUN yum -y install mono-complete-4.2.1.102-0; yum clean all


CMD ["/bin/bash"]
