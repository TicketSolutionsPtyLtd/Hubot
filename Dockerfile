FROM ubuntu:14.04
MAINTAINER Gert Jansen van Rensburg, gertjvr@gmail.com

ENV BOTDIR /opt/bot

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup | sudo bash - && \
  apt-get install -y git build-essential python2.7  nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 https://github.com/TicketSolutionsPtyLtd/Hubot.git ${BOTDIR}

WORKDIR ${BOTDIR}

RUN npm install
