FROM node:latest

ADD ./check /opt/resource/check
ADD ./in /opt/resource/in
ADD ./out /opt/resource/out

RUN chmod +x /opt/resource/*

RUN apt-get update
RUN apt-get install jq -y
RUN apt-get install git-all -y

RUN npm install --global cordova@latest
RUN npm install --global ionic@"2.2.1"

