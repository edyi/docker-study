FROM centos:7
RUN yum -y update; yum clean all
RUN yum -y install epel-release
RUN yum -y install python-pip python-django git sqlite
RUN yum -y install jwhois
RUN yum -y install openssh-server
RUN yum -y install net-tools
RUN yum -y install iproute
RUN yum -y install wget tar make gcc autoconf bison re2c; yum clean all