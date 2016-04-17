#!/bin/bash -ev



#
echo Install Java
#

echo get Java to install
cd /tmp 
#wget http://${release}/release/PreRequisites/${JAVA_FILE}
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77-linux-x64.tar.gz"



# extract java items
tar -xvzf ${JAVA_FILE}

# move installation to proper folder
mv jdk${JAVA_MAJOR_VERSION}_${JAVA_MINOR_VERSION} /opt/



#
# remove unused items, so not to waste space
#
rm -f  /tmp/${JAVA_FILE}
rm -rf ${JAVA_HOME}/db/{demo,docs,javadoc}
rm -rf ${JAVA_HOME}/lib/visualvm/platform/docs
rm -rf ${JAVA_HOME}/man
rm -f  ${JAVA_HOME}/src.zip
find   ${JAVA_HOME}/ -name *.bat  | xargs rm -f
find   ${JAVA_HOME}/ -name *.html | xargs rm -f
rm -rf /tmp/*
