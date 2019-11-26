FROM centos:7
RUN yum -y update && yum clean all
RUN yum reinstall -y glibc-common && yum clean all
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime
RUN yum -y install vim 
RUN yum -y install which
RUN yum -y install sudo
RUN yum -y install epel-release
RUN yum -y install python-pip python-django git sqlite
RUN yum -y install jwhois
RUN yum -y install openssh-server
RUN yum -y install net-tools
RUN yum -y install iproute
RUN yum -y install jq
RUN yum -y install nc
RUN yum -y install wget tar make gcc autoconf bison re2c
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
RUN yum clean all
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
CMD ["/sbin/init"]
