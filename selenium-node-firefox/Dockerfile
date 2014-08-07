# Selenium Node: Firefox

FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN dpkg-divert --local --rename --add /sbin/initctl && rm /sbin/initctl && ln -s /bin/true /sbin/initctl

RUN apt-get install -y dialog software-properties-common python curl
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install oracle-java7-installer -y

RUN wget -P /opt https://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar

RUN apt-get install -y firefox xvfb

ADD start.sh /opt/start.sh

ENV DEBIAN_FRONTEND newt

CMD ["/bin/bash", "/opt/start.sh"]
