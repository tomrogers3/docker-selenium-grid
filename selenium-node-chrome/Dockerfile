# Selenium Node: Chrome

FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN dpkg-divert --local --rename --add /sbin/initctl && rm /sbin/initctl && ln -s /bin/true /sbin/initctl

RUN apt-get install -y dialog
RUN apt-get install -y wget software-properties-common python curl unzip
RUN add-apt-repository ppa:webupd8team/java

# install Chrome dependencies
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install oracle-java7-installer -y

RUN wget -P /opt https://selenium.googlecode.com/files/selenium-server-standalone-2.39.0.jar

# install Chrome
RUN apt-get install -y google-chrome-stable xvfb

# install Chromedriver for use with Selenium
RUN wget -O /opt/chromedriver.zip http://chromedriver.storage.googleapis.com/2.10/chromedriver_linux64.zip && unzip /opt/chromedriver.zip -d /usr/local/bin && rm /opt/chromedriver.zip

ADD start.sh /opt/start.sh

ENV DEBIAN_FRONTEND newt

CMD ["/bin/bash", "/opt/start.sh"]
