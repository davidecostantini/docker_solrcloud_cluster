FROM centos:7
MAINTAINER "Davide Costantini" <davide.costantini@infomentum.co.uk>
ENV container docker

RUN yum update -y
RUN yum install -y wget tar java
RUN yum clean all

RUN mkdir -p /data/packages

WORKDIR /tmp

RUN $(which wget) -O zookeeper.tgz http://mirrors.ukfast.co.uk/sites/ftp.apache.org/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
RUN $(which tar) -zxf zookeeper.tgz
RUN mv /tmp/zookeeper-3.4.6 /data/zookeeper

WORKDIR /data/zookeeper

ADD zoo.cfg conf/

RUN mkdir /data/scripts

EXPOSE 3888 2888
CMD /data/scripts/run_zookeeper.sh