#!/bin/bash -ev

#
# Get installer to use
#  - put all files in /tmp folder
# 
cd /tmp/
wget http://${release}/release/PreRequisites/${JPROFILER_FILE}
chmod +x ${JPROFILER_FILE}
./${JPROFILER_FILE} -q


#
# remove unused items, so not to waste space
#
rm -rf /tmp/*
