#############################################################################
#
# Base Package
#  - creates a base environment all other packages can add to
#    - /etc/profile.d/add-docker-env.sh
#    - usefull for service, which strips all environment variables but TERM, PATH and LANG
#
#  - creates the following items
#    - JAVA              : /opt/jdk${JAVA_MAJOR_VERSION}_${JAVA_MINOR_VERSION}
#    - INSTALLATION DIR  : /opt/atithi/install-scripts
#    - CONFIG DIR        : /opt/atithi/configuration
#
#############################################################################

# Base image to start from
FROM centos:7

# Package maintainer
MAINTAINER SUDIP


#
# Set DOCKER Environment Variables
#
ENV JAVA_MAJOR_VERSION  1.8.0
ENV JAVA_MINOR_VERSION  77
ENV ANT_VERSION		1.9.4
ENV JPROFILER_VERSION   7_2_3 
ENV JPROFILER_FILE      jprofiler_linux_${JPROFILER_VERSION}.sh
ENV JPROFILER_HOME	/opt/jprofiler7
ENV JAVA_HOME           /opt/jdk${JAVA_MAJOR_VERSION}_${JAVA_MINOR_VERSION}
ENV JAVA_FILE           jdk-8u77-linux-x64.tar.gz
ENV ANT_HOME            /opt/apache-ant-${ANT_VERSION}
ENV CLASSPATH           .
ENV PATH                ${ANT_HOME}/bin:${JAVA_HOME}/bin:${JPROFILER_HOME}/bin:${PATH}

#
# Set environment variables
#  - needed when running services.
#
RUN echo export JAVA_MAJOR_VERSION=${JAVA_MAJOR_VERSION}    >>   /etc/profile.d/add-docker-env.sh   && \
    echo export JAVA_MINOR_VERSION=${JAVA_MINOR_VERSION}    >>   /etc/profile.d/add-docker-env.sh   && \
    echo export JAVA_HOME=${JAVA_HOME}                      >>   /etc/profile.d/add-docker-env.sh   && \
    echo export ANT_HOME=${ANT_HOME}                        >>   /etc/profile.d/add-docker-env.sh   && \
    echo export CLASSPATH=${CLASSPATH}                      >>   /etc/profile.d/add-docker-env.sh   && \
    echo export PATH=${PATH}                                >>   /etc/profile.d/add-docker-env.sh   && \
    chmod +x /etc/profile.d/add-docker-env.sh


#
# get startup sscripts
#
COPY etc/profile.d/java.sh            /etc/profile.d/java.sh
RUN  chmod +x /etc/profile.d/java.sh


#
# Get installation scripts
#
#COPY install-scripts/install-ant.sh        /opt/atithi/install-scripts/install-ant.sh
COPY install-scripts/install-java.sh       /opt/atithi/install-scripts/install-java.sh
#COPY install-scripts/install-jprofiler.sh  /opt/atithi/install-scripts/install-jprofiler.sh
RUN chmod +x /opt/atithi/install-scripts/*

#
# Install Java
#  - the main purpoise for running this in a separate shell script is to minimize disk / layer usage when creating docker image
#
RUN /opt/atithi/install-scripts/install-java.sh


#
# install ant
#  - the main purpoise for running this in a separate shell script is to minimize disk / layer usage when creating docker image
#
#RUN /opt/atithi/install-scripts/install-ant.sh

#
# install jprofiler
#  - the main purpoise for running this in a separate shell script is to minimize disk / layer usage when creating docker image
#
#RUN /opt/atithi/install-scripts/install-jprofiler.sh


# Set default WORKDIR
WORKDIR /tmp
