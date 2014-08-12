FROM centos:centos6
MAINTAINER 0.1. NAME, NAME@example.jp
RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock

RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
RUN yum -y install httpd
RUN echo 'docker http server' > /var/www/html/index.html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-D", "FOREGROUND"]
