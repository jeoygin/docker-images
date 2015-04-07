FROM debian:wheezy

MAINTAINER Jeoygin Wang <jeoygin@gmail.com>

RUN \
  apt-get update && \
  apt-get install -y python-software-properties && \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  sed -i 's/wheezy/trusty/g' /etc/apt/sources.list.d/webupd8team-java-wheezy.list && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer
  
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

CMD java -version