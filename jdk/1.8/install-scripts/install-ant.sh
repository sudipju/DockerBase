#!/bin/bash -ev

#
# Get installer to use
#  - put all files in /tmp folder
# 
cd /tmp
wget http://${release}/release/PreRequisites/apache-ant-${ANT_VERSION}-bin.zip
unzip apache-ant-${ANT_VERSION}-bin.zip


#
# move ant to proper folder
#  - create link to /usr/bin
#
mv apache-ant-${ANT_VERSION} /opt/
ln -s ${ANT_HOME}/bin/ant /usr/bin/ant


#
# remove unused items, so not to waste space
#
rm -rf ${ANT_HOME}/manual
rm -rf /tmp/*
