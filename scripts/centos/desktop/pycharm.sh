#!/bin/bash

#wget -O /tmp/pycharm.tar.gz https://download.jetbrains.com/python/pycharm-community-2018.3.1.tar.gz
wget -O /tmp/pycharm.tar.gz https://download.jetbrains.com/python/pycharm-professional-2018.3.1.tar.gz

cd /tmp
tar -xzvf pycharm.tar.gz
mv pycharm /opt