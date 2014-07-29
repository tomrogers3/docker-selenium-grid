#!/bin/bash

export DISPLAY=:10

echo "Starting Xvfb ..."
Xvfb :10 -screen 0 1366x768x24 -ac &

echo "Starting Google Chrome ..."
google-chrome --remote-debugging-port=9222 &

echo "Starting Selenium ..."
CONTAINER_IP=$(ip addr show dev eth0 | grep "inet " | awk '{print $2}' | cut -d '/' -f 1)
java -jar /opt/selenium-server-standalone-2.37.0.jar \
		-role webdriver -host ${CONTAINER_IP} \
		-hub http://${HUB_PORT_4444_TCP_ADDR}:4444/grid/register \
		-browser browserName=chrome,maxInstances=1,platform=LINUX \
		-Dwebdriver.chrome.driver=/usr/local/bin/chromedriver