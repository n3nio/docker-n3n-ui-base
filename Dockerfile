FROM centos:7
MAINTAINER Jun-Hee Lee <jh.lee@n3n.io>

# Run upgrades
RUN yum -y update; yum clean all

# Install basic packages
RUN yum -y install wget net-tools perl yum-utils; yum clean all

# Install nodejs
#RUN curl -sL https://rpm.nodesource.com/setup | bash -
#RUN yum -y install nodejs; yum clean all
RUN wget http://artifactory.dev.n3n.io:8081/artifactory/ext-release-local/nodejs/nodejs/0.10.38/nodejs-0.10.38-1nodesource.el6.x86_64.rpm
RUN rpm -Uvh nodejs-0.10.38-1nodesource.el6.x86_64.rpm

# Install mono
RUN rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
RUN yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
RUN yum -y install mono-complete-4.2.1.102; yum clean all


CMD ["/bin/bash"]
