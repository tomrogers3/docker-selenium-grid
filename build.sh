#!/bin/bash


docker build -t benschw/selenium-hub ./selenium-hub

docker build -t benschw/selenium-node-firefox ./selenium-node-firefox

docker build -t tomrogers3/selenium-node-chrome ./selenium-node-chrome
