#
# This image is built automatically on http://hub.docker.com/datafairifier/ctp-baseimage
# To create an image based on this one put FROM datafairifier/ctp-baseimage at the top
# of your dockerfile
#
FROM datafairifier/dcd

RUN apt-get update && apt-get -y install python wget

#RUN pip install requests
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install requests

# Define build packages here so we can remove them later
ENV BUILD_PACKAGES="wget"
ENV INSTALL_HOME="/opt"

# Set the front-end to noninteractive so debconf does not complain
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opt/CTP/ROOT/CTPClient

# Copy the CTPClient files
COPY CTP.jar $INSTALL_HOME/CTP/ROOT/CTPClient/CTP.jar
COPY CTPClient.jar $INSTALL_HOME/CTP/ROOT/CTPClient/CTPClient.jar
COPY dcm4che-imageio-rle-2.0.25.jar $INSTALL_HOME/CTP/ROOT/CTPClient/dcm4che-imageio-rle-2.0.25.jar
COPY dcm4che.jar $INSTALL_HOME/CTP/ROOT/CTPClient/dcm4che.jar
COPY jdbm.jar $INSTALL_HOME/CTP/ROOT/CTPClient/jdbm.jar
COPY log4j.jar $INSTALL_HOME/CTP/ROOT/CTPClient/log4j.jar
COPY pixelmed_codec.jar $INSTALL_HOME/CTP/ROOT/CTPClient/pixelmed_codec.jar
COPY util.jar $INSTALL_HOME/CTP/ROOT/CTPClient/util.jar
COPY CTPClient.xsl $INSTALL_HOME/CTP/ROOT/CTPClient/CTPClient.xsl
COPY clientAnonymizerRetrieve.py $INSTALL_HOME/CTP/ROOT/CTPClient/clientAnonymizerRetrieve.py

# An empty base configuration
COPY config.xml $INSTALL_HOME/CTP/

RUN echo "*/1 * * * * root cd /opt/CTP/ROOT/CTPClient && python clientAnonymizerRetrieve.py" >> /etc/crontab

# Make sure the container accepts connections on port 8080
EXPOSE 8080
