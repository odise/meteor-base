FROM node:0.10-slim

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
    && apt-get update && apt-get -y update \
    && apt-get -y install bzip2 curl
RUN npm install --silent -g forever phantomjs
 
# Install latest Meteor
RUN curl https://install.meteor.com | /bin/sh

# XXX: to install a specific version of Meteor the line:
# RELEASE="1.1.0.2"
# could be manipulated here

