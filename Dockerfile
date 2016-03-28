FROM ubuntu:14.04
MAINTAINER Gert Jansen van Rensburg, gertjvr@gmail.com

ENV BOTDIR /opt/bot

ENV HUBOT_PORT 8080
ENV HUBOT_ADAPTER slack
ENV HUBOT_NAME jarvis

RUN apt-get update && \
  apt-get install -y wget && \
  wget -q -O - https://deb.nodesource.com/setup_4.x | sudo bash - && \ 
  apt-get install -y git build-essential python nodejs && \
  rm -rf /var/lib/apt/lists/* && \
  git clone --depth=1 https://github.com/TicketSolutionsPtyLtd/Hubot.git ${BOTDIR}

WORKDIR ${BOTDIR}

RUN npm install

CMD bin/hubot
