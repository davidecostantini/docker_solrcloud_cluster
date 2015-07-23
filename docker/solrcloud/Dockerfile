FROM centos:7
MAINTAINER "Davide Costantini" <davide.costantini@infomentum.co.uk>
ENV container docker
RUN yum update -y; yum clean all

RUN mkdir -p /data/solr; cd /data/solr
ADD http://mirrors.ukfast.co.uk/sites/ftp.apache.org/lucene/solr/5.2.1/solr-5.2.1.tgz /data/solr

EXPOSE 8983