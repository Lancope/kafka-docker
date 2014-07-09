FROM ubuntu

## install oracle java, not open-jdk
# add source for webupd8 java
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu quantal main" | tee -a /etc/apt/sources.list.d/java.sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -yq oracle-java7-installer

RUN wget -q http://apache.claz.org/kafka/0.8.1.1/kafka_2.9.2-0.8.1.1.tgz -O /tmp/kafka_2.9.2-0.8.1.1.tgz
RUN tar xfz /tmp/kafka_2.9.2-0.8.1.1.tgz -C /opt

ENV KAFKA_HOME /opt/kafka_2.9.2-0.8.1.1
ADD start-kafka.sh /usr/bin/start-kafka.sh 

## expose docker up to 3 brokers and zookeeper
EXPOSE 9092
EXPOSE 9093
EXPOSE 9094
EXPOSE 2181
CMD start-kafka.sh
