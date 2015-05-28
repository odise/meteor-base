This is an example how to use this base image:

```
FROM odise/meteor-base:latest

# add your app to the container
ADD . /meteor
WORKDIR /meteor
 
# Bundle meteor src to /var/www/app
RUN meteor build --directory /var/www/app
RUN cd /var/www/app/bundle/programs/server/ && npm install
WORKDIR /var/www/app/bundle
 
#
# Default Meteor ENV settings for meteor app
# either change these or pass as --env in the docker run
ENV PORT 8282
ENV ROOT_URL "http://127.0.0.1"
ENV MONGO_URL "mongodb://127.0.0.1:3001/meteor"
 
# Expose container port 8080 to the host (outside the container)
EXPOSE 8282
 
RUN touch .foreverignore
 
# Define default command that runs the node app on container port 8282
CMD bash -c 'export METEOR_SETTINGS=`cat /meteor/settings.json` && forever -w ./main.js --production'
```


Size of the base image: ~530mb.
