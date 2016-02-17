FROM ubuntu:14.04
MAINTAINER Lukasz Burylo <lukasz@burylo.com>

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN sudo add-apt-repository "deb http://mirror.jmu.edu/pub/mariadb/repo/10.0/ubuntu trusty main"
RUN apt-get update
RUN apt-get install -y mariadb-client mariadb-galera-server galera

VOLUME /var/lib/mysql

EXPOSE 3306 4444 4567 4568
CMD ["mysqld"]
